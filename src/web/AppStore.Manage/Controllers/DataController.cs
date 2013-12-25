using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using AppStore.Business;
using AppStore.Common;
using AppStore.Models;
using Lennon.Utility;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace AppStore.Manage.Controllers
{
    public class DataController : Controller
    {
        private ServerSetting setting = ServerSettingProxy.Instance.LoadConfig();
        //
        // GET: /Data/
        public JsonResult Index(string type, string category, int index = 1)
        {
            var applicationType = type == "game" ? ApplicationType.游戏 : ApplicationType.应用;
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)applicationType, category, null, null, index);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(list);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Detail(string id)
        {
            var detail = Singleton<ApplicationBusiness>.Instance.GetApplication(id);
            ViewBag.DataJson = Utilities.DataToJsonToBase64(detail);

            return Json(detail, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Recommend(string type, string category, int index = 1)
        {
            var applicationType = type == "game" ? ApplicationType.游戏 : ApplicationType.应用;
            var list = Singleton<ApplicationBusiness>.Instance.GetApplicationList((int)applicationType, category, null, (bool?)true, index, 2);
            ViewBag.RecommendData = Utilities.DataToJsonToBase64(list);
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveLog(RunLog runLog)
        {
            var result = Singleton<LogBusiness>.Instance.SaveRunLog(runLog);
            return Json(result);
        }

        [HttpGet]
        public JsonResult SaveLog(string clientId, string appId, int runAction, string message)
        {
            var runLog = new RunLog() { Action = runAction, Message = message, MobileAppID = appId };
            var result = Singleton<LogBusiness>.Instance.SaveRunLog(runLog);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveRunningLog(FormCollection fc)
        {
            string clientId = fc["cid"];
            string pageName = fc["name"];
            int runAction = (int)RunAction.Other;
            if (!string.IsNullOrEmpty(fc["action"]))
            {
                int.Parse(fc["action"]);
            }
            string message = fc["msg"];
            var result = Singleton<LogBusiness>.Instance.SaveRunLog(clientId, pageName, runAction, message);
            return Json(result);
        }

        [HttpGet]
        public JsonResult SaveRunningLog(string clientId, string pageName, int runAction, string message)
        {
            var result = Singleton<LogBusiness>.Instance.SaveRunLog(clientId, pageName, runAction, message);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveMobileApp(MobileApp runLog)
        {
            var result = Singleton<LogBusiness>.Instance.SaveMobileApp(runLog);
            return Json(result);
        }

        [HttpGet]
        public JsonResult SaveMobileApp(string clientId, string appId, string datetime)
        {
            var result = Singleton<LogBusiness>.Instance.UpdateMobileAppTime(clientId, appId, datetime);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        #region 注册客户端 POST两种，GET一种
        /// <summary>
        /// 手机端注册客户端
        /// </summary>
        /// <param name="mobileClient"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult Registered(MobileClient mobileClient)
        {
            var result = Singleton<SystemBusiness>.Instance.RegisterMobileClient(mobileClient.ClientKey, mobileClient.ClientName, mobileClient.PhoneModelID);
            return Json(new OperateResult(result, string.Empty));
        }

        /// <summary>
        /// PC端注册手机客户端
        /// </summary>
        /// <param name="regClient"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult RegMobile(RegClient regClient)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(regClient.MobileKey))
            {
                result.Message = "MobileKey为空";
            }
            else if (string.IsNullOrEmpty(regClient.PCKey))
            {
                result.Message = "字符串为空";
            }
            else
            {
                try
                {
                    result.Result = Singleton<SystemBusiness>.Instance.RegMobileClient(regClient);
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "注册客户端时出错", ex);
                }
            }
            return Json(result.Result);
        }

        /// <summary>
        /// PC端注册一个刚安装的应用
        /// </summary>
        /// <param name="regClient"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult RegMobileApp(RegClient regClient)
        {
            var result = new OperateResult(false);
            //if (string.IsNullOrEmpty(mobileInfo))
            //{
            //    return Json(false);
            //}
            //RegClient regClient = null;
            //try
            //{
            //    regClient = JsonConvert.DeserializeObject<RegClient>(mobileInfo);
            //}
            //catch (Exception ex)
            //{
            //    return Json(false);
            //}
            //if (regClient == null)
            //{
            //    return Json(false);
            //}

            if (string.IsNullOrEmpty(regClient.MobileKey))
            {
                result.Message = "MobileKey为空";
            }
            else if (string.IsNullOrEmpty(regClient.PCKey))
            {
                result.Message = "字符串为空";
            }
            else
            {
                try
                {
                    result.Result = Singleton<SystemBusiness>.Instance.RegMobileApp(regClient.PCKey, regClient.MobileKey, regClient.PackageName);
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "注册客户端时出错", ex);
                }
            }
            return Json(result.Result);
        }

        [HttpPost]
        public JsonResult RegClient(FormCollection fc)
        {
            string key = fc["key"];
            string name = fc["name"];
            string model = fc["model"];

            var result = Singleton<SystemBusiness>.Instance.RegisterMobileClient(key, name, model);
            return Json(new OperateResult(result, string.Empty));
        }

        [HttpGet]
        public JsonResult Registered(string key, string name, string model)
        {
            var result = Singleton<SystemBusiness>.Instance.RegisterMobileClient(key, name, model);
            return Json(new OperateResult(result, string.Empty), JsonRequestBehavior.AllowGet);
        }
        #endregion

        [HttpGet]
        public JsonResult RegApp(string pcKey, string mobileKey, string packageName)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(pcKey))
            {
                result.Message = "pcKey为空";
            }
            else if (string.IsNullOrEmpty(mobileKey))
            {
                result.Message = "mobileKey为空";
            }
            else if (string.IsNullOrEmpty(packageName))
            {
                result.Message = "packageName为空";
            }
            else
            {
                try
                {
                    result.Result = Singleton<SystemBusiness>.Instance.RegMobileApp(pcKey, mobileKey, packageName);
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "同步客户端的APP时出错", ex);
                }
                //var result = Singleton<SystemBusiness>.Instance.GetMobileApplication(mobileClient.ClientKey);
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult MobileApp(MobileClient mobileClient)
        {
            var result = Singleton<SystemBusiness>.Instance.GetMobileApplication(mobileClient.ClientKey);

            JsonNetResult jsonNetResult = new JsonNetResult();
            jsonNetResult.Formatting = Formatting.Indented;
            jsonNetResult.DateFormatString = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
            jsonNetResult.Data = result;

            return jsonNetResult;
        }

        [HttpPost]
        public ActionResult GetSyncMobileApp(MobileClient mobileClient)
        {
            var result = Singleton<SystemBusiness>.Instance.GetSyncMobileApp(mobileClient.ClientKey);

            JsonNetResult jsonNetResult = new JsonNetResult();
            jsonNetResult.Formatting = Formatting.Indented;
            jsonNetResult.DateFormatString = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
            jsonNetResult.Data = result;

            return jsonNetResult;
        }

        [HttpPost]
        public ActionResult HasDownMobileApp(string clientKey, string mobileApps)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(clientKey))
            {
                result.Message = "key为空";
            }
            else if (string.IsNullOrEmpty(mobileApps))
            {
                result.Message = "字符串为空";
            }
            else
            {
                try
                {
                    var list = JsonConvert.DeserializeObject<List<String>>(mobileApps);
                    //var list = json.Deserialize<List<MobileApp>>(new JsonTextReader(new StringReader(mobileApps)));
                    if (list == null)
                    {
                        result.Message = "转换JSON出错";
                    }
                    else
                    {
                        result.Result = Singleton<SystemBusiness>.Instance.HasDownMobileApp(clientKey, list);
                    }
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "同步客户端的APP时出错", ex);
                }
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult PushMobileApp(string clientKey, string mobileApps)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(clientKey))
            {
                result.Message = "key为空";
            }
            else if (string.IsNullOrEmpty(mobileApps))
            {
                result.Message = "字符串为空";
            }
            else
            {
                var timeConverter = new IsoDateTimeConverter();
                //这里使用自定义日期格式，如果不使用的话，默认是ISO8601格式
                timeConverter.DateTimeFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
                //jsonObject是准备转换的对象
                var json = JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented, timeConverter);
                //var json = new Newtonsoft.Json.JsonSerializer();
                try
                {
                    var list = JsonConvert.DeserializeObject<List<MobileApp>>(mobileApps, timeConverter);
                    //var list = json.Deserialize<List<MobileApp>>(new JsonTextReader(new StringReader(mobileApps)));
                    if (list == null)
                    {
                        result.Message = "转换JSON出错";
                    }
                    else
                    {
                        result.Result = Singleton<SystemBusiness>.Instance.SavePushMobileApp(clientKey, list);
                    }
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "同步客户端的APP时出错", ex);
                }
                //var result = Singleton<SystemBusiness>.Instance.GetMobileApplication(mobileClient.ClientKey);
            }
            return Json(result);
        }

        //DONT USE THIS IF YOU NEED TO ALLOW LARGE FILES UPLOADS
        [HttpGet]
        public void Download(string id)
        {
            var filename = id;
            var filePath = Path.Combine(Server.MapPath(setting.UploadPath), filename);

            var context = HttpContext;

            if (System.IO.File.Exists(filePath))
            {
                context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                context.Response.ContentType = "application/octet-stream";
                context.Response.ClearContent();
                context.Response.WriteFile(filePath);
            }
            else
            {
                context.Response.StatusCode = 404;
            }
        }

        private string EncodeFile(string fileName)
        {
            return Convert.ToBase64String(System.IO.File.ReadAllBytes(fileName));
        }

        [HttpPost]
        public JsonResult GetDriver(MobileInfo info)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(info.pid) || string.IsNullOrEmpty(info.vid))
            {
                result.Message = "MobileKey为空";
            }
            else
            {
                var driver = Singleton<SystemBusiness>.Instance.GetDriver(info.pid, info.vid);
                return Json(driver == null ? "" : driver.DownloadUrl);
            }
            return Json(result.Result);
        }

        [HttpPost]
        public JsonResult SyncRunLog(string clientKey, string data)
        {
            var result = new OperateResult(false);
            if (string.IsNullOrEmpty(clientKey))
            {
                result.Message = "key为空";
            }
            else if (string.IsNullOrEmpty(data))
            {
                result.Message = "字符串为空";
            }
            else
            {
                var timeConverter = new IsoDateTimeConverter();
                //这里使用自定义日期格式，如果不使用的话，默认是ISO8601格式
                timeConverter.DateTimeFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
                //jsonObject是准备转换的对象
                var json = JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented, timeConverter);
                //var json = new Newtonsoft.Json.JsonSerializer();
                try
                {
                    var list = JsonConvert.DeserializeObject<List<RunLog>>(data, timeConverter);
                    //var list = json.Deserialize<List<MobileApp>>(new JsonTextReader(new StringReader(mobileApps)));
                    if (list == null)
                    {
                        result.Message = "转换JSON出错";
                    }
                    else
                    {
                        result.Result = Singleton<SystemBusiness>.Instance.SyncRunLog(clientKey, list);
                    }
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "SyncRunLog出错", ex);
                }
            }
            return Json(result);
        }
    }
}
