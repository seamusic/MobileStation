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

	// ��ѯ�����������е�Ӧ�ó�����Ϣ�� �����������ڵĽ���id�ͽ�����
	// �����ֱ�ӻ�ȡ��ϵͳ�ﰲװ������Ӧ�ó���Ȼ����ݱ���pkgname���˻�ȡ�����������е�Ӧ�ó���
	private List<RunningAppInfo> queryAllRunningAppInfo() {
		pm = context.getPackageManager();
		// ��ѯ�����Ѿ���װ��Ӧ�ó���
		List<ApplicationInfo> listAppcations = pm
				.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
		Collections.sort(listAppcations,
				new ApplicationInfo.DisplayNameComparator(pm));// ����

		// ���������������еİ��� �Լ������ڵĽ�����Ϣ
		Map<String, ActivityManager.RunningAppProcessInfo> pgkProcessAppMap = new HashMap<String, ActivityManager.RunningAppProcessInfo>();

		ActivityManager mActivityManager = (ActivityManager) context
				.getSystemService(Context.ACTIVITY_SERVICE);
		// ͨ������ActivityManager��getRunningAppProcesses()�������ϵͳ�������������еĽ���
		List<ActivityManager.RunningAppProcessInfo> appProcessList = mActivityManager
				.getRunningAppProcesses();

		for (ActivityManager.RunningAppProcessInfo appProcess : appProcessList) {
			int pid = appProcess.pid; // pid
			int uid = appProcess.uid;
			String processName = appProcess.processName; // ������
			Log.i(TAG, "processName: " + processName + "  pid: " + pid
					+ " uid:" + uid);

			String[] pkgNameList = appProcess.pkgList; // ��������ڸý����������Ӧ�ó����

			// �������Ӧ�ó���İ���
			for (int i = 0; i < pkgNameList.length; i++) {
				String pkgName = pkgNameList[i];
				Log.i(TAG, "packageName " + pkgName + " at index " + i
						+ " in process " + pid);
				// ������map������
				pgkProcessAppMap.put(pkgName, appProcess);
			}
		}
		// ���������������е�Ӧ�ó�����Ϣ
		List<RunningAppInfo> runningAppInfos = new ArrayList<RunningAppInfo>(); // ������˲鵽��AppInfo

		for (ApplicationInfo app : listAppcations) {
			// ����ð������� ����һ��RunningAppInfo����
			if (pgkProcessAppMap.containsKey(app.packageName)) {
				// ��ø�packageName�� pid �� processName
				int pid = pgkProcessAppMap.get(app.packageName).pid;
				String processName = pgkProcessAppMap.get(app.packageName).processName;
				runningAppInfos.add(getAppInfo(app, pid, processName));
			}
		}

		return runningAppInfos;

	}

	// ĳһ�ض������������������е�Ӧ�ó���
	private List<RunningAppInfo> querySpecailPIDRunningAppInfo(Intent intent,
			int pid) {

		String[] pkgNameList = intent.getStringArrayExtra("EXTRA_PKGNAMELIST");
		String processName = intent.getStringExtra("EXTRA_PROCESS_NAME");

		// update ui
		// tvInfo.setText("����idΪ"+pid +" ���е�Ӧ�ó�����  :  "+pkgNameList.length);

		pm = context.getPackageManager();

		// ���������������е�Ӧ�ó�����Ϣ
		List<RunningAppInfo> runningAppInfos = new ArrayList<RunningAppInfo>(); // ������˲鵽��AppInfo

		for (int i = 0; i < pkgNameList.length; i++) {
			// ���ݰ�����ѯ�ض���ApplicationInfo����
			ApplicationInfo appInfo;
			try {
				appInfo = pm.getApplicationInfo(pkgNameList[i], 0);
				runningAppInfos.add(getAppInfo(appInfo, pid, processName));
			} catch (NameNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 0����û���κα��;
		}
		return runningAppInfos;
	}

	// ����һ��RunningAppInfo���� ������ֵ
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
