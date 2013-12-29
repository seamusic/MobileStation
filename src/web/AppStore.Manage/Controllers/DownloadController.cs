using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppStore.Business;
using AppStore.Common;
using Lennon.Utility;

namespace AppStore.Manage.Controllers
{
    public class DownloadController : Controller
    {
        private ServerSetting setting = ServerSettingProxy.Instance.LoadConfig();
        //
        // GET: /Download/

        public ActionResult Driver(string id)
        {
            var ent = Singleton<SystemBusiness>.Instance.GetDriver(id);
            if (ent != null)
            {
                return GetFileResult(Path.GetFileName(ent.DownloadUrl), ent.DownloadUrl);
            }
            return null;
        }

        public ActionResult App(string id)
        {
            var ent = Singleton<ApplicationBusiness>.Instance.GetApplication(id);
            if (ent != null)
            {
                return GetFileResult(ent.ApplicationName, ent.DownloadUrl);
            }
            return null;
        }

        private FileResult GetFileResult(string name, string url)
        {
            var downloadName = string.IsNullOrEmpty(name) ? Path.GetFileName(url) : name;
            var fileName = Server.MapPath(Path.Combine(setting.DownloadPath, url));
            if (System.IO.File.Exists(fileName))
            {
                return File(fileName, "application/octet-stream", Url.Encode(downloadName));
            }
            return null;
        }
    }
}
