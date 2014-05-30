using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using ApkUtil;
using AppStore.Business;
using AppStore.Common;
using AppStore.Manage.Models;
using AppStore.Models;
using Lennon.Utility;
using Webdiyer.WebControls.Mvc;
using WebGrease;

namespace AppStore.Manage.Controllers
{
    public class ApplicationController : BaseController
    {
        //
        // GET: /Application/
        [Description("应用管理首页")]
        public ActionResult Index(int? appTypeId, string categoryId, string applicationName, int index = 1)
        {
            return SearchApplication(appTypeId, categoryId, applicationName, index);
        }

        private ActionResult SearchApplication(int? appTyle, string categoryId, string applicationName, int index = 1)
        {
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList(appTyle, categoryId, applicationName, null, "CreateTime", false, null, index);
            if (Request.IsAjaxRequest())
                return PartialView("_ApplicationList", list);
            return View(list);
        }

        [Description("应用列表")]
        public ActionResult CategoryList()
        {
            var list = Singleton<ApplicationBusiness>.Instance.GetCategory();
            return View(list);
        }

        public JsonResult GetCategoryList(int type)
        {
            var list = Singleton<ApplicationBusiness>.Instance.GetCategoryList(type);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [Description("查看应用分类")]
        public ActionResult CategoryEdit(string categoryId)
        {
            var category = Singleton<ApplicationBusiness>.Instance.GetCategory(categoryId) ?? new Category();
            return View(category);
        }

        [Description("编辑应用分类")]
        [HttpPost]
        public ActionResult CategoryEdit(Category category)
        {
            var result = Singleton<ApplicationBusiness>.Instance.SaveCategory(category);
            if (result)
            {
                return RedirectToAction("CategoryList");
            }
            return View(category);
        }

        public ActionResult Delete(string id)
        {
            var result = Singleton<ApplicationBusiness>.Instance.DeleteApplication(id);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return null;
        }

        public ActionResult DeleteCategory(string id)
        {
            var result = Singleton<ApplicationBusiness>.Instance.DeleteCategory(id);
            if (result)
            {
                return RedirectToAction("CategoryList");
            }
            return null;
        }

        [Description("查看应用")]
        public ActionResult ApplicationEdit(string id)
        {
            var application = Singleton<ApplicationBusiness>.Instance.GetApplication(id);
            IList<Category> categories = new List<Category>();
            IList<Picture> pictureList = new List<Picture>();

            if (application == null)
            {
                application = new Application();
                application.AppType = (int)ApplicationType.应用工具;
                application.ApplicationID = Guid.NewGuid().ToString();
                application.IsValid = true;
                application.AutoDownload = true;
            }
            else
            {
                pictureList = Singleton<ApplicationBusiness>.Instance.GetApplicationPictures(id);
            }

            categories = Singleton<ApplicationBusiness>.Instance.GetCategoryList(application.AppType);
            ViewBag.PictureListData = Utilities.DataToJsonToBase64(pictureList);
            ViewBag.PictureList = pictureList;
            ViewBag.CategoryList = categories;
            return View(application);
        }

        [Description("编辑应用")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ApplicationEdit(Application application, FormCollection fc)
        {
            if (application != null)
            {
                if (string.IsNullOrEmpty(application.ApplicationID))
                {
                    application.ApplicationID = Guid.NewGuid().ToString();
                }

                var imageStr = fc["images"];
                List<Picture> picList = null;
                if (!string.IsNullOrEmpty(imageStr))
                {
                    if (imageStr.IndexOf(application.ApplicationID, System.StringComparison.OrdinalIgnoreCase) > -1)
                    {
                        imageStr = Singleton<UploadHelper>.Instance.MotoPath(imageStr, application.ApplicationID, application.PackageName);
                        //imageStr = imageStr.Replace(application.ApplicationID, "android/" + application.PackageName);
                    }
                    string[] imgPaths = imageStr.Split(',');
                    picList = imgPaths.Select(path => new Picture
                    {
                        PictureID = Guid.NewGuid().ToString(),
                        Path = path,
                        ApplicationID = application.ApplicationID
                    }).ToList();
                }

                var result = Singleton<ApplicationBusiness>.Instance.SaveApplication(application, picList);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return ApplicationEdit(application.ApplicationID);
            }
            return null;
        }

        [HttpPost]
        public JsonResult UploadApk(FormCollection fc)
        {
            var fileInfoList = Singleton<UploadHelper>.Instance.Upload(Request, string.Empty, false);
            var uploadFileInfo = fileInfoList.FirstOrDefault();
            if (uploadFileInfo != null && uploadFileInfo.FileSize != 1024 * 1024)
            {

                try
                {
                    var applicationFileInfo = Singleton<UploadHelper>.Instance.SaveApk(uploadFileInfo);
                    return Json(applicationFileInfo);
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            return null;
        }

        [HttpPost]
        public JsonResult UploadPicture(FormCollection fc)
        {
            var path = Request.Headers["path"];
            if (string.IsNullOrEmpty(path))
            {
                path = Guid.NewGuid().ToString();
            }
            var fileInfoList = Singleton<UploadHelper>.Instance.Upload(Request, path, true);
            return Json(fileInfoList);
        }

        public ActionResult OrderList(int? AppTypeID = 3)
        {
            if (AppTypeID != null && AppTypeID != 0)
            {
                var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList(AppTypeID, null, null, null, "", true, null, 1, 1000);
                return View(list);
            }
            return View();
        }

        [HttpPost]
        public ActionResult OrderList(string order)
        {
            var result = new OperateResult(false);

            if (!string.IsNullOrEmpty(order))
            {
                var ids = order.Split(',');
                for (int i = 0; i < ids.Length; i++)
                {
                    Singleton<ApplicationBusiness>.Instance.SaveAppLication(ids[i], i + 1);
                }
                result.Result = true;
            }

            return Json(result);
        }
    }
}
