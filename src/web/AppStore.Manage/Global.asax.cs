using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using AppStore.Business;
using Lennon.Utility;
using WebMatrix.WebData;

namespace AppStore.Manage
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
            
            ValueProviderFactories.Factories.Add(new JsonValueProviderFactory());

            //添加下列代码
            //WebSecurity.InitializeDatabaseConnection("DefaultConnection", "UserProfile", "UserId", "UserName", autoCreateTables: true);
            //初始化权限
            Singleton<AuthorizeBusiness>.Instance.InitPermission();
        }

        protected void Application_PostAuthenticateRequest(object sender, System.EventArgs e)
        {
            var formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
            if (formsIdentity != null && formsIdentity.IsAuthenticated && formsIdentity.AuthenticationType == "Forms")
            {
                HttpContext.Current.User = Singleton<AuthorizeBusiness>.Instance.TryParsePrincipal(HttpContext.Current.Request);
            }
        }
    }
}