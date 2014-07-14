package com.mobilestation.receiver;

import com.mobilestation.util.PostData;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.util.Log;

public class BootCompleteReceiver extends BroadcastReceiver {
	private static final String ACTION = "android.intent.action.BOOT_COMPLETED";

	@Override
	public void onReceive(Context context, Intent mintent) {
		// 自动启动本服务
		Log.i("BootCompleteReceiver", "准备启动报告服务");

		if (Intent.ACTION_BOOT_COMPLETED.equals(mintent.getAction())) {
			//启动同步服务
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			// 启动service
			// 多次调用startService并不会启动多个service 而是会多次调用onStart
			context.startService(i);
			
			// 启动完成
			Intent intent = new Intent(context, Alarmreceiver.class);
			intent.setAction("mobilestation.alarm.action");
			PendingIntent sender = PendingIntent.getBroadcast(context, 0,intent, 0);
			long firstime = SystemClock.elapsedRealtime();
			AlarmManager am = (AlarmManager) context
					.getSystemService(Context.ALARM_SERVICE);

			// 30秒一个周期，不停的发送广播
			am.setRepeating(AlarmManager.ELAPSED_REALTIME_WAKEUP, firstime,
					30 * 1000, sender);
		}
		
		//注册客户端
		PostData postData=new com.mobilestation.util.PostData(context);
		postData.Registered();


/*		Intent service = new Intent(context,
				com.mobilestation.service.ReportService.class);
		service.setAction("mobilestation.service.BootService");
		context.startService(service);*/
	}

}
