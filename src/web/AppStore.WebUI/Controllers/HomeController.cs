using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using AppStore.Business;
using AppStore.Common;
using Lennon.Utility;
using Lennon.Utils;

namespace AppStore.WebUI.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /Home/
        public ActionResult Index(string category, int index = 1)
        {
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.装机必备, category, null, false, true, index);
            RebuildList(list);
            var installList = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.装机必备, category, null, true, true, index, 2);
            RebuildList(installList);
            installList.AddRange(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(installList);
            return View("_List", list);
        }

        public ActionResult Detail(string id)
        {
            var detail = Singleton<ApplicationBusiness>.Instance.GetApplication(id);
            detail.Icon = string.IsNullOrEmpty(detail.Icon) ? "/Images/android.png" : Path.Combine(_setting.DownloadPath, detail.Icon);
            detail.PictureUrl = string.IsNullOrEmpty(detail.PictureUrl) ? "/Images/nopicture.jpg" : Path.Combine(_setting.DownloadPath, detail.PictureUrl);
            detail.RelativePath = string.IsNullOrEmpty(detail.RelativePath) ? string.Empty : Path.Combine(_setting.DownloadPath, detail.RelativePath);
            detail.DownloadUrl = string.IsNullOrEmpty(detail.DownloadUrl) ? string.Empty : Path.Combine(_setting.DownloadPath, detail.DownloadUrl);
            ViewBag.Pictures = Singleton<ApplicationBusiness>.Instance.GetApplicationPictures(id);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(detail);

            return View("_Detail", detail);
        }

        public ActionResult Recommend(string controller, string category, int index = 1)
        {
            controller = controller.ToLower();
            ApplicationType applicationType;
            switch (controller)
            {
                case "games":
                    applicationType = ApplicationType.游戏;
                    break;
                case "apps":
                    applicationType = ApplicationType.应用;
                    break;
                case "home":
                    applicationType = ApplicationType.装机必备;
                    break;
                default:
                    applicationType = ApplicationType.装机必备;
                    break;
            }
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)applicationType, category, null, true, true, index, 2);
            RebuildList(list);
            ViewBag.RecommendData = Utilities.DataToJsonToBase64(list);
            return View("_Recommend", list);
        }
    }
}
