package com.mobilestation.service;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;

public class LooperThread extends Thread { 
	private static final String TAG = "LooperThread";
	
	private static final int PACKAGE_ADDED = 1;
	private static final int PACKAGE_REMOVED = 2;
	private static final int SYNC_DATA = 3;
	private static final int GET_NEW_RUNNINGAPP = 4;
	
    public Handler handler;

    public void run() { 
        Looper.prepare();

        handler = new Handler() { 
            public void handleMessage(Message msg) { 
    			super.handleMessage(msg);
    			Log.i(TAG, "Handler message--->");

    			String packageName = msg.getData().getString("packageName");
    			switch (msg.what) {
    			case PACKAGE_ADDED:
    				if (packageName == "")
    					break;
    				else {
    					addPackage(packageName);
    				}
    				// 数据库里插入一条数据
    				break;
    			case PACKAGE_REMOVED:
    				if (packageName == "")
    					break;
    				else {
    					removePackage(packageName);
    				}
    				break;
    			case SYNC_DATA:
    				Log.i(TAG, "注册客户端2");
    				//syncData();
    				break;
    			case GET_NEW_RUNNINGAPP:
    				Log.i(TAG, "注册客户端2");
    				getNewRunningApp();
    				break;
    			case -1:
    				break;
    			}
            } 
        };

        Looper.loop(); 
    } 
    
    public void addPackage(String packageName){
		Log.i(TAG, "addPackage");
	}
	
	public void removePackage(String packageName){
		Log.i(TAG, "removePackage");
	}
	
	public void getNewRunningApp(){
		Log.i(TAG, "getNewRunningApp");
		
	}
}
