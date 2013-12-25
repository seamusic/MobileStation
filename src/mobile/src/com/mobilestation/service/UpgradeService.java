package com.mobilestation.service;

import java.io.File;

import org.json.JSONArray;
import org.json.JSONObject;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.util.Log;

import com.lidroid.xutils.HttpUtils;
import com.lidroid.xutils.exception.HttpException;
import com.lidroid.xutils.http.HttpHandler;
import com.lidroid.xutils.http.ResponseInfo;
import com.lidroid.xutils.http.callback.RequestCallBack;
import com.mobilestation.updateapk.NetworkTool;

public class UpgradeService {

	private static final String TAG = "Update";
	private Handler handler = new Handler();
	Context context;
	public static String UPDATE_SERVER = "http://10.20.147.117/jtapp12/";
	public static final String UPDATE_APKNAME = "mobilestation.apk";
	public static final String UPDATE_VERJSON = "ver.json";
	public static final String UPDATE_SAVENAME = "mobilestation_up.apk";
	int newVerCode;
	String newVerName;

	public UpgradeService(Context context) {
		this.context = context;
		SharedPreferences sharedPreferences = context.getSharedPreferences(
				"setting", context.MODE_PRIVATE);

		UPDATE_SERVER = sharedPreferences.getString("UPDATE_SERVER",
				UPDATE_SERVER);
	}

	public void Upgrade(boolean silence) {
		boolean needUpgrade = getServerVerCode();
		if (needUpgrade && silence) {
			String url = UPDATE_SERVER + UPDATE_APKNAME;
			download(url);
		}
	}

	private boolean getServerVerCode() {
		try {
			String verjson = NetworkTool.getContent(UPDATE_SERVER
					+ UPDATE_VERJSON);
			JSONArray array = new JSONArray(verjson);
			if (array.length() > 0) {
				JSONObject obj = array.getJSONObject(0);
				try {
					newVerCode = Integer.parseInt(obj.getString("verCode"));
					newVerName = obj.getString("verName");
				} catch (Exception e) {
					newVerCode = -1;
					newVerName = "";
					return false;
				}
			}
		} catch (Exception e) {
			Log.e(TAG, e.getMessage());
			return false;
		}
		return true;
	}

	void download(String url) {
		Log.i(TAG, "download url and filename:" + url);
		HttpUtils http = new HttpUtils();
		String savePath = Environment.getExternalStorageDirectory()
				+ UPDATE_SAVENAME;
		Log.i(TAG, "save filename:" + savePath);
		HttpHandler handler = http.download(url, savePath, false, false,
				new RequestCallBack<File>() {
					@Override
					public void onStart() {
					}

					@Override
					public void onLoading(long total, long current,
							boolean isUploading) {
						// testTextView.setText(current + "/" + total);
					}

					@Override
					public void onSuccess(ResponseInfo<File> responseInfo) {
						// testTextView.setText("downloaded:" +
						String path = responseInfo.result.getPath();
						Log.i(TAG, "downloaded :" + path);						
						Intent intent = new Intent(Intent.ACTION_VIEW);
						intent.setDataAndType(Uri.fromFile(new File(path)),
								"application/vnd.android.package-archive");
					}

					@Override
					public void onFailure(HttpException error, String msg) {
						// testTextView.setText(msg);
					}
				});
	}
}
