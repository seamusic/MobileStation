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
	 * ָ��ʱ�����и���������Ϣ(�������ӵ�����) ע��: Receiver�ǵ���manifest.xml��ע��
	 * 
	 * @param ctx
	 */
	public static void sendUpdateBroadcast(Context ctx) {
		Log.i(TAG, "send to start update broadcase,delay time :" + 20000);

		AlarmManager am = getAlarmManager(ctx);
		// 60��󽫲����㲥,����ReportService��ִ��,����������������ĸ������ݵĲ�����Ҫ����
		Intent i = new Intent(ctx,
				Alarmreceiver.class);
		i.setAction("mobilestation.alarm.action");
		PendingIntent pendingIntent = PendingIntent.getBroadcast(ctx, 0, i, 0);
		am.set(AlarmManager.RTC, System.currentTimeMillis() + 20000,
				pendingIntent);
	}

	/**
	 * ȡ����ʱִ��(�������ӵ�ȡ��)
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
