using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AppStore.Business;
using AppStore.Common;
using AppStore.Manage.Models;
using AppStore.Models;
using Lennon.Utility;
using WebMatrix.WebData;

namespace AppStore.Manage.Controllers
{
    public class SystemController : BaseController
    {
        //
        // GET: /System/
        [Description("系统管理首页")]
        public ActionResult Index()
        {
            return RedirectToAction("MobileClientList");
        }

        #region Mobile
        [Description("手机列表")]
        public ActionResult MobileList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetMobileList(index);
            return View(list);
        }

        [Description("手机查看")]
        public ActionResult Mobile(string id)
        {
            var mobile = Singleton<SystemBusiness>.Instance.GetMobile(id);
            var list = Singleton<SystemBusiness>.Instance.GetDriverList(1);
            ViewBag.DriveryList = list;
            if (mobile == null)
            {
                mobile = new Mobile();
                mobile.MobileID = Guid.NewGuid().ToString();
            }
            return View(mobile);
        }

        [Description("手机修改")]
        [HttpPost]
        public ActionResult Mobile(Mobile mobile)
        {
            var result = Singleton<SystemBusiness>.Instance.SaveMobile(mobile);
            if (result)
            {
                return RedirectToAction("MobileList");
            }
            return View(mobile);
        }
        #endregion

        #region Driver
        [Description("驱动列表")]
        public ActionResult DriverList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetDriverList(index);
            return View(list);
        }

        [Description("驱动查看")]
        public ActionResult Driver(string id)
        {
            var data = Singleton<SystemBusiness>.Instance.GetDriver(id);
            if (data == null)
            {
                data = new Driver();
                data.DriverID = Guid.NewGuid().ToString();
            }
            return View(data);
        }

        [Description("驱动编辑")]
        [HttpPost]
        public ActionResult Driver(Driver driver)
        {
            var result = Singleton<SystemBusiness>.Instance.SaveDriver(driver);
            if (result)
            {
                return RedirectToAction("DriverList");
            }
            return View(driver);
        }

        [HttpPost]
        public JsonResult UploadDriver(FormCollection fc)
        {
            Thread.Sleep(10 * 1000);
            var fileInfoList = Singleton<UploadHelper>.Instance.UploadDriver(Request);
            return Json(fileInfoList);
        }
        #endregion

        #region Brand
        [Description("品牌列表")]
        public ActionResult BrandList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetBrandList(index);
            return View(list);
        }

        [Description("品牌查看")]
        public ActionResult BrandEdit(string id)
        {
            var data = Singleton<SystemBusiness>.Instance.GetBrand(id);
            if (data == null)
            {
                data = new Brand();
                data.BrandID = Guid.NewGuid().ToString();
            }
            return View(data);
        }

        [Description("品牌编辑")]
        [HttpPost]
        public ActionResult BrandEdit(Brand ent)
        {
            var result = Singleton<SystemBusiness>.Instance.SaveBrand(ent);
            if (result)
            {
                return RedirectToAction("BrandList");
            }
            return View(ent);
        }
        #endregion

        [Description("用户查看")]
        public ActionResult UserEdit(string id)
        {
            var data = new User();
            if (id!= null)
            {
                data = Singleton<SystemBusiness>.Instance.GetUserProfile(id);
            }
            ViewBag.Roles = Roles.GetAllRoles();
            return View(data);
        }

        [Description("用户编辑")]
        [HttpPost]
        public ActionResult UserEdit(User profile)
        {
            var result = Singleton<SystemBusiness>.Instance.SaveUserProfile(profile);
            if (result)
            {
                return RedirectToAction("UserEdit");
            }
            return View(profile);
        }

        [Description("用户列表")]
        public ActionResult UserList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetUserProfiles(index);
            return View(list);
        }

        #region PCClient
        [Description("装机店列表")]
        public ActionResult PCClientList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetPCClientList(index);
            return View(list);
        }

        [Description("装机店查看")]
        public ActionResult PCClientEdit(string id)
        {
            var data = Singleton<SystemBusiness>.Instance.GetPCClient(id);
            if (data == null)
            {
                data = new PCClient();
                data.PCClientID = Guid.NewGuid().ToString();
            }
            return View(data);
        }

        [Description("装机店编辑")]
        [HttpPost]
        public ActionResult PCClientEdit(PCClient ent)
        {
            var result = Singleton<SystemBusiness>.Instance.SavePCClient(ent);
            if (result)
            {
                return RedirectToAction("PCClientList");
            }
            return View(ent);
        }
        #endregion

        #region MobileClient
        [Description("手机端列表")]
        public ActionResult MobileClientList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetMobileClientList(index);
            return View(list);
        }

        [Description("手机端查看")]
        public ActionResult MobileClientEdit(string id)
        {
            var data = Singleton<SystemBusiness>.Instance.GetMobileClient(id);
            if (data == null)
            {
                data = new MobileClient();
                data.MobileClientID = Guid.NewGuid().ToString();
            }
            return View(data);
        }

        [Description("手机端编辑")]
        [HttpPost]
        public ActionResult MobileClientEdit(MobileClient ent)
        {
            var result = Singleton<SystemBusiness>.Instance.SaveMobileClient(ent);
            if (result)
            {
                return RedirectToAction("MobileClientList");
            }
            return View(ent);
        }
        #endregion
    }
}
