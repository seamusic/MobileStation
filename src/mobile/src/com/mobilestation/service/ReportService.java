package com.mobilestation.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;

import com.mobilestation.util.PostData;
import com.mobilestation.util.RunningApp;

public class ReportService extends Service {
	private static final String TAG = "ReportService";
	private Handler mPeriodicEventHandler;
	private int PERIODIC_EVENT_TIMEOUT = 60 * 1000;
	private Handler getRunningEventHandler;
	private int GETRUNNINGAPP_EVENT_TIMEOUT = 2 * 1000;
	private static List<String> lastRunningAppList = new ArrayList<String>();
	private final int APP_START = 1;
	private final int APP_STOP = 2;
	private final int SYNC_APP = 3;
	private final int PUSH_APP = 4;
	private final int APP_SUMTIME = 5;
	private final int SYNC_LOG = 6;
	Context context;
	private Map<String, Integer> appTimeMap;
	private int runTime = 0;
	private long lastTime;

	@Override
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void onCreate() {
		super.onCreate();
		Log.i(TAG, "onCreate");
		context = getApplicationContext();
		lastTime = System.currentTimeMillis();

		SharedPreferences sharedPreferences = context.getSharedPreferences(
				"setting", MODE_PRIVATE);
		PERIODIC_EVENT_TIMEOUT = sharedPreferences.getInt("POST_INTERVAL",
				PERIODIC_EVENT_TIMEOUT);
		GETRUNNINGAPP_EVENT_TIMEOUT = sharedPreferences.getInt(
				"CHECKAPP_INTERVAL", GETRUNNINGAPP_EVENT_TIMEOUT);

		UpgradeService upgrade = new UpgradeService(context);
		upgrade.Upgrade(true);

		PostData postData = new PostData(context);
		// 注册客户端
		postData.Registered();
		// 同步服务器的列表
		postData.SyncMobileApp();

		appTimeMap = DBService.getInstance(context).getSavedApp();

		// getImieStatus();
		mPeriodicEventHandler = new Handler();
		mPeriodicEventHandler.postDelayed(doPeriodicTask,
				PERIODIC_EVENT_TIMEOUT);

		getRunningEventHandler = new Handler();
		getRunningEventHandler.postDelayed(doGetRunningAppTask,
				GETRUNNINGAPP_EVENT_TIMEOUT);
	}

	@Override
	// 当调用者使用startService()方法启动Service时，该方法被调用
	public void onStart(Intent intent, int startId) {
		super.onStart(intent, startId);
		String action = intent.getAction();
		Log.i(TAG, "Service onStart--->" + action);
	}

	@Override
	public void onDestroy() {
		Log.i(TAG, "onDestroy");
		mPeriodicEventHandler.removeCallbacks(doPeriodicTask);
		getRunningEventHandler.removeCallbacks(doGetRunningAppTask);
		Intent localIntent = new Intent();
		localIntent.setClass(this,
				com.mobilestation.service.ReportService.class); // 销毁时重新启动Service
		this.startService(localIntent);
		super.onDestroy();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		return START_STICKY;
	}

	private Runnable doPeriodicTask = new Runnable() {
		public void run() {
			// 获取最新的列表
			Message syncMsg = new Message();
			syncMsg.what = SYNC_APP;
			handler.sendMessage(syncMsg);
			Message syncLog = new Message();
			syncLog.what = SYNC_LOG;
			handler.sendMessage(syncLog);

			mPeriodicEventHandler.postDelayed(doPeriodicTask,
					PERIODIC_EVENT_TIMEOUT);
		}
	};

	private Runnable doGetRunningAppTask = new Runnable() {
		public void run() {
			Long interval = (System.currentTimeMillis() - lastTime) / 1000;
			Log.i(TAG, "current interval:" + interval);
			RunningApp runningApp = new RunningApp(context);
			List<String> list = runningApp.GetRunningPackName();
			runTime += GETRUNNINGAPP_EVENT_TIMEOUT;

			// 只是计时
			for (String packName : list) {
				if (appTimeMap.containsKey(packName)) {
					Integer i = appTimeMap.get(packName);
					i += interval.intValue();
					appTimeMap.put(packName, i);
				} else {
					appTimeMap.put(packName, interval.intValue());
				}
			}

			// 判断停止的程序
			if (lastRunningAppList.size() > 0) {
				for (String packageName : lastRunningAppList) {
					if (!list.contains(packageName)) {
						Integer totalTime = 0;
						if (appTimeMap.containsKey(packageName)) {
							totalTime = appTimeMap.get(packageName);
							appTimeMap.remove(packageName);
						}

						Message message = new Message();
						message.what = APP_STOP;
						Bundle data = new Bundle();
						data.putString("packageName", packageName);
						data.putInt("totalTime", totalTime);
						message.setData(data);
						handler.sendMessage(message);

						Log.i(TAG, "刚停止运行的程序：" + packageName);
					}
				}
			}
			// 新运行的程序
			for (String packageName : list) {
				if (!lastRunningAppList.contains(packageName)) {
					Message message = new Message();
					message.what = APP_START;
					Bundle data = new Bundle();
					data.putString("packageName", packageName);
					message.setData(data);
					handler.sendMessage(message);

					lastRunningAppList.add(packageName);

					Log.i(TAG, "新运行的程序：" + packageName);
				}
			}

			lastRunningAppList = list;

			if (runTime > (PERIODIC_EVENT_TIMEOUT)) {
				Log.i(TAG, "已到时间，准备计算程序运行时间" + runTime);
				Message message = new Message();
				message.what = APP_SUMTIME;
				handler.sendMessage(message);
			}

			getRunningEventHandler.postDelayed(doGetRunningAppTask,
					GETRUNNINGAPP_EVENT_TIMEOUT);
			lastTime = System.currentTimeMillis();
		}
	};

	private Handler handler = new Handler() {
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case APP_START:
				// 新运行的程序，更新数据库
				String packName = msg.getData().getString("packageName");
				DBService.getInstance(context).startApp(packName);
				break;
			case APP_STOP:
				// 新运行的程序，更新数据库
				String packageName = msg.getData().getString("packageName");
				int totalTime = msg.getData().getInt("totalTime");
				DBService.getInstance(context).stopApp(packageName, totalTime);
				break;
			case SYNC_APP:
				new Thread() {
					public void run() {
						PostData postData = new PostData(context);
						postData.SyncMobileApp();
					}
				}.start();
				break;
			case PUSH_APP:
				break;
			case APP_SUMTIME:
				new Thread() {
					public void run() {
						DBService.getInstance(context).calcAppRunningTime(
								appTimeMap);
						resetTimeMap();
						PostData postData = new PostData(context);
						postData.PushMobileApp();
					}
				}.start();
				break;
			case SYNC_LOG:
				new Thread(){
					public void run(){
						PostData postData = new PostData(context);
						postData.SyncRunLog();
						//删除30天前日志
						DBService.getInstance(context)
								.delHasSyncLog();
					}
				}.start();
				break;
			}
		};
	};

	private void resetTimeMap() {
		if (appTimeMap == null) {
			appTimeMap = DBService.getInstance(context).getSavedApp();
		}
		for (String dataKey : appTimeMap.keySet()) {
			appTimeMap.put(dataKey, 0);
		}

		runTime = 0;
	}
}
