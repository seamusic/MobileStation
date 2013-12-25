package com.mobilestation.bean;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Debug.MemoryInfo;
import android.util.Log;

public class DetailProceess {

	private static final String TAG = "DetailProceess";
	private long memory;
	private Drawable icon;
	private PackageManager pm;
	private String packName;
	private ActivityManager am;
	private ApplicationInfo appinfo ;
	private PackageInfo packInfo;
	public ApplicationInfo getAppinfo() {
		return appinfo;
	}

	private ActivityManager.RunningAppProcessInfo runinfo = null;

	public DetailProceess(Context context,
			ActivityManager.RunningAppProcessInfo runinfo) {
		pm = context.getPackageManager();
		this.runinfo = runinfo;
		this.packName = runinfo.processName;
		am = (ActivityManager) context
				.getSystemService(context.ACTIVITY_SERVICE);
	}

	public void fetchApplicationInfo(PackagesInfo pkg) {
			appinfo = pkg.getInfo(packName);
	}

	public String getProcessName() {
		return runinfo.processName;
	}
	
	public String getAppName() throws Exception {
		ApplicationInfo appInfo = pm.getApplicationInfo(packName,
				PackageManager.GET_UNINSTALLED_PACKAGES);
		return appInfo.loadLabel(pm).toString();
	}

	public String getAppVersion() throws Exception {
		PackageInfo info = pm.getPackageInfo(packName,
				PackageManager.GET_UNINSTALLED_PACKAGES);
		return info.versionName;
	}

	public long getMemory() {
		final MemoryInfo[] memoryInfo = am
				.getProcessMemoryInfo(new int[] { runinfo.pid });
		memory = memoryInfo[0].getTotalPrivateDirty();
		return memory;
	}

	  public PackageInfo getPackageInfo() {
	        if (packInfo == null && appinfo != null) {
	        	try {
	        		packInfo = pm.getPackageInfo(packName, PackageManager.GET_ACTIVITIES | PackageManager.GET_PERMISSIONS);
				} catch (NameNotFoundException e) {
					Log.e(TAG, e.getMessage());
				}
	        }
	        return packInfo;
	   }

	  public boolean isGoodProcess() {
	        return runinfo != null && appinfo != null && packInfo != null && packInfo.activities != null
	                && (packInfo.activities.length > 0);
	    }

	public Drawable getIcon(PackageManager pm) throws Exception {

		icon = pm.getApplicationIcon(packName);
		return icon;
	}

	public String[] getPermissions() throws Exception {
		PackageInfo info = pm.getPackageInfo(packName,
				PackageManager.GET_ACTIVITIES | PackageManager.GET_PERMISSIONS);
		return info.requestedPermissions;
	}

	public String getActivityName() throws Exception {
		PackageInfo info = pm.getPackageInfo(packName,
				PackageManager.GET_ACTIVITIES);
		ActivityInfo[] activityInfo = info.activities;
		if (null == activityInfo) {
			return null;
		}
		return activityInfo[0].name;
	}

}
