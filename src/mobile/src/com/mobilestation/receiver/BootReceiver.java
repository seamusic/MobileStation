package com.mobilestation.receiver;

import com.mobilestation.service.DBService;
import com.mobilestation.service.LooperThread;
import com.mobilestation.util.AlarmManagerUtil;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;

public class BootReceiver extends BroadcastReceiver {
	private static final String ACTION = "android.intent.action.BOOT_COMPLETED";
	private static final String TAG = "com.mobilestation.receiver.BootReceiver";

	private static final int PACKAGE_ADDED = 1;
	private static final int PACKAGE_REMOVED = 2;

	@Override
	public void onReceive(Context context, Intent intent) {
		// 自动启动本服务
		Log.i(TAG, "BootReceiver开始接受广播");

		String action = intent.getAction();
		Log.i(TAG, "当前接受的广播是：" + action);
		// 接收广播：系统启动完成后运行程序
		if (Intent.ACTION_BOOT_COMPLETED.equals(action)) {
			// 启动完成
			AlarmManagerUtil.sendUpdateBroadcast(context);
			DBService.getInstance(context).appStart();
		}
		if (Intent.ACTION_TIME_TICK.equals(action)
				|| Intent.ACTION_USER_PRESENT.equals(action)) {
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			context.startService(i);
		}
		// 接收广播：设备上新安装了一个应用程序包后。
		if (Intent.ACTION_PACKAGE_ADDED.equals(action)) {
			String packageName = intent.getDataString().substring(8);
			Log.i(TAG, "当前安装的程序是：" + packageName);

			Intent i = new Intent();
			i.setAction("mobilestation.service.action.PACKAGE_ADDED");
			i.setClass(context, com.mobilestation.service.ReportService.class);
			context.startService(i);

			// 保存到数据库中
			DBService.getInstance(context).InstallApp(packageName);
		}
		// 接收广播：设备上删除了一个应用程序包。
		if (Intent.ACTION_PACKAGE_REMOVED.equals(action)) {
			String packageName = intent.getDataString().substring(8);
			Log.i(TAG, "当前删除的程序是：" + packageName);

			// 从数据库中标明已删除
			// 保存到数据库中
			DBService.getInstance(context).RemoveApp(packageName);
		}
	}
}
