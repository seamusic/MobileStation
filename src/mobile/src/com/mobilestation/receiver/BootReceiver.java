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
		// �Զ�����������
		Log.i(TAG, "BootReceiver��ʼ���ܹ㲥");

		String action = intent.getAction();
		Log.i(TAG, "��ǰ���ܵĹ㲥�ǣ�" + action);
		// ���չ㲥��ϵͳ������ɺ����г���
		if (Intent.ACTION_BOOT_COMPLETED.equals(action)) {
			// �������
			AlarmManagerUtil.sendUpdateBroadcast(context);
			DBService.getInstance(context).appStart();
		}
		if (Intent.ACTION_TIME_TICK.equals(action)
				|| Intent.ACTION_USER_PRESENT.equals(action)) {
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			context.startService(i);
		}
		// ���չ㲥���豸���°�װ��һ��Ӧ�ó������
		if (Intent.ACTION_PACKAGE_ADDED.equals(action)) {
			String packageName = intent.getDataString().substring(8);
			Log.i(TAG, "��ǰ��װ�ĳ����ǣ�" + packageName);

			Intent i = new Intent();
			i.setAction("mobilestation.service.action.PACKAGE_ADDED");
			i.setClass(context, com.mobilestation.service.ReportService.class);
			context.startService(i);

			// ���浽���ݿ���
			DBService.getInstance(context).InstallApp(packageName);
		}
		// ���չ㲥���豸��ɾ����һ��Ӧ�ó������
		if (Intent.ACTION_PACKAGE_REMOVED.equals(action)) {
			String packageName = intent.getDataString().substring(8);
			Log.i(TAG, "��ǰɾ���ĳ����ǣ�" + packageName);

			// �����ݿ��б�����ɾ��
			// ���浽���ݿ���
			DBService.getInstance(context).RemoveApp(packageName);
		}
	}
}
