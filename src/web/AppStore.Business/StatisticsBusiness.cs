using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Text;

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
    }
}
