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
		// �Զ�����������
		Log.i("BootCompleteReceiver", "׼�������������");

		if (Intent.ACTION_BOOT_COMPLETED.equals(mintent.getAction())) {
			//����ͬ������
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			// ����service
			// ��ε���startService�������������service ���ǻ��ε���onStart
			context.startService(i);
			
			// �������
			Intent intent = new Intent(context, Alarmreceiver.class);
			intent.setAction("mobilestation.alarm.action");
			PendingIntent sender = PendingIntent.getBroadcast(context, 0,intent, 0);
			long firstime = SystemClock.elapsedRealtime();
			AlarmManager am = (AlarmManager) context
					.getSystemService(Context.ALARM_SERVICE);

			// 30��һ�����ڣ���ͣ�ķ��͹㲥
			am.setRepeating(AlarmManager.ELAPSED_REALTIME_WAKEUP, firstime,
					30 * 1000, sender);
		}
		
		//ע��ͻ���
		PostData postData=new com.mobilestation.util.PostData(context);
		postData.Registered();


/*		Intent service = new Intent(context,
				com.mobilestation.service.ReportService.class);
		service.setAction("mobilestation.service.BootService");
		context.startService(service);*/
	}

}
