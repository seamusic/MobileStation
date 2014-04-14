using System.Web.Mvc;
using AppStore.Business;
using AppStore.Models;
using Lennon.Utility;

namespace AppStore.Manage
{
    public class UserAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Session != null)
            {
                var user = filterContext.HttpContext.Session["CurrentUser"] as User;

                var controller = filterContext.RouteData.Values["controller"].ToString();
                var action = filterContext.RouteData.Values["action"].ToString();
                var isAllowed = Singleton<AuthorizeBusiness>.Instance.IsAllowed(user, controller, action);

                if (!isAllowed)
                {
                    filterContext.RequestContext.HttpContext.Response.Write("无权访问");
                    filterContext.RequestContext.HttpContext.Response.End();
                }
            }
        }
    }
}