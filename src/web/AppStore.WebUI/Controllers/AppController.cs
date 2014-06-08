using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppStore.Business;
using AppStore.Common;
using Lennon.Utility;

namespace AppStore.WebUI.Controllers
{
    public class AppController : BaseController
    {
        //
        // GET: /App/
        public ActionResult Index(string category, int index = 1)
        {
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList(null, category, null, null, "Total", false, true, index);
            RebuildList(list);
            var installList = Singleton<ApplicationBusiness>.Instance.GetApplicationList(null, category, null, null, "Total", false, true, index, 2);
            RebuildList(installList);
            installList.AddRange(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(TranModels(installList));
            return View("_List", list);
        }

    }
}
