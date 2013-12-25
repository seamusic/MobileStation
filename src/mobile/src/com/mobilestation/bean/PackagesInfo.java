package com.mobilestation.bean;

import java.util.List;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.util.Log;

public class PackagesInfo {

	private static final String TAG = "PackagesInfo";
	 private List<ApplicationInfo> appList;

	    public PackagesInfo(Context ctx) {
	        PackageManager pm = ctx.getApplicationContext().getPackageManager();
	        appList = pm.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
	    }

	    public ApplicationInfo getInfo(String name) {
	    	Log.i(TAG, "PackagesInfo GETINFO-->>" + name);
	        if (name == null) {
	            return null;
	        }
	        for (ApplicationInfo appinfo : appList) {
	            if (name.equals(appinfo.processName)) {
	                return appinfo;
	            }
	        }
	        return null;
	    }

}
