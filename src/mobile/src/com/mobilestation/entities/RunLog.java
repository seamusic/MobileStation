package com.mobilestation.entities;

import java.sql.Date;

import com.lidroid.xutils.db.annotation.Table;

@Table(name = "RunLog")
public class RunLog extends EntityBase {
	public String ApplicationID;
	public int Action;
	public Date UpdateTime;
	public String PackageName;
	public String Message;
	public long TotalTime;
	public Date StartTime;
	public Date EndTime;
	public boolean IsSync;
}
