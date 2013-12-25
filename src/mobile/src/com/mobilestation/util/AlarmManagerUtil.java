package com.mobilestation.util;

import com.mobilestation.receiver.Alarmreceiver;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.util.Log;

public class AlarmManagerUtil {
	private static final String TAG = "AlarmManagerUtil";
	public static AlarmManager getAlarmManager(Context ctx) {
		return (AlarmManager) ctx.getSystemService(Context.ALARM_SERVICE);
	}

	/**
	 * 指定时间后进行更新赛事信息(有如闹钟的设置) 注意: Receiver记得在manifest.xml中注册
	 * 
	 * @param ctx
	 */
	public static void sendUpdateBroadcast(Context ctx) {
		Log.i(TAG, "send to start update broadcase,delay time :" + 20000);

		AlarmManager am = getAlarmManager(ctx);
		// 60秒后将产生广播,触发ReportService的执行,这个方法才是真正的更新数据的操作主要代码
		Intent i = new Intent(ctx,
				Alarmreceiver.class);
		i.setAction("mobilestation.alarm.action");
		PendingIntent pendingIntent = PendingIntent.getBroadcast(ctx, 0, i, 0);
		am.set(AlarmManager.RTC, System.currentTimeMillis() + 20000,
				pendingIntent);
	}

	/**
	 * 取消定时执行(有如闹钟的取消)
	 * 
	 * @param ctx
	 */
	public static void cancelUpdateBroadcast(Context ctx) {
		AlarmManager am = getAlarmManager(ctx);
		Intent i = new Intent(ctx,
				Alarmreceiver.class);
		PendingIntent pendingIntent = PendingIntent.getBroadcast(ctx, 0, i, 0);
		am.cancel(pendingIntent);
	}
}
