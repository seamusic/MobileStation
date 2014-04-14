using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Text;
using AppStore.Models;
using Webdiyer.WebControls.Mvc;

namespace AppStore.Business
{
    public class StatisticsBusiness : BaseBusiness
    {
        public dynamic GetOverview(DateTime dateTime)
        {
            using (var context = GetContext)
            {
                dynamic data = new ExpandoObject();
                data.Date = dateTime.ToString("yyyy-MM-dd");
                //新增装机店
                data.TotalStore = context.Sql("SELECT COUNT(*) FROM PCClient")
                    .QuerySingle<int>();
                //新增装机店
                data.NewStore = context.Sql("SELECT COUNT(*) FROM PCClient mc WHERE mc.CreateTime>@date1 and mc.CreateTime<@date2")
                    .Parameter("date1", dateTime)
                    .Parameter("date2", dateTime.AddDays(1))
                    .QuerySingle<int>();
                //总注册的人员
                data.TotalMobile = context.Sql("SELECT COUNT(*) FROM MobileClient")
                    .QuerySingle<int>();
                data.TodayMobile = context.Sql("SELECT COUNT(*) FROM MobileClient mc WHERE mc.CreateTime>@date1 and mc.CreateTime<@date2")
                    .Parameter("date1", dateTime)
                    .Parameter("date2", dateTime.AddDays(1))
                    .QuerySingle<int>();
                //活跃的人员
                data.ActiveMobile = context.Sql(@"SELECT COUNT(*) FROM (SELECT MobileClientID FROM MobileApp ma WHERE ma.CreateTime>@date1 and ma.CreateTime<@date2 GROUP BY ma.MobileClientID ) A")
                    .Parameter("date1", dateTime)
                    .Parameter("date2", dateTime.AddDays(1))
                    .QuerySingle<int>();
                //新增用户占比
                float newMobilePercent = data.TotalMobile == 0 ? 0 : ((float)data.TodayMobile / (float)data.TotalMobile);
                data.NewMobilePercent = newMobilePercent.ToString("P2");

                return data;
            }
        }

        public DataTable GetRecentMobileStatistics(int day)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT RegDate,ISNULL(ClientCount,0) FROM
(select convert(varchar,dateadd(d,-1*number,getdate()),23) RegDate
from master.dbo.spt_values
where [type]='P' and number<@day) a
LEFT JOIN
(select convert(varchar(10),CreateTime,120) CreateTime,COUNT(ClientKey) ClientCount
from MobileClient where datediff(m,CreateTime,getdate())<@day
group by convert(varchar(10),CreateTime,120)) b ON a.RegDate=b.CreateTime  ORDER BY a.RegDate")
                    .Parameter("day", day)
                    .QuerySingle<DataTable>();
            }
        }

        public DataTable GetRecentStoreStatistics(int day)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT RegDate,ISNULL(ClientCount,0) FROM
(select convert(varchar,dateadd(d,-1*number,getdate()),23) RegDate
from master.dbo.spt_values
where [type]='P' and number<@day) a
LEFT JOIN
(select convert(varchar(10),CreateTime,120) CreateTime,COUNT(ClientKey) ClientCount
from PCClient p where datediff(m,CreateTime,getdate())<@day
group by convert(varchar(10),CreateTime,120)) b ON a.RegDate=b.CreateTime  ORDER BY a.RegDate")
                    .Parameter("day", day)
                    .QuerySingle<DataTable>();
            }
        }

        public DataTable GetRecentInstallAppStatistics(int day)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT RegDate,ISNULL(PackageCount,0) FROM
