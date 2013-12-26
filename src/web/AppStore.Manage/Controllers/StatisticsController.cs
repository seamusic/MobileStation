using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Dapper;
using Dapper.Contrib.Extensions;
using FluentData;

namespace AppStore.Manage.Controllers
{
    public class StatisticsController : Controller
    {
        private IDbContext Context()
        {
            IDbProvider dbProvider = new SqlServerProvider();
            return new DbContext().ConnectionStringName("DefaultConnection", dbProvider);
        }
        //
        // GET: /Statistics/

        public ActionResult Index()
        {
            using (var context = Context())
            {
                context.Sql("").QuerySingle<DataTable>();
            }
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
