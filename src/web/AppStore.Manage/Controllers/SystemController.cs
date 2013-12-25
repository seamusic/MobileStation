using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AppStore.Business;
using AppStore.Common;
using AppStore.Models;
using Lennon.Utility;
using WebMatrix.WebData;

namespace AppStore.Manage.Controllers
{
    public class SystemController : Controller
    {
        //
        // GET: /System/

        public ActionResult Index()
        {
            return RedirectToAction("MobileClientList");
        }

        #region Mobile
        public ActionResult MobileList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetMobileList(index);
            return View(list);
        }

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
        public ActionResult DriverList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetDriverList(index);
            return View(list);
        }

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
            var fileInfoList = Singleton<UploadHelper>.Instance.UploadDriver(Request);
            return Json(fileInfoList);
        }
        #endregion

        #region Brand
        public ActionResult BrandList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetBrandList(index);
            return View(list);
        }

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

        public ActionResult UserEdit(int? id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult UserEdit(FormCollection form)
        {
            WebSecurity.CreateUserAndAccount(form["userName"], "Admin");
            if (!Roles.RoleExists("Administrator"))
            {
                Roles.CreateRole("Administrator");
            }
            Roles.AddUserToRole("Admin", "Administrator");

            //((SimpleMembershipProvider)Membership.Provider).DeleteAccount("Admin");
            //Membership.DeleteUser("Admin");
            return View();
        }

        #region PCClient
        public ActionResult PCClientList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetPCClientList(index);
            return View(list);
        }

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
        public ActionResult MobileClientList(int index = 1)
        {
            var list = Singleton<SystemBusiness>.Instance.GetMobileClientList(index);
            return View(list);
        }

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