(select convert(varchar,dateadd(d,-1*number,getdate()),23) RegDate
from master.dbo.spt_values
where [type]='P' and number<@day) a
LEFT JOIN
(select convert(varchar(10),CreateTime,120) CreateTime,COUNT(PackageName) PackageCount
from MobileApp p where datediff(m,CreateTime,getdate())<@day
group by convert(varchar(10),CreateTime,120)) b ON a.RegDate=b.CreateTime  ORDER BY a.RegDate")
                    .Parameter("day", day)
                    .QuerySingle<DataTable>();
            }
        }

        public DataTable GetStoreStatistics(string userId)
        {
            using (var context = GetContext)
            {
                var sql = @"SELECT p.PCClientID,p.ClientName,TotalClient=(SELECT COUNT(*) FROM MobileClient mc WHERE mc.PCClientID=p.PCClientID),
Last7daysClient=(SELECT COUNT(1) FROM MobileClient mc WHERE datediff(d,mc.UpdateTime,GETDATE())<7 AND mc.PCClientID=p.PCClientID),
FirstCount =(SELECT COUNT(distinct ma.MobileAppID) FROM MobileClient mc LEFT JOIN MobileApp ma ON ma.MobileClientID = mc.MobileClientID
WHERE ma.FirstTime IS NOT NULL and mc.PCClientID=p.PCClientID),
SecondCount =(SELECT COUNT(distinct ma.MobileAppID) FROM MobileClient mc LEFT JOIN MobileApp ma ON ma.MobileClientID = mc.MobileClientID
WHERE ma.SecondTime IS NOT NULL AND mc.PCClientID=p.PCClientID),
TotalInstall=(SELECT COUNT(*) FROM MobileApp AS ma INNER JOIN MobileClient AS mc ON mc.MobileClientID = ma.MobileClientID
WHERE ma.CreateTime IS NOT NULL AND mc.PCClientID=p.PCClientID),
TotalRemove=(SELECT COUNT(*) FROM MobileApp AS ma INNER JOIN MobileClient AS mc ON mc.MobileClientID = ma.MobileClientID
             WHERE ma.RemoveTime IS NOT NULL AND mc.PCClientID=p.PCClientID)
FROM PCClient p ";
                if (!string.IsNullOrEmpty(userId))
                {
                    sql += string.Format("where p.UserID='{0}'", userId);
                }
                return
                    context.Sql(sql).QuerySingle<DataTable>();
            }
        }

        public DataTable GetAppStatistics(string userId,int index = 1)
        {
            using (var context = GetContext)
            {
                var sql = @"SELECT a.ApplicationID,a.ApplicationName,a.PackageName,COUNT(ma.MobileAppID) TotalClient,
TotalInstall=(SELECT COUNT(1) FROM RunLog rl WHERE rl.[Action]=1 AND rl.PackageName=a.PackageName),
ActiveStart=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE ma.FirstTime IS NOT NULL AND ma.SecondTime IS NOT NULL AND ma.PackageName=a.PackageName),
TodayStart=(SELECT COUNT(1) FROM RunLog rl WHERE rl.[Action]=2 AND rl.PackageName=a.PackageName AND datediff(DAY,rl.StartTime,getdate())=0),
Last7days=(SELECT count(DISTINCT m.MobileClientID) FROM RunLog rl INNER JOIN MobileApp m ON rl.MobileAppID = m.MobileAppID 
           WHERE rl.PackageName=a.PackageName AND datediff(DAY,rl.StartTime,getdate())<7)
FROM [Application] a LEFT JOIN MobileApp ma ON a.PackageName=ma.PackageName ";
                if (!string.IsNullOrEmpty(userId))
                {
                    sql += string.Format("where ma.MobileClientID in (select mc.MobileClientID from PCClient p inner join MobileClient mc on p.PCClientID=mc.PCClientID where p.UserID='{0}' ", userId);
                }
                sql += "GROUP BY a.ApplicationID, ApplicationName,a.PackageName";
                return context.Sql(sql).QuerySingle<DataTable>();
            }
        }

        public DataTable GetClientStatistics(string userId, int index = 1)
        {
            using (var context = GetContext)
            {
                var sql = @"SELECT mc.MobileClientID,mc.ClientKey,COUNT(ma.MobileAppID) TotalInstall,
FirstCount=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE ma.FirstTime IS NOT NULL AND ma.MobileClientID=mc.MobileClientID),
SecondCount=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE ma.SecondTime IS NOT NULL AND ma.MobileClientID=mc.MobileClientID),
TodayStart=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE datediff(DAY,ma.UpdateTime,getdate())=0 AND ma.MobileClientID=mc.MobileClientID)
FROM MobileClient mc LEFT JOIN MobileApp ma ON ma.MobileClientID = mc.MobileClientID ";
                if (!string.IsNullOrEmpty(userId))
                {
                    sql += string.Format("inner join PCClient p on p.PCClientID=mc.PCClientID where p.UserID='{0}' ", userId);
                }
                sql += " GROUP BY mc.MobileClientID, mc.ClientKey,mc.CreateTime ORDER BY mc.CreateTime DESC";
                return context.Sql(sql).QuerySingle<DataTable>();
            }
        }

        public DataTable GetStoreClientStatistics(string pcid, int index = 1)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT mc.MobileClientID,mc.ClientKey,COUNT(ma.MobileAppID) TotalInstall,
