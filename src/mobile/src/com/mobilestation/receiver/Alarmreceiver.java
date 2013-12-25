package com.mobilestation.receiver;

import com.mobilestation.bean.PackagesInfo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class Alarmreceiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {
		// TODO Auto-generated method stub
		// 自动启动本服务
		Log.i("Alarmreceiver", "收到广播通知:"+intent.getAction());
		if (intent.getAction().equals("mobilestation.alarm.action")) {
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			// 启动service
			// 多次调用startService并不会启动多个service 而是会多次调用onStart
			context.startService(i);
		}
	}

}
