package com.mobilestation.entities;

import java.sql.Date;

import com.lidroid.xutils.db.annotation.Table;

@Table(name = "MobileClient", execAfterTableCreated = "CREATE UNIQUE INDEX index_mc_ck ON MobileClient(ClientKey)")
public class MobileClient  extends EntityBase {
    public String MobileClientID;
    public String PhoneModelID;
    public String PCClientID;
    public String ClientName;
    public String ClientMac;
    public String ClientKey;
    public String Description;
    public Date UpdateTime;
    public Date CreateTime;
    public boolean IsSync;
    public String Model;
    public String OSVersion;
    public String Manufacturer;
    public String Serial;
    public String Device;
    public String DeviceID;
    public String Product;
    public String Message;
    public String SystemMemory;
    public String CpuInfo;
    public String SimCardInfo;
    public String SimSerialNumber;
    public String ProvidersName;
    public String SDCardInfo;
    public String WeithAndHeight;
}
