package com.mobilestation.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilestation.bean.DetailProceess;
import com.mobilestation.bean.PackagesInfo;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;

public class RunningApp {
	private static final String TAG = "RunningApp";
	private ArrayList<DetailProceess> avaiAppInfo;
	private ActivityManager am;
	private PackageManager pm;
	Context context;
	private PackagesInfo packsInfo;

	public RunningApp(Context context) {
		this.context = context;
		am = (ActivityManager) context
				.getSystemService(Context.ACTIVITY_SERVICE);
	}

	public ArrayList<DetailProceess> GetRunningApp() {
		List<RunningAppProcessInfo> allRunning = am.getRunningAppProcesses();
		avaiAppInfo = new ArrayList<DetailProceess>();
		for (RunningAppProcessInfo info : allRunning) {
			String processName = info.processName;

			if ("system".equals(processName)
					|| "com.mobilestation".equals(processName)
					|| "com.android.phone".equals(processName)
					|| "android.process.acore".equals(processName)
					|| "android.process.media".equals(processName)) {
				continue;
			}

			final DetailProceess dp = new DetailProceess(context, info);

			dp.fetchApplicationInfo(packsInfo);
			dp.getPackageInfo();
			if (dp.isGoodProcess()) {
				avaiAppInfo.add(dp);
			}

		}

		return avaiAppInfo;
	}

	public List<String> GetRunningPackName() {
		List<RunningAppProcessInfo> runningapps = am.getRunningAppProcesses();

		List<String> processnameList = new ArrayList<String>();
		for (RunningAppProcessInfo info : runningapps) {
			String processName = info.processName;
			if (info.uid < 10000 || "system".equals(processName)
					|| "com.mobilestation".equals(processName)
					|| "com.android.phone".equals(processName)
					|| "android.process.acore".equals(processName)
					|| "android.process.media".equals(processName)) {
				continue;
			}
			if (info.importance == RunningAppProcessInfo.IMPORTANCE_VISIBLE
					|| info.importance == RunningAppProcessInfo.IMPORTANCE_FOREGROUND)
				processnameList.add(processName);
		}
		return processnameList;
	}

	public List<String> GetRunningPackageName() {
		List<String> processnameList = new ArrayList<String>();
		List<RunningAppInfo> runningapps = queryAllRunningAppInfo();
		for (RunningAppInfo info : runningapps) {
			String packageName = info.packageName;
			if (info.pid > 10000)
				processnameList.add(packageName);
		}
		return processnameList;
	}

	// 查询所有正在运行的应用程序信息： 包括他们所在的进程id和进程名
	// 这儿我直接获取了系统里安装的所有应用程序，然后根据报名pkgname过滤获取所有真正运行的应用程序
	private List<RunningAppInfo> queryAllRunningAppInfo() {
		pm = context.getPackageManager();
		// 查询所有已经安装的应用程序
		List<ApplicationInfo> listAppcations = pm
				.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
		Collections.sort(listAppcations,
				new ApplicationInfo.DisplayNameComparator(pm));// 排序

		// 保存所有正在运行的包名 以及它所在的进程信息
		Map<String, ActivityManager.RunningAppProcessInfo> pgkProcessAppMap = new HashMap<String, ActivityManager.RunningAppProcessInfo>();

		ActivityManager mActivityManager = (ActivityManager) context
				.getSystemService(Context.ACTIVITY_SERVICE);
		// 通过调用ActivityManager的getRunningAppProcesses()方法获得系统里所有正在运行的进程
		List<ActivityManager.RunningAppProcessInfo> appProcessList = mActivityManager
				.getRunningAppProcesses();

		for (ActivityManager.RunningAppProcessInfo appProcess : appProcessList) {
			int pid = appProcess.pid; // pid
			int uid = appProcess.uid;
			String processName = appProcess.processName; // 进程名
			Log.i(TAG, "processName: " + processName + "  pid: " + pid
					+ " uid:" + uid);

			String[] pkgNameList = appProcess.pkgList; // 获得运行在该进程里的所有应用程序包

			// 输出所有应用程序的包名
			for (int i = 0; i < pkgNameList.length; i++) {
				String pkgName = pkgNameList[i];
				Log.i(TAG, "packageName " + pkgName + " at index " + i
						+ " in process " + pid);
				// 加入至map对象里
				pgkProcessAppMap.put(pkgName, appProcess);
			}
		}
		// 保存所有正在运行的应用程序信息
		List<RunningAppInfo> runningAppInfos = new ArrayList<RunningAppInfo>(); // 保存过滤查到的AppInfo

		for (ApplicationInfo app : listAppcations) {
			// 如果该包名存在 则构造一个RunningAppInfo对象
			if (pgkProcessAppMap.containsKey(app.packageName)) {
				// 获得该packageName的 pid 和 processName
				int pid = pgkProcessAppMap.get(app.packageName).pid;
				String processName = pgkProcessAppMap.get(app.packageName).processName;
				runningAppInfos.add(getAppInfo(app, pid, processName));
			}
		}

		return runningAppInfos;

	}

	// 某一特定经常里所有正在运行的应用程序
	private List<RunningAppInfo> querySpecailPIDRunningAppInfo(Intent intent,
			int pid) {

		String[] pkgNameList = intent.getStringArrayExtra("EXTRA_PKGNAMELIST");
		String processName = intent.getStringExtra("EXTRA_PROCESS_NAME");

		// update ui
		// tvInfo.setText("进程id为"+pid +" 运行的应用程序共有  :  "+pkgNameList.length);

		pm = context.getPackageManager();

		// 保存所有正在运行的应用程序信息
		List<RunningAppInfo> runningAppInfos = new ArrayList<RunningAppInfo>(); // 保存过滤查到的AppInfo

		for (int i = 0; i < pkgNameList.length; i++) {
			// 根据包名查询特定的ApplicationInfo对象
			ApplicationInfo appInfo;
			try {
				appInfo = pm.getApplicationInfo(pkgNameList[i], 0);
				runningAppInfos.add(getAppInfo(appInfo, pid, processName));
			} catch (NameNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 0代表没有任何标记;
		}
		return runningAppInfos;
	}

	// 构造一个RunningAppInfo对象 ，并赋值
	private RunningAppInfo getAppInfo(ApplicationInfo app, int pid,
			String processName) {
		RunningAppInfo appInfo = new RunningAppInfo();
		appInfo.appLabel = (String) app.loadLabel(pm);
		appInfo.packageName = app.packageName;
		appInfo.pid = pid;
		appInfo.processName = processName;

		return appInfo;
	}

}
