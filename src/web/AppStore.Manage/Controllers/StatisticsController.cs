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

        public ActionResult StoreDetail(string id, int index = 1)
        {
            ViewBag.Store = Singleton<SystemBusiness>.Instance.GetPCClient(id);
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
            ViewBag.MobileClient = Singleton<SystemBusiness>.Instance.GetMobileClient(id);
            var data = Singleton<StatisticsBusiness>.Instance.GetClientAppStatistics(id, index);
            return View(data);
        }

        public ActionResult Apps(int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetAppStatistics(index);
            return View(data);
        }

        /// <summary>
        /// 显示应用的详细运行日志
        /// </summary>
        /// <param name="id">应用ID</param>
        /// <param name="index"></param>
        /// <returns></returns>
        public ActionResult AppDetail(string id, int index = 1)
        {
            ViewBag.App = Singleton<ApplicationBusiness>.Instance.GetApplication(id);
            var data = Singleton<StatisticsBusiness>.Instance.GetAppClientStatistics(id, index);
            return View(data);
        }

        public ActionResult GetDitie()
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetDitie();
            return View(data);
        }

        public ActionResult AppRunningLog(string id, int index = 1)
        {
            var mobileApp = Singleton<SystemBusiness>.Instance.GetMobileApp(id);
            ViewBag.App = Singleton<ApplicationBusiness>.Instance.GetApplication(mobileApp.ApplicationID);
            ViewBag.MobileClient = Singleton<SystemBusiness>.Instance.GetMobileClient(mobileApp.MobileClientID);
            return SearchRunningLog(id, index);
        }
        private ActionResult SearchRunningLog(string id, int index = 1)
        {
            var data = Singleton<StatisticsBusiness>.Instance.GetAppLogStatistics(id, index);
            if (Request.IsAjaxRequest())
                return PartialView("_RunlogList", data);
            return View(data);
        }
    }
}
