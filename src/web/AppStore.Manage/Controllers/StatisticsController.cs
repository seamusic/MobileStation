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

        public ActionResult Stores(int index=1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetStoreStatistics();
            return View(data);
        }

        public ActionResult StoreDetail(string id)
        {
            return View();
        }

        public ActionResult Clients(int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetClientStatistics(index);
            return View(data);
        }

        public ActionResult ClientDetail(string id)
        {
            return View();
        }

        public ActionResult Apps(int index=1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetAppStatistics(index);
            return View(data);
        }
        public ActionResult AppDetail(string id)
        {
            return View();
        }
    }
}
