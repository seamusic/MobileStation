using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppStore.Business;
using AppStore.Common;
using Lennon.Utility;

namespace AppStore.WebUI.Controllers
{
    public class AppsController : BaseController
    {
        //
        // GET: /Apps/

        public ActionResult Index(string category, int index = 1)
        {
            ViewBag.Title = "应用工具";
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.应用工具, category, null, false, true, index);
            RebuildList(list);
            var installList = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.应用工具, category, null, true, true, index, 2);
            RebuildList(installList);
            installList.AddRange(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(installList);
            ViewBag.Categories = Singleton<ApplicationBusiness>.Instance.GetCategories((int)ApplicationType.应用工具);
            ViewBag.Category = Singleton<ApplicationBusiness>.Instance.GetCategory(category);
            var topRanking = Singleton<ApplicationBusiness>.Instance.GetTopRanking(category);
            RebuildList(topRanking);
            ViewBag.TopRanking = topRanking;
            return View("_List", list);
        }
    }
}
