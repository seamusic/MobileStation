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
using AppStore.Models;
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
            ViewBag.Title = "装机必备";
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.装机必备, category, null, false, true, index, 12);
            RebuildList(list);
            var installList = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)ApplicationType.装机必备, category, null, true, true, index, 2);
            RebuildList(installList);
            installList.AddRange(list);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(installList);
            ViewBag.Categories = Singleton<ApplicationBusiness>.Instance.GetCategories((int)ApplicationType.装机必备);
            ViewBag.Category = Singleton<ApplicationBusiness>.Instance.GetCategory(category);
            var topRanking = Singleton<ApplicationBusiness>.Instance.GetTopRanking(category);
            RebuildList(topRanking);
            ViewBag.TopRanking = topRanking;
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
            ViewBag.AppType = (ApplicationType)detail.AppType;
            ViewBag.Categories = Singleton<ApplicationBusiness>.Instance.GetCategories(detail.AppType);
            ViewBag.Category = Singleton<ApplicationBusiness>.Instance.GetCategory(detail.CategoryID);
            ViewBag.Title = detail.ApplicationName;
            ViewBag.TopRanking = Singleton<ApplicationBusiness>.Instance.GetTopRanking(detail.CategoryID);
            return View("_Detail", detail);
        }

        public ActionResult Recommend(string controller, string category, int index = 1)
        {
            controller = controller.ToLower();
            ApplicationType applicationType;
            switch (controller)
            {
                case "games":
                    applicationType = ApplicationType.游戏娱乐;
                    break;
                case "apps":
                    applicationType = ApplicationType.应用工具;
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
            ViewBag.Categories = Singleton<ApplicationBusiness>.Instance.GetCategories((int)applicationType);
            return View("_Recommend", list);
        }

        public IList<string> SearchHistory
        {
            get
            {
                var list = Session["SearchHistory"] as List<string>;
                if (list == null)
                {
                    list = new List<string>();
                    Session["SearchHistory"] = list;
                }
                return list;
            }
            set { Session["SearchHistory"] = value; }
        }
        public ActionResult Search(string keyword, int index = 1)
        {
            if (index == 1 && !string.IsNullOrEmpty(keyword))
            {
                if (SearchHistory.Count > 9)
                {
                    SearchHistory.RemoveAt(0);
                }
                SearchHistory.Add(keyword);
            }

            ViewBag.Title = string.Format("\"{0}\"查询结果", keyword);
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList(null, null, keyword, null, false, index, 10);
            RebuildList(list);
            return View(list);
        }
    }
}
