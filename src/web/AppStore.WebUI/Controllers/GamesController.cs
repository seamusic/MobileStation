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
    public class GamesController : BaseController
    {
        //
        // GET: /Games/

        public ActionResult Index(string category, int index = 1)
        {
            ViewBag.Title = "游戏娱乐";
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.游戏娱乐, category, null, null, "Total", false, true, index, 18);
            RebuildList(list);
            var installList = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.游戏娱乐, category, null, null, "Total", false, true, index, 2);
            RebuildList(installList);
            installList.AddRange(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(TranModels(installList));
            ViewBag.Categories = Singleton<ApplicationBusiness>.Instance.GetCategories((int)ApplicationType.游戏娱乐);
            ViewBag.Category = Singleton<ApplicationBusiness>.Instance.GetCategory(category);
            var topRanking = Singleton<ApplicationBusiness>.Instance.GetTopRanking((int)ApplicationType.游戏娱乐, category);
            var recommen = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.游戏娱乐,
                  category, null, true, "Seq", false, true, 1, 6);
            RebuildList(topRanking);
            ViewBag.TopRanking = topRanking;
            RebuildList(recommen);
            ViewBag.Recommen = recommen;
            return View("_List", list);
        }
    }
}