package com.mobilestation.util;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import android.util.Log;

import com.alibaba.fastjson.JSON;
import com.lidroid.xutils.HttpUtils;
import com.lidroid.xutils.exception.HttpException;
import com.lidroid.xutils.http.RequestParams;
import com.lidroid.xutils.http.ResponseInfo;
import com.lidroid.xutils.http.callback.RequestCallBack;
import com.lidroid.xutils.http.client.HttpRequest.HttpMethod;
import com.mobilestation.entities.MobileApp;
import com.mobilestation.entities.RunLog;
import com.mobilestation.service.DBService;

public class PostData {

	private static final String TAG = "PostData";
	private Context context;
	private String deviceId;
	private String model;
	private String handSetInfo;
	private String SERVER_URL = "http://58.64.194.214:8080";

	public static boolean isNetworkAvailable(Context context) {
		ConnectivityManager cm = (ConnectivityManager) context
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		if (cm == null) {
		} else {
			// 如果仅仅是用来判断网络连接
			// 则可以使用 cm.getActiveNetworkInfo().isAvailable();
			NetworkInfo[] info = cm.getAllNetworkInfo();
			if (info != null) {
				for (int i = 0; i < info.length; i++) {
					if (info[i].getState() == NetworkInfo.State.CONNECTED) {
						return true;
					}
				}
			}
		}
		return false;
	}

	public PostData(Context context) {
		this.context = context;
		SharedPreferences sharedPreferences = context.getSharedPreferences(
				"setting", 0);
		SERVER_URL = sharedPreferences.getString("SERVER_URL", SERVER_URL);

		TelephonyManager tm = (TelephonyManager) this.context
				.getSystemService(Context.TELEPHONY_SERVICE);
		deviceId = tm.getDeviceId();
		model = android.os.Build.MODEL;
		handSetInfo = "系统版本:" + android.os.Build.VERSION.RELEASE + ",厂商"
				+ android.os.Build.MANUFACTURER;
	}

	public void SyncMobileApp() {
		String requestUrl = SERVER_URL + "/Data/GetSyncMobileApp";
		RequestParams params = new RequestParams();
		params.addBodyParameter("ClientKey", deviceId);
		params.addBodyParameter("ClientName", handSetInfo);
		params.addBodyParameter("PhoneModelID", model);

		try {
			HttpUtils http = new HttpUtils();
			if (isNetworkAvailable(this.context)) {
				http.send(HttpMethod.POST, requestUrl, params,
						new RequestCallBack<String>() {
							@Override
							public void onFailure(HttpException arg0,
									String arg1) {
								// TODO Auto-generated method stub
								String msg = String.format(
										"同步客户端程序失败，错误信息为：%1$s", arg1);
								Log.i(TAG, msg);
							}

							@Override
							public void onSuccess(ResponseInfo<String> response) {
								// TODO Auto-generated method stub
								Log.i(TAG, "SyncMobileApp" + response.result);
								if (response.statusCode == 200) {
									List<MobileApp> retList = JSON.parseArray(
											response.result, MobileApp.class);
									if (retList != null && retList.size() > 0) {
										Log.i(TAG, "写入到数据库中");
										DBService.getInstance(context)
												.SyncMobileApp(retList);

										HasDownMobileApp(retList);
									}
								}
							}
						});
			}

		} catch (Exception e) {
			// TODO: handle exception
			Log.i(TAG, String.format("同步客户端程序出错，错误信息为：%1$s", e.getMessage()));
			e.printStackTrace();
		}
	}

	public void HasDownMobileApp(List<MobileApp> retList) {
		if (retList == null || retList.size() == 0)
			return;

		List<String> packs = new ArrayList<String>();
		for (MobileApp app : retList) {
			packs.add(app.PackageName);
		}

		String requestUrl = SERVER_URL + "/Data/HasDownMobileApp";
		RequestParams params = new RequestParams();
		String jsonData = JSON.toJSONString(packs);
		params.addBodyParameter("ClientKey", deviceId);
		params.addBodyParameter("mobileApps", jsonData);

		try {
			HttpUtils http = new HttpUtils();
			if (isNetworkAvailable(this.context)) {
				http.send(HttpMethod.POST, requestUrl, params,
						new RequestCallBack<String>() {
							@Override
							public void onFailure(HttpException arg0,
									String arg1) {
								// TODO Auto-generated method stub
								Log.i(TAG, arg1);
							}

							@Override
							public void onSuccess(ResponseInfo<String> response) {
								// TODO Auto-generated method stub
								Log.i(TAG, response.result);
								if (response.statusCode == 200) {
									Log.i(TAG, "HasDownMobileApp success");
								}
							}
						});
			}
		} catch (Exception e) {
			// TODO: handle exception
			Log.i(TAG, String.format("判断是否下载程序出错，错误信息为：%1$s", e.getMessage()));
			e.printStackTrace();
		}
	}

	public void PushMobileApp() {
		String requestUrl = SERVER_URL + "/Data/PushMobileApp";
		Log.i(TAG, requestUrl);
		final List<MobileApp> retList = DBService.getInstance(context)
				.GetSyncMobileApp();
		Log.i(TAG, "需要推送的数量：" + retList.size());
		if (retList == null || retList.size() == 0) {
			return;
		}

		RequestParams params = new RequestParams();
		String jsonData = JSON.toJSONStringWithDateFormat(retList,
				"yyyy-MM-dd HH:mm:ss");
		Log.i(TAG, jsonData);

		params.addBodyParameter("ClientKey", deviceId);
		params.addBodyParameter("mobileApps", jsonData);

		try {
			HttpUtils http = new HttpUtils();

			if (isNetworkAvailable(this.context)) {
				http.send(HttpMethod.POST, requestUrl, params,
						new RequestCallBack<String>() {
							@Override
							public void onFailure(HttpException arg0,
									String arg1) {
								// TODO Auto-generated method stub
								Log.i(TAG, "开始推送数据");
							}

							@Override
							public void onSuccess(ResponseInfo<String> response) {
								// TODO Auto-generated method stub
								Log.i(TAG, response.result);
								if (response.statusCode == 200) {
									try {
										Log.i(TAG, "推送结果" + response.result);
										JSONObject jsonObject = new JSONObject(
												response.result);

										boolean result = jsonObject
												.getBoolean("Result");
										String message = jsonObject
												.getString("Message");
										if (!result) {
											Log.i(TAG, "同步失败：" + message);
										} else {
											Log.i(TAG, "同步成功");
										}
									} catch (JSONException e) {
										Log.e(TAG, "JSON转换出错");
										e.printStackTrace();
									}
								}
							}
						});
			}
		} catch (Exception e) {
			// TODO: handle exception
			Log.i(TAG, String.format("摄推送数据出错，错误信息为：%1$s", e.getMessage()));
			e.printStackTrace();
		}
	}

	public void Registered() {
		String requestUrl = SERVER_URL + "/Data/Registered";
		Log.i(TAG, requestUrl);

		RequestParams params = new RequestParams();
		params.addBodyParameter("ClientKey", deviceId);
		params.addBodyParameter("ClientName", handSetInfo);
		params.addBodyParameter("PhoneModelID", model);

		try {

			HttpUtils http = new HttpUtils();

			if (isNetworkAvailable(this.context)) {
				http.send(HttpMethod.POST, requestUrl, params,
						new RequestCallBack<String>() {
							@Override
							public void onFailure(HttpException arg0,
									String arg1) {
								// TODO Auto-generated method stub
								Log.i(TAG, arg1);
							}

							@Override
							public void onSuccess(ResponseInfo<String> response) {
								// TODO Auto-generated method stub
								Log.i(TAG, response.result);
								if (response.statusCode == 200) {
									try {
										JSONObject jsonObject = new JSONObject(
												response.result);

										boolean result = jsonObject
												.getBoolean("Result");
										String message = jsonObject
												.getString("Message");
										if (!result) {
											if (message == null
													|| message == "") {
												// 已经注册过了
												Log.i(TAG, "已经注册");
											} else {
												Log.i(TAG, "注册失败：" + message);
											}
										} else {
											Log.i(TAG, "注册成功");
										}
									} catch (JSONException e) {
										// TODO Auto-generated catch block
										Log.e(TAG, "JSON转换出错");
										e.printStackTrace();
									}
								}
							}
						});
			}

		} catch (Exception e) {
			// TODO: handle exception
			Log.i(TAG, String.format("注册客户端时出错，错误信息为：%1$s", e.getMessage()));
			e.printStackTrace();
		}
	}

	// /同步日志
	public void SyncRunLog() {
		String requestUrl = SERVER_URL + "/Data/SyncRunLog";
		Log.i(TAG, requestUrl);

		final List<RunLog> retList = DBService.getInstance(context)
				.GetSyncLog();
		Log.i(TAG, "需要推送的数量：" + retList.size());
		if (retList == null || retList.size() == 0) {
			return;
		}

		RequestParams params = new RequestParams();
		String jsonData = JSON.toJSONStringWithDateFormat(retList,
				"yyyy-MM-dd HH:mm:ss");
		Log.i(TAG, jsonData);

		params.addBodyParameter("clientKey", deviceId);
		params.addBodyParameter("data", jsonData);

		try {

			HttpUtils http = new HttpUtils();

			if (isNetworkAvailable(this.context)) {
				http.send(HttpMethod.POST, requestUrl, params,
						new RequestCallBack<String>() {
							@Override
							public void onFailure(HttpException arg0,
									String arg1) {
								// TODO Auto-generated method stub
								Log.i(TAG, arg1);
							}

							@Override
							public void onSuccess(ResponseInfo<String> response) {
								// TODO Auto-generated method stub
								Log.i(TAG, response.result);
								if (response.statusCode == 200) {
									try {
										JSONObject jsonObject = new JSONObject(
												response.result);

										boolean result = jsonObject
												.getBoolean("Result");
										String message = jsonObject
												.getString("Message");
										if (!result) {
											Log.i(TAG, "同步失败：" + message);
										} else {
											DBService.getInstance(context)
													.UpdateSyncLog(retList);
											Log.i(TAG, "同步成功");
										}
									} catch (JSONException e) {
										// TODO Auto-generated catch block
										Log.e(TAG, "JSON转换出错");
										e.printStackTrace();
									}
								}
							}
						});
			}
		} catch (Exception e) {
			// TODO: handle exception
			Log.i(TAG, String.format("同步日志时出错，错误信息为：%1$s", e.getMessage()));
			e.printStackTrace();
		}
	}
}
