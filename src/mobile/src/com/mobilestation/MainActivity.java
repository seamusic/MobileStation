package com.mobilestation;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;

import com.mobilestation.receiver.TimeBroadcastReceiver;
import com.mobilestation.util.AlarmManagerUtil;

public class MainActivity extends Activity {
	private static final String TAG = "DetailProceess";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.activity_main);
		// runService();

		Log.i(TAG, "����ʼ����");

		SharedPreferences sharedPreferences = getSharedPreferences("setting",
				MODE_PRIVATE);
		Editor editor = sharedPreferences.edit();// ��ȡ�༭��
		editor.putString("SERVER_URL", "http://192.168.192.184");
		editor.putString("APK_PATH",
				"http://58.64.194.214:8080/Content/android.apk");
		editor.putString("UPDATE_SERVER", "http://192.168.192.184");
		editor.putString("UPDATE_VERJSON", "ver.json");
		editor.putInt("POST_INTERVAL", 60 * 1000);
		editor.putInt("CHECKAPP_INTERVAL", 10 * 1000);
		editor.commit();// �ύ�޸�

		AlarmManagerUtil.sendUpdateBroadcast(this.getApplicationContext());

		TimeBroadcastReceiver timeBroadcastReceiver = new TimeBroadcastReceiver();
		// ���ý��յ�action
		IntentFilter filter = new IntentFilter();
		filter.addAction("android.intent.action.TIME_TICK");
		registerReceiver(timeBroadcastReceiver, filter);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	private void runService() {
		// ����Intent
		Intent intent = new Intent();
		// ����Class����
		intent.setClass(MainActivity.this,
				com.mobilestation.service.ReportService.class);
		// ������Service
		startService(intent);

		/*
		 * Intent i=new Intent(MainActivity.this,
		 * com.mobilestation.service.SyncService.class); startService(i);
		 */
	}

}
