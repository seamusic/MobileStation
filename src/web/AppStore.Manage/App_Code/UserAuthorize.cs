using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AppStore.Business;
using AppStore.Models;
using Lennon.Utility;

namespace AppStore.Manage
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class UserAuthorizeAttribute : AuthorizeAttribute
    {
        private bool _isPermissionFail;
        public bool _authorize { get; set; }

        public UserAuthorizeAttribute()
        {
            if (HttpContext.Current.User != null)
            {
                var user = HttpContext.Current.User as FormsPrincipal;
                if (user != null)
                    _authorize = (user.IsInRole(Roles) || user.IsInUser(Users));
            }
            _authorize = HttpContext.Current.User != null && HttpContext.Current.User.Identity.Name != "";
        }
        public UserAuthorizeAttribute(string permission)
        {
            if (HttpContext.Current.User.Identity.Name != "")
            {
                _authorize = Singleton<AuthorizeBusiness>.Instance.CheckUserHasPermision(HttpContext.Current.User.Identity.Name, permission);
                if (_authorize == false)
                {
                    _isPermissionFail = true;
                }
            }
            else
            {
                _authorize = false;
            }
            _authorize = true;
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Session != null)
            {
                var user = filterContext.HttpContext.Session["CurrentUser"] as User;

                if (user == null)
                {
                    FormsAuthentication.RedirectToLoginPage();
                    return;
                }

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
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            if (_isPermissionFail)
            {
                filterContext.HttpContext.Response.Redirect("/Admin/PermissionError");
            }
            else
            {
                base.HandleUnauthorizedRequest(filterContext);
            }

        }

    }
}
