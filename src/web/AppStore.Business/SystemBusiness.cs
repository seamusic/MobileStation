using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using AppStore.Models;
using Lennon.Utility;
using Webdiyer.WebControls.Mvc;

namespace AppStore.Business
{
    public class SystemBusiness : IBusiness
    {
        #region mobile
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public PagedList<Mobile> GetMobileList(int index)
        {
            using (var db = new appstoreEntities())
            {
                return db.Mobile.OrderByDescending(o => o.UpdateTime).ToPagedList(index, 100);
            }

            return null;
        }

        public Mobile GetMobile(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.Mobile.FirstOrDefault(o => o.MobileID == id);
            }
        }

        public MobileApp GetMobileApp(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.MobileApp.FirstOrDefault(o => o.MobileAppID == id);
            }
        }

        public Mobile GetMobile(string vid, string pid)
        {
            using (var db = new appstoreEntities())
            {
                var mobile = db.Mobile.FirstOrDefault(o => o.VID == vid && o.PID == pid);
                if (mobile != null)
                {

                }
                return mobile;
            }
            return null;
        }

        public bool SaveMobile(Mobile mobile)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (mobile.UpdateTime == DateTime.MinValue || mobile.UpdateTime == null)
                {
                    mobile.UpdateTime = DateTime.Now;
                    db.Mobile.Add(mobile);
                }
                else
                {
                    mobile.UpdateTime = DateTime.Now;
                    db.Mobile.Attach(mobile);
                    db.Entry(mobile).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
        #endregion

        #region Driver
        public PagedList<Driver> GetDriverList(int index)
        {
            using (var db = new appstoreEntities())
            {
                return db.Driver.OrderByDescending(o => o.UpdateTime).ToPagedList(index, 500);
            }

            return null;
        }

        public Driver GetDriver(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.Driver.FirstOrDefault(o => o.DriverID == id);
            }
        }

        public Driver GetDriver(String pid, string vid)
        {
            using (var db = new appstoreEntities())
            {
                var mobile = db.Mobile.FirstOrDefault(o => o.PID == pid && o.VID == vid);
                if (mobile == null || string.IsNullOrEmpty(mobile.DriverID))
                {
                    return null;
                }
                else
                {
                    return db.Driver.FirstOrDefault(o => o.DriverID == mobile.DriverID);
                }
            }
        }

        public bool SaveDriver(Driver driver)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (driver.UpdateTime == null || driver.UpdateTime == DateTime.MinValue)
                {
                    driver.UpdateTime = DateTime.Now;
                    db.Driver.Add(driver);
                }
                else
                {
                    driver.UpdateTime = DateTime.Now;
                    db.Driver.Attach(driver);
                    db.Entry(driver).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
        #endregion

        #region Brand
        public PagedList<Brand> GetBrandList(int index)
        {
            using (var db = new appstoreEntities())
            {
                return db.Brand.OrderByDescending(o => o.UpdateTime).ToPagedList(index, 100);
            }

            return null;
        }

        public Brand GetBrand(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.Brand.FirstOrDefault(o => o.BrandID == id);
            }
        }

        public bool SaveBrand(Brand brand)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (brand.UpdateTime == null || brand.UpdateTime == DateTime.MinValue)
                {
                    brand.UpdateTime = DateTime.Now;
                    db.Brand.Add(brand);
                }
                else
                {
                    brand.UpdateTime = DateTime.Now;
                    db.Brand.Attach(brand);
                    db.Entry(brand).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
        #endregion

        #region PCClient
        public PagedList<PCClient> GetPCClientList(int index)
        {
            using (var db = new appstoreEntities())
            {
                return db.PCClient.OrderByDescending(o => o.UpdateTime).ToPagedList(index, 100);
            }

            return null;
        }

        public PCClient GetPCClient(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.PCClient.FirstOrDefault(o => o.PCClientID == id);
            }
        }

        public bool SavePCClient(PCClient ent)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (ent.UpdateTime == null || ent.UpdateTime == DateTime.MinValue)
                {
                    ent.UpdateTime = DateTime.Now;
                    db.PCClient.Add(ent);
                }
                else
                {
                    ent.UpdateTime = DateTime.Now;
                    db.PCClient.Attach(ent);
                    db.Entry(ent).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
        #endregion

        #region MobileClient
        public PagedList<MobileClient> GetMobileClientList(int index)
        {
            using (var db = new appstoreEntities())
            {
                return db.MobileClient.OrderByDescending(o => o.UpdateTime).ToPagedList(index, 100);
            }

            return null;
        }

        public MobileClient GetMobileClient(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.MobileClient.FirstOrDefault(o => o.MobileClientID == id);
            }
        }

        public bool SaveMobileClient(MobileClient ent)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (ent.UpdateTime == null || ent.UpdateTime == DateTime.MinValue)
                {
                    ent.UpdateTime = DateTime.Now;
                    db.MobileClient.Add(ent);
                }
                else
                {
                    ent.UpdateTime = DateTime.Now;
                    db.MobileClient.Attach(ent);
                    db.Entry(ent).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
        #endregion

        /// <summary>
        /// 注册一个手机客户端
        /// </summary>
        /// <returns></returns>
        public bool RegisterMobileClient(string key, string clientName, string model)
        {
            if (string.IsNullOrEmpty(key))
            {
                return false;
            }
            using (var db = new appstoreEntities())
            {
                MobileClient mobileClient = db.MobileClient.FirstOrDefault(m => m.ClientKey == key);
                //var pcclient = db.PCClient.FirstOrDefault(m => m.ClientKey == key);
                if (mobileClient == null)
                {
                    mobileClient = new MobileClient
                    {
                        MobileClientID = Guid.NewGuid().ToString(),
                        ClientKey = key,
                        UpdateTime = DateTime.Now,
                        CreateTime = DateTime.Now,
                        ClientName = clientName,
                    };

                    if (!string.IsNullOrEmpty(model))
                    {
                        var mobile = db.Mobile.FirstOrDefault(m => m.Model == model);
                        if (mobile != null)
                        {
                            mobileClient.PhoneModelID = mobile.MobileID;
                        }
                    }

                    db.MobileClient.Add(mobileClient);

                    return db.SaveChanges() > 0;
                }
                else
                {
                    mobileClient.UpdateTime = DateTime.Now;
                }

            }
            return false;
        }

        public MobileClient GetMobileClientByKey(string key)
        {
            using (var db = new appstoreEntities())
            {
                return db.MobileClient.FirstOrDefault(o => o.ClientKey == key);
            }
        }

        public List<MobileApp> GetMobileApplication(string key)
        {
            using (var db = new appstoreEntities())
            {
                var client = db.MobileClient.FirstOrDefault(o => o.ClientKey == key);
                if (client != null)
                {
                    return db.MobileApp.Where(o => o.MobileClientID == client.MobileClientID).ToList();
                }
            }
            return null;
        }

        public List<MobileApp> GetSyncMobileApp(string key)
        {
            using (var db = new appstoreEntities())
            {
                var client = db.MobileClient.FirstOrDefault(o => o.ClientKey == key);
                if (client != null)
                {
                    return db.MobileApp.Where(o => o.MobileClientID == client.MobileClientID && o.IsSys == true).ToList();
                }
            }
            return null;
        }

        public bool SavePushMobileApp(string key, List<MobileApp> list)
        {
            if (list == null)
            {
                return false;
            }

            var client = GetMobileClientByKey(key);
            if (client == null)
            {
                return false;
            }
            else
            {
                using (var db = new appstoreEntities())
                {
                    foreach (MobileApp mobileApp in list)
                    {
                        if (string.IsNullOrEmpty(mobileApp.PackageName))
                        {
                            continue;
                        }

                        var localApp =
                            db.MobileApp.FirstOrDefault(
                                m => m.MobileClientID == client.MobileClientID && m.PackageName == mobileApp.PackageName);
                        if (localApp == null)
                        {
                            var app = db.Application.FirstOrDefault(m => m.PackageName == mobileApp.PackageName);
                            if (app == null)
                            {
                                continue;
                            }

                            mobileApp.MobileAppID = Guid.NewGuid().ToString();
                            mobileApp.MobileClientID = client.MobileClientID;
                            mobileApp.ApplicationID = app.ApplicationID;
                            mobileApp.IsSync = true;
                            mobileApp.IsSys = false;
                            mobileApp.UpdateTime = DateTime.Now;
                            db.MobileApp.Add(mobileApp);
                        }
                        else
                        {
                            localApp.AddTime = mobileApp.AddTime;
                            localApp.FirstTime = mobileApp.FirstTime;
                            localApp.RemoveTime = mobileApp.RemoveTime;
                            localApp.SecondTime = mobileApp.SecondTime;
                            //应该加还是应该减呢？
                            localApp.Totaltime = mobileApp.Totaltime;
                            localApp.IsSync = true;
                            localApp.Frequency = mobileApp.Frequency;
                            localApp.UpdateTime = DateTime.Now;
                        }
                    }
                    db.SaveChanges();
                }
                return true;
            }
        }

        public bool HasDownMobileApp(string clientKey, List<string> list)
        {
            if (list == null)
            {
                return false;
            }

            var client = GetMobileClientByKey(clientKey);
            if (client == null)
            {
                return false;
            }
            else
            {
                using (var db = new appstoreEntities())
                {
                    foreach (string packageName in list)
                    {
                        if (string.IsNullOrEmpty(packageName))
                        {
                            continue;
                        }

                        var localApp =
                            db.MobileApp.FirstOrDefault(
                                m => m.MobileClientID == client.MobileClientID && m.PackageName == packageName);
                        if (localApp != null)
                        {
                            localApp.IsSync = true;
                            localApp.UpdateTime = DateTime.Now;
                        }

                    }
                    db.SaveChanges();
                }
                return true;
            }
        }

        public bool RegMobileApp(string pcKey, string mobileKey, string packageName)
        {
            using (var db = new appstoreEntities())
            {
                var pcclient = db.PCClient.FirstOrDefault(m => m.ClientKey == pcKey);
                var mobileClient = db.MobileClient.FirstOrDefault(m => m.ClientKey == mobileKey);
                var app = db.Application.FirstOrDefault(m => m.PackageName == packageName);
                if (pcclient == null)
                {
                    LogHelper.Warn(this.GetType(), string.Format("reg mobile app fail:{0}.{1}.{2}", pcKey, mobileKey, packageName));
                    return false;
                }
                if (mobileClient == null)
                {
                    mobileClient = new MobileClient()
                        {
                            PCClientID = pcclient.PCClientID,
                            MobileClientID = Guid.NewGuid().ToString(),
                            ClientKey = mobileKey,
                            CreateTime = DateTime.Now,
                        };
                    db.MobileClient.Add(mobileClient);
                }
                else
                {
                    mobileClient.PCClientID = pcclient.PCClientID;
                    mobileClient.UpdateTime = DateTime.Now;
                }

                var mobileApp =
                    db.MobileApp.FirstOrDefault(
                        m => m.MobileClientID == mobileClient.MobileClientID && m.PackageName == packageName);
                if (mobileApp == null)
                {
                    mobileApp = new MobileApp();
                    mobileApp.MobileAppID = Guid.NewGuid().ToString();
                    mobileApp.ApplicationID = app == null ? Guid.Empty.ToString() : app.ApplicationID;
                    mobileApp.PackageName = packageName;
                    mobileApp.MobileClientID = mobileClient.MobileClientID;
                    mobileApp.Installer = "PC";
                    mobileApp.Totaltime = 0;
                    mobileApp.CreateTime = DateTime.Now;
                    mobileApp.UpdateTime = DateTime.Now;
                    mobileApp.IsSys = true;
                    mobileApp.IsSync = false;
                    db.MobileApp.Add(mobileApp);
                }
                else
                {
                    mobileApp.UpdateTime = DateTime.Now;
                    mobileApp.IsSys = true;
                    mobileApp.IsSync = false;
                }
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public bool RegMobileClient(RegClient regClient)
        {
            using (var db = new appstoreEntities())
            {
                MobileClient mobileClient = db.MobileClient.FirstOrDefault(m => m.ClientKey == regClient.MobileKey);
                var pcclient = db.PCClient.FirstOrDefault(m => m.ClientKey == regClient.PCKey);
                var mobileModel = db.PhoneModel.FirstOrDefault(m => m.ModelName == regClient.MobileModel);
                if (pcclient != null)
                {
                    if (mobileClient == null)
                    {
                        mobileClient = new MobileClient()
                        {
                            MobileClientID = Guid.NewGuid().ToString(),
                            ClientKey = regClient.MobileKey,
                            CreateTime = DateTime.Now,
                        };
                        db.MobileClient.Add(mobileClient);
                    }
                    else
                    {
                        mobileClient.PCClientID = pcclient.PCClientID;
                    }

                    mobileClient.UpdateTime = DateTime.Now;
                    if (mobileModel != null)
                    {
                        mobileClient.PhoneModelID = mobileModel.PhoneModelID;
                    }
                }
                return db.SaveChanges() > 0;
            }
            return false;
        }

        public bool SyncRunLog(string clientKey, List<RunLog> list)
        {
            if (string.IsNullOrEmpty(clientKey))
            {
                return false;
            }
            using (var db = new appstoreEntities())
            {
                var client = db.MobileClient.FirstOrDefault(o => o.ClientKey == clientKey);
                if (client == null)
                {
                    return false;
                }

                foreach (RunLog runLog in list)
                {
                    var mobileApp =
                        db.MobileApp.FirstOrDefault(
                            o => o.PackageName == runLog.PackageName && o.MobileClientID == client.MobileClientID);
                    if (mobileApp == null)
                    {
                        continue;
                    }

                    if (runLog.EndTime == null)
                    {
                        var log =
                            db.RunLog.FirstOrDefault(
                                m => m.StartTime == runLog.StartTime && m.MobileAppID == mobileApp.MobileAppID);
                        if (log != null)
                        {
                            log.StartTime = runLog.StartTime;
                            log.UpdateTime = runLog.UpdateTime;
                            log.TotalTime = runLog.TotalTime;
                        }
                        else
                        {
                            runLog.RunLogID = Guid.NewGuid().ToString().ToUpper();
                            runLog.MobileAppID = mobileApp.MobileAppID;
                            db.RunLog.Add(runLog);
                        }
                    }
                    else
                    {
                        runLog.RunLogID = Guid.NewGuid().ToString().ToUpper();
                        runLog.MobileAppID = mobileApp.MobileAppID;
                        db.RunLog.Add(runLog);
                    }
                }
                return db.SaveChanges() > 0;
            }
        }
    }
}
