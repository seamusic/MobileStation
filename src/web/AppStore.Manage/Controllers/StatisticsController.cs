using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppStore.Manage.Controllers
{
    public class StatisticsController : Controller
    {
        //
        // GET: /Statistics/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Stores()
        {
            return View();
        }

        public ActionResult Clients()
        {
            return View();
        }

        public ActionResult Apps()
        {
            return View();
        }
    }
}
