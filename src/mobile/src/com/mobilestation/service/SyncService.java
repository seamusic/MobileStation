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
		Log.i(TAG, "准备启动同步服务");
		long endTime = System.currentTimeMillis() + 5 * 1000;
		while (System.currentTimeMillis() < endTime) {
			synchronized (this) {
				Log.i(TAG, "启动同步服务");
				try {
					Log.i(TAG, "同步服务ing");
					//获取最新的列表
					PostData postData=new PostData(this);
					//postData.GetMobileApp();
					//写入到数据库中
					//推送最新的数据
					
					wait(endTime - System.currentTimeMillis());
				} catch (Exception e) {
				}
			}
		}
	}
}
