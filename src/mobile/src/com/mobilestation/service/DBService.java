package com.mobilestation.service;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.R.integer;
import android.content.Context;
import android.util.Log;

import com.lidroid.xutils.DbUtils;
import com.lidroid.xutils.db.sqlite.Selector;
import com.lidroid.xutils.db.sqlite.WhereBuilder;
import com.lidroid.xutils.exception.DbException;
import com.mobilestation.entities.MobileApp;
import com.mobilestation.entities.RunLog;

public class DBService {
	private final String TAG = "com.mobilestation.service.DBService";
	private Context context;
	public static final String DBNAME = "mobile.db";
	DbUtils db;
	// 1 安装
	// 2、卸载
	// 3、启动
	// 4、停止
	// 5、出错
	// 99、未知
	final int APP_ACTION_ADD = 1;
	final int APP_ACTION_START = 2;
	final int APP_ACTION_RUNNING = 3;
	final int APP_ACTION_STOP = 4;
	final int APP_ACTION_REMOVE = 5;
	final int APP_ACTION_ERROR = 6;
	final int APP_ACTION_UNKNOW = 99;

	private static DBService instance;

	public static DBService getInstance(Context context) {
		if (null == instance) {
			instance = new DBService(context);
		}
		return instance;
	}

	public DBService(Context context) {
		this.context = context;
		db = DbUtils.create(context);
		try {
			db.dropDb();
		} catch (DbException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.configAllowTransaction(true);
		db.configDebug(true);
	}

	/**
	 * 判断数据库是否存在
	 * 
	 * @return
	 */
	public boolean isExist() {
		final File file = new File(context.getFilesDir(), DBNAME);
		return file.exists();
	}

	public void startApp(String packageName) {
		try {
			MobileApp client;
			client = db.findFirst(Selector.from(MobileApp.class).where(
					"PackageName", "=", packageName));
			Date curDate = new Date(System.currentTimeMillis());
			if (client == null) {
				client = new MobileApp();
				client.AddTime = curDate;
				client.CreateTime = curDate;
				client.IsSync = false;
				client.IsSys = false;
				client.PackageName = packageName;
				client.Totaltime = 0;
				client.UpdateTime = curDate;
				client.FirstTime = curDate;
				client.Frequency = 0;
				db.save(client);
				LogStartApp(packageName);
			} else {
				client.IsSync = false;
				client.UpdateTime = curDate;
				client.Frequency = client.Frequency + 1;
				if (client.FirstTime == null) {
					client.FirstTime = curDate;
				} else if (client.SecondTime == null) {
					client.SecondTime = curDate;
				}
				db.update(client);
				LogStartApp(packageName);
			}
		} catch (DbException e) {
			Log.e(TAG, "添加程序时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void InstallApp(String packageName) {
		try {
			MobileApp client;
			client = db.findFirst(Selector.from(MobileApp.class).where(
					"PackageName", "=", packageName));
			Date curDate = new Date(System.currentTimeMillis());
			if (client == null) {
				client = new MobileApp();
				client.AddTime = curDate;
				client.CreateTime = curDate;
				client.IsSync = false;
				client.IsSys = false;
				client.PackageName = packageName;
				client.Totaltime = 0;
				client.UpdateTime = curDate;
				client.Frequency = 0;
				db.save(client);
				LogInstallApp(packageName);
			} else {
				client.AddTime = curDate;
				client.CreateTime = curDate;
				client.IsSync = false;
				client.Totaltime = 0;
				client.UpdateTime = curDate;
				client.Frequency = 0;
				db.update(client);
				LogInstallApp(packageName);
			}
		} catch (DbException e) {
			Log.e(TAG, "添加程序时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Map<String, Integer> getSavedApp() {
		Map<String, Integer> appTimeMap = new HashMap<String, Integer>();
		try {
			List<MobileApp> list = db.findAll(Selector.from(MobileApp.class));

			if (list != null) {
				for (MobileApp app : list) {
					appTimeMap.put(app.PackageName, 0);
				}
			}

		} catch (DbException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return appTimeMap;
	}

	public void RemoveApp(String packageName) {
		try {
			MobileApp client = db.findFirst(Selector.from(MobileApp.class)
					.where("PackageName", "=", packageName));
			Date curDate = new Date(System.currentTimeMillis());
			if (client != null) {
				client.RemoveTime = curDate;
				client.UpdateTime = curDate;
				client.IsSync = false;
				db.update(client);
				LogRemoveApp(packageName);
			}
		} catch (DbException e) {
			Log.e(TAG, "移除程序时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void LogInstallApp(String packageName) {
		fixLastRunLog(packageName);
		RunLog log = buildRunLog(packageName, APP_ACTION_ADD);
		log.Message = "程序安装";
		log.EndTime = log.StartTime;
		try {
			db.save(log);
		} catch (DbException e) {
			Log.e(TAG, "保存LogInstallApp出错");
			e.printStackTrace();
		}
	}

	public void LogStartApp(String packageName) {
		fixLastRunLog(packageName);
		RunLog log = buildRunLog(packageName, APP_ACTION_START);
		log.EndTime = log.StartTime;
		log.Message = "程序开始";
		try {
			db.save(log);
			LogRunningApp(packageName);
		} catch (DbException e) {
			Log.e(TAG, "保存LogInstallApp出错");
			e.printStackTrace();
		}
	}

	public void LogRemoveApp(String packageName) {
		fixLastRunLog(packageName);
		RunLog log = buildRunLog(packageName, APP_ACTION_REMOVE);
		log.EndTime = log.StartTime;
		log.Message = "程序被移除";
		try {
			db.save(log);
		} catch (DbException e) {
			Log.e(TAG, "保存LogInstallApp出错");
			e.printStackTrace();
		}
	}

	public void LogStopApp(String packageName) {
		Date curDate = new Date(System.currentTimeMillis());
		try {
			RunLog log = db.findFirst(Selector.from(RunLog.class)
					.where("PackageName", "=", packageName)
					.orderBy("UpdateTime", true));
			if (log != null) {
				log.Action = APP_ACTION_RUNNING;
				log.EndTime = curDate;
				log.TotalTime = (curDate.getTime() - log.StartTime.getTime()) / 1000;
				log.UpdateTime = curDate;
				log.Message = "正常停止";
				log.IsSync = false;
				db.update(log);
			}
		} catch (DbException e) {
			Log.e(TAG, "保存LogInstallApp出错");
			e.printStackTrace();
		}
	}

	public void LogRunningApp(String packageName) {
		Date curDate = new Date(System.currentTimeMillis());
		try {
			RunLog log = db.findFirst(Selector.from(RunLog.class)
					.where("PackageName", "=", packageName)
					.and("EndTime", "=", null).orderBy("UpdateTime", true));
			if (log == null) {
				log = buildRunLog(packageName, APP_ACTION_RUNNING);
				db.save(log);
			} else {
				Calendar calendar = Calendar.getInstance();
				Calendar today = new GregorianCalendar(
						calendar.get(Calendar.YEAR),
						calendar.get(Calendar.MONTH),
						calendar.get(Calendar.DATE), 0, 0, 0);
				boolean isLastDate = today.getTimeInMillis() > log.StartTime
						.getTime();
				
				Log.i(TAG, "isLastDate:"+isLastDate);

				log.Action = APP_ACTION_RUNNING;
				log.UpdateTime = curDate;
				log.Message = "正在运行";
				log.IsSync = false;
				// 过了一天的，要重新开始记录
				if (isLastDate) {
					log.EndTime = (Date) today.getTime();
					log.TotalTime = (log.StartTime.getTime() - log.EndTime
							.getTime()) / 1000;
					db.update(log);
					RunLog newlog = buildRunLog(packageName, APP_ACTION_RUNNING);
					newlog.StartTime = log.EndTime;
					db.save(newlog);
				} else {
					log.TotalTime = (curDate.getTime() - log.StartTime
							.getTime()) / 1000;
					db.update(log);
				}
			}
		} catch (DbException e) {
			Log.e(TAG, "LogRunningApp查找出错");
			e.printStackTrace();
		}
	}

	public void stopApp(String packageName, int totalTime) {
		Date curDate = new Date(System.currentTimeMillis());
		try {
			MobileApp client;
			client = db.findFirst(Selector.from(MobileApp.class).where(
					"PackageName", "=", packageName));
			if (client != null) {
				client.IsSync = false;
				client.UpdateTime = curDate;
				client.Totaltime += totalTime;
				db.update(client);
				LogStopApp(packageName);
			}
		} catch (DbException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void appStart() {
		LogStartApp(context.getPackageName());
	}

	private void fixLastRunLog(String packageName) {
		Date curDate = new Date(System.currentTimeMillis());
		try {
			RunLog log = db.findFirst(Selector.from(RunLog.class)
					.where("PackageName", "=", packageName)
					.orderBy("UpdateTime", true));
			if (log != null) {
				log.EndTime = curDate;
				log.Message = "被异常终止";
				log.IsSync = false;
				db.update(log);
			}
		} catch (DbException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private RunLog buildRunLog(String packageName, int action) {
		Date curDate = new Date(System.currentTimeMillis());
		RunLog newLog = new RunLog();
		newLog.ApplicationID = packageName;
		newLog.PackageName = packageName;
		newLog.StartTime = curDate;
		newLog.UpdateTime = curDate;
		newLog.TotalTime = 0;
		newLog.Action = action;
		newLog.IsSync = false;
		return newLog;
	}

	public void SyncMobileApp(List<MobileApp> retList) {
		Date curDate = new Date(System.currentTimeMillis());
		for (MobileApp app : retList) {
			try {
				MobileApp localApp = db.findFirst(Selector
						.from(MobileApp.class).where("PackageName", "=",
								app.PackageName));

				if (localApp == null) {
					localApp = new MobileApp();
					localApp.AddTime = curDate;
					localApp.CreateTime = curDate;
					localApp.IsSync = false;
					localApp.IsSys = true;
					localApp.PackageName = app.PackageName;
					localApp.Totaltime = 0;
					localApp.UpdateTime = curDate;

					db.save(localApp);
				} else {
					localApp.UpdateTime = curDate;
					localApp.IsSync = false;
					localApp.IsSys = true;
					db.update(localApp);
				}
			} catch (DbException e) {
				Log.e(TAG, "SyncMobileApp时出错");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void PushedMobileApp(List<MobileApp> list) {
		Date curDate = new Date(System.currentTimeMillis());
		for (MobileApp app : list) {
			app.UpdateTime = curDate;
			app.IsSync = true;
			try {
				db.update(app);
			} catch (DbException e) {
				Log.e(TAG, "PushedMobileApp时出错");
				e.printStackTrace();
			}
		}
	}

	public List<MobileApp> GetSyncMobileApp() {
		List<MobileApp> list;
		try {
			list = db.findAll(Selector.from(MobileApp.class)
					.where("IsSync", "=", false).and("IsSys", "=", true));
			for (MobileApp entity : list) {
				entity.IsSync = true;
				db.update(entity, "IsSync");
			}
			return list;
		} catch (DbException e) {
			Log.e(TAG, "GetSyncMobileApp时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void calcAppRunningTime(Map<String, Integer> appTimeMap) {
		Date curDate = new Date(System.currentTimeMillis());
		// TODO Auto-generated method stub
		for (String dataKey : appTimeMap.keySet()) {
			Integer totalTime = appTimeMap.get(dataKey);
			if (totalTime == 0)
				continue;
			try {
				MobileApp localApp = db.findFirst(Selector
						.from(MobileApp.class).where("PackageName", "=",
								dataKey));
				if (localApp == null) {
					startApp(dataKey);
				} else {
					localApp.Totaltime += totalTime;
					localApp.UpdateTime = curDate;
					localApp.IsSync = false;
					db.update(localApp);
				}
				LogRunningApp(dataKey);
			} catch (DbException e) {
				Log.e(TAG, "calcAppRunningTime时出错");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void delHasSyncLog() {
		Date curDate = new Date(System.currentTimeMillis());
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, -1);
		try {
			db.delete(RunLog.class,
					WhereBuilder.b("UpdateTime", "<", calendar.getTime()));
		} catch (DbException e) {
			Log.e(TAG, "delHasSyncLog时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<RunLog> GetSyncLog() {
		List<RunLog> list;
		try {
			List<MobileApp> apps = db.findAll(Selector.from(MobileApp.class)
					.where("IsSys", "=", true));
			List<String> packages = new ArrayList<String>();
			if (apps != null) {
				for (MobileApp mobileApp : apps) {
					packages.add(mobileApp.PackageName);
				}
			}
			Log.i(TAG, "packages:" + packages.size());

			list = db.findAll(Selector.from(RunLog.class).where("IsSync", "=",
					false));
			// 只同步部分
			List<RunLog> newlist = new ArrayList<RunLog>();
			for (RunLog runLog : list) {
				if (packages.contains(runLog.PackageName)) {
					newlist.add(runLog);
				}
			}
			return newlist;
		} catch (DbException e) {
			Log.e(TAG, "GetSyncLog时出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void UpdateSyncLog(List<RunLog> list) {
		for (RunLog runLog : list) {
			if (runLog.EndTime != null) {
				runLog.IsSync = true;
				try {
					db.update(runLog, "IsSync");
				} catch (DbException e) {
					Log.e(TAG, "UpdateSyncLog时出错");
					e.printStackTrace();
				}
			}
		}
	}
}
