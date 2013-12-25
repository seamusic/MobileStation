package com.mobilestation.entities;

import java.sql.Date;

import com.lidroid.xutils.db.annotation.Column;
import com.lidroid.xutils.db.annotation.Finder;
import com.lidroid.xutils.db.annotation.Table;
import com.lidroid.xutils.db.sqlite.FinderLazyLoader;

@Table(name = "MobileApp", execAfterTableCreated = "CREATE UNIQUE INDEX index_mp_pn ON MobileApp(PackageName)")
public class MobileApp  extends EntityBase{
	public String MobileAppID;
	public String ApplicationID;
	public String MobileClientID;
	public String Installer;
	public Date AddTime;
	public Date RemoveTime;
	public Date CreateTime;
	public Date FirstTime;
	public Date SecondTime;
	public long Totaltime;
	public Date UpdateTime;
	public String PackageName;
	public boolean IsSync;
	public boolean IsSys;
	public int Frequency;
}
