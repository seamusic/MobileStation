using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppStore.Business;
using Lennon.Utility;

namespace AppStore.Manage.Controllers
{
    public class HomeController : Controller
    {
        private int recentDays = 15;
        public ActionResult Index()
        {
            var today = DateTime.Today;
            var date=new List<dynamic>
            {
                Singleton<StatisticsBusiness>.Instance.GetOverview(today),
                Singleton<StatisticsBusiness>.Instance.GetOverview(today.AddDays(-1))
            };
            ViewBag.OverViewData = date;
            return View();
        }

        public JsonResult GetRecentMobileStatistics()
        {
            DataTable data = Singleton<StatisticsBusiness>.Instance.GetRecentMobileStatistics(recentDays);
            var list= (from DataRow row in data.Rows 
                       select new KeyValuePair<string, int>(((DateTime) row[0]).ToString("yyyy-MM-dd"), (int) row[1])).ToList();
            return Json(list);
        }

        public JsonResult GetRecentInstallAppStatistics()
        {
            DataTable data = Singleton<StatisticsBusiness>.Instance.GetRecentInstallAppStatistics(recentDays);
            var list = (from DataRow row in data.Rows
                        select new KeyValuePair<string, int>(((DateTime)row[0]).ToString("yyyy-MM-dd"), (int)row[1])).ToList();
            return Json(list);
        }

        public JsonResult GetRecentStatistics()
        {
            DataTable mobileTable = Singleton<StatisticsBusiness>.Instance.GetRecentMobileStatistics(recentDays);
            var mobileList= (from DataRow row in mobileTable.Rows 
                       select new KeyValuePair<string, int>(row[0].ToString(), (int) row[1])).ToList();

            DataTable appTable = Singleton<StatisticsBusiness>.Instance.GetRecentInstallAppStatistics(recentDays);
            var appList = (from DataRow row in appTable.Rows
                           select new KeyValuePair<string, int>(row[0].ToString(), (int)row[1])).ToList();
            var list = new List<List<KeyValuePair<string, int>>>();
            list.Add(mobileList);
            list.Add(appList);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
