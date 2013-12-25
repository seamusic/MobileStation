using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using AppStore.Models;

namespace AppStore.Business
{
    public class LogBusiness
    {
        public bool SaveRunLog(RunLog log)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (string.IsNullOrEmpty(log.RunLogID))
                {
                    log.RunLogID = Guid.NewGuid().ToString();
                    db.RunLog.Add(log);
                }
                else
                {
                    db.RunLog.Attach(log);
                    db.Entry(log).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        public bool SaveRunLog(string clientId, string pageName, int runAction, string message)
        {
            if (string.IsNullOrEmpty(clientId) || string.IsNullOrEmpty(pageName))
            {
                return false;
            }

            bool result;
            using (var db = new appstoreEntities())
            {
                var app = db.Application.FirstOrDefault(m => m.ApplicationName.Contains(pageName) || m.PackageName.Contains(pageName));
                if (app == null)
                {
                    return false;
                }

                var mobileApp =
                    db.MobileApp.FirstOrDefault(
                        m => m.MobileClientID == clientId && m.ApplicationID == app.ApplicationID);
                if (mobileApp == null)
                {
                    return false;
                }

                var runlog = new RunLog();
                runlog.RunLogID = Guid.NewGuid().ToString();
                runlog.MobileAppID = mobileApp.MobileAppID;
                runlog.Action = runAction;
                runlog.Message = message;

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        public bool SaveMobileApp(MobileApp mobileApp)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (string.IsNullOrEmpty(mobileApp.MobileAppID))
                {
                    mobileApp.MobileAppID = Guid.NewGuid().ToString();
                    db.MobileApp.Add(mobileApp);
                }
                else
                {
                    db.MobileApp.Attach(mobileApp);
                    db.Entry(mobileApp).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        public bool UpdateMobileAppTime(string clientId, string appId, string time)
        {
            if (string.IsNullOrEmpty(clientId) || string.IsNullOrEmpty(appId))
            {
                return false;
            }

            DateTime datetime = DateTime.MinValue;
            bool result = DateTime.TryParse(time, out datetime);

            if (!result)
            {
                return false;
            }

            using (var db = new appstoreEntities())
            {
                var mobileApp = db.MobileApp.FirstOrDefault(m => m.MobileAppID == appId && m.MobileClientID == clientId);
                if (mobileApp == null)
                {
                    mobileApp = new MobileApp
                    {
                        MobileAppID = Guid.NewGuid().ToString(),
                        MobileClientID = clientId
                    };
                    mobileApp.MobileAppID = appId;
                    mobileApp.CreateTime = DateTime.Now;
                    mobileApp.FirstTime = datetime;
                    mobileApp.Totaltime = 0;
                    mobileApp.UpdateTime = datetime;
                }
                else
                {
                    if (mobileApp.SecondTime == null)
                    {
                        mobileApp.SecondTime = datetime;
                    }
                    mobileApp.UpdateTime = datetime;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
    }
}
