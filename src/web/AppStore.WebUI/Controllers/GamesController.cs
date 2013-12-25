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
            var setting = ServerSettingProxy.Instance.LoadConfig();
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.游戏, category, null, null, index);
            RebuildList(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(list);
            return View("_List", list);
        }
    }
}