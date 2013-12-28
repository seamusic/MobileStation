using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using AppStore.Business;
using Dapper;
using Dapper.Contrib.Extensions;
using FluentData;
using Lennon.Utility;

namespace AppStore.Manage.Controllers
{
    public class StatisticsController : Controller
    {
        private IDbContext Context()
        {
            IDbProvider dbProvider = new SqlServerProvider();
            return new DbContext().ConnectionStringName("DefaultConnection", dbProvider);
        }
        //
        // GET: /Statistics/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Stores(int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetStoreStatistics();
            return View(data);
        }

        public ActionResult StoreDetail(string id, int index=1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetStoreClientStatistics(id, index);
            return View(data);
        }

        public ActionResult Clients(int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetClientStatistics(index);
            return View(data);
        }

        public ActionResult ClientDetail(string id, int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetClientAppStatistics(id, index);
            return View(data);
        }

        public ActionResult Apps(int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetAppStatistics(index);
            return View(data);
        }
        public ActionResult AppDetail(string id, int index=1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetAppLogStatistics(id, index);
            return View(data);
        }

        public ActionResult GetDitie()
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetDitie();
            return View(data);
        }
    }
}
