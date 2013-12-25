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
		// �Զ�����������
		Log.i("Alarmreceiver", "�յ��㲥֪ͨ:"+intent.getAction());
		if (intent.getAction().equals("mobilestation.alarm.action")) {
			Intent i = new Intent();
			i.setClass(context, com.mobilestation.service.ReportService.class);
			// ����service
			// ��ε���startService�������������service ���ǻ��ε���onStart
			context.startService(i);
		}
	}

}
