package com.mobilestation.service;

import com.mobilestation.util.PostData;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

public class SyncService extends IntentService {
	private static final String TAG = "com.mobilestation.service.SyncService";

	public SyncService() {
		super("hello");
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void onHandleIntent(Intent intent) {
		Log.i(TAG, "׼������ͬ������");
		long endTime = System.currentTimeMillis() + 5 * 1000;
		while (System.currentTimeMillis() < endTime) {
			synchronized (this) {
				Log.i(TAG, "����ͬ������");
				try {
					Log.i(TAG, "ͬ������ing");
					//��ȡ���µ��б�
					PostData postData=new PostData(this);
					//postData.GetMobileApp();
					//д�뵽���ݿ���
					//�������µ�����
					
					wait(endTime - System.currentTimeMillis());
				} catch (Exception e) {
				}
			}
		}
	}
}
