package com.mobilestation.receiver;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningServiceInfo;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class TimeBroadcastReceiver extends BroadcastReceiver{
	private static final String TAG = "TimeBroadcastReceiver";

	@Override
	public void onReceive(Context context, Intent intent) {
		// TODO Auto-generated method stub
			boolean isServiceRunning = false;
			Log.i(TAG, "收到广播通知:"+intent.getAction());

			if (intent.getAction().equals(Intent.ACTION_TIME_TICK)) {
				// 检查Service状态
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
					Intent i = new Intent(context,
							com.mobilestation.service.ReportService.class);
					context.startService(i);
				}

			}
	}
	
}