FirstCount=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE ma.FirstTime IS NOT NULL AND ma.MobileClientID=mc.MobileClientID),              
SecondCount=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM MobileApp ma 
              WHERE ma.SecondTime IS NOT NULL AND ma.MobileClientID=mc.MobileClientID),
TodayStart=(SELECT COUNT(DISTINCT ma.MobileAppID) FROM RunLog AS rl INNER JOIN MobileApp AS ma ON ma.MobileAppID = rl.MobileAppID
WHERE rl.[Action]=3 and datediff(DAY,rl.EndTime,getdate())=0 AND ma.MobileClientID=mc.MobileClientID)
FROM MobileClient mc LEFT JOIN MobileApp ma ON ma.MobileClientID = mc.MobileClientID
WHERE mc.PCClientID=@PCClientID
GROUP BY mc.MobileClientID, mc.ClientKey,mc.CreateTime ORDER BY mc.CreateTime DESC")
                                                                                   .Parameter("PCClientID", pcid)
                                                                                   .QuerySingle<DataTable>();
            }
        }

        public DataTable GetClientAppStatistics(string id, int index = 1)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT ma.MobileAppID,mc.ClientKey,a.ApplicationName,ma.CreateTime,ma.RemoveTime,ma.FirstTime,ma.SecondTime,ma.Totaltime,ma.Frequency,ma.UpdateTime
  FROM MobileApp ma LEFT JOIN MobileClient mc ON mc.MobileClientID = ma.MobileClientID
  LEFT JOIN [Application] a ON ma.PackageName=a.PackageName
WHERE mc.MobileClientID=@MobileClientID
ORDER BY mc.UpdateTime DESC")
                                                        .Parameter("MobileClientID", id)
                                                        .QuerySingle<DataTable>();
            }
        }

        /// <summary>
        /// 获取应用的客户端安装情况
        /// </summary>
        /// <param name="id"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        public DataTable GetAppClientStatistics(string id, int index = 1)
        {
            using (var context = GetContext)
            {
                return context.Sql(@"SELECT ma.MobileAppID,mc.ClientKey,ma.FirstTime,ma.SecondTime,ma.Totaltime,ma.Frequency,ma.UpdateTime
  FROM MobileApp ma LEFT JOIN MobileClient mc ON mc.MobileClientID = ma.MobileClientID
WHERE ma.ApplicationID=@ApplicationID  ORDER BY mc.UpdateTime DESC")
                                                        .Parameter("ApplicationID", id)
                                                        .QuerySingle<DataTable>();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        public PagedList<RunLog> GetAppLogStatistics(string id, int index)
        {
            using (var db = new appstoreEntities())
            {
                var qry = db.RunLog.AsQueryable();
                if (!string.IsNullOrEmpty(id))
                {
                    qry = qry.Where(a => a.MobileAppID == id);
                }

                var model = qry.OrderByDescending(a => a.UpdateTime).ToPagedList(index, 10);
                return model;
            }
            return null;
        }

        public DataTable GetDitie()
        {
            using (var context = GetContext)
            {
                return context.Sql("SELECT * FROM ditie AS t").QuerySingle<DataTable>();
            }
        }
    }
}
