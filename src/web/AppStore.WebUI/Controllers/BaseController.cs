using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppStore.Common;
using AppStore.Models;

namespace AppStore.WebUI.Controllers
{
    public class BaseController : Controller
    {
        protected readonly ServerSetting _setting = ServerSettingProxy.Instance.LoadConfig();

        protected void RebuildList(IList<Application> list)
        {
            foreach (var item in list)
            {
                item.Icon = string.IsNullOrEmpty(item.Icon) ? "/Images/android.png" : Path.Combine(_setting.DownloadPath, item.Icon).Replace('\\','/');
                item.PictureUrl = string.IsNullOrEmpty(item.PictureUrl) ? "/Images/nopicture.jpg" : Path.Combine(_setting.DownloadPath, item.PictureUrl).Replace('\\', '/');
                item.RelativePath = string.IsNullOrEmpty(item.RelativePath) ? string.Empty : Path.Combine(_setting.DownloadPath, item.RelativePath).Replace('\\', '/');
                item.DownloadUrl = string.IsNullOrEmpty(item.DownloadUrl) ? string.Empty : Path.Combine(_setting.DownloadPath, item.DownloadUrl).Replace('\\', '/');
                item.Description = "";
            }
        }
    }
}
