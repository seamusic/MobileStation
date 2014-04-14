using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Security;
using AppStore.Models;
using Lennon.Utility;

namespace AppStore.Business
{
    public class FormsPrincipal:IPrincipal
    {
        public UserDataPrincipal UserData { get; set; }

        public FormsPrincipal(System.Web.Security.FormsAuthenticationTicket ticket, UserDataPrincipal userData)
        {
            if (ticket == null)
                throw new ArgumentNullException("ticket");
            if (userData == null)
                throw new ArgumentNullException("userData");

            this.Ticket = ticket;
            this.UserData = userData;
            Identity = new FormsIdentity(Ticket);
        }

        public bool IsAdmin
        {
            get
            {
                if (UserData == null)
                    throw new NotImplementedException();
                return UserData.Roles.IndexOf("系统管理员", System.StringComparison.Ordinal) > -1;
            }
        }

        public bool IsInRole(string role)
        {
            var userData = UserData as UserDataPrincipal;
            if (userData == null)
                throw new NotImplementedException();

            return UserData.IsInRole(role);
        }
        
        //用户名验证
        public bool IsInUser(string user)
        {
            var userData = UserData as UserDataPrincipal;
            if (userData == null)
                throw new NotImplementedException();

            return userData.IsInUser(user);
        }

        public IIdentity Identity { get; private set; }

        public System.Web.Security.FormsAuthenticationTicket Ticket { get; set; }
    }


    public class UserDataPrincipal : IPrincipal
    {
        public string UserName { get; set; }
        public string LoginId { get; set; }
        public string UserId { get; set; }

        public string Roles { get; set; }

        [ScriptIgnore]
        public IIdentity Identity
        {
            get
            {
                return new FormsIdentity(Ticket);
            }
        }

        public bool IsInRole(string roles)
        {
            return Singleton<AuthorizeBusiness>.Instance.IsInRole(LoginId, roles);
        }
        
        //验证用户信息
        public bool IsInUser(string users)
        {
            return Singleton<AuthorizeBusiness>.Instance.IsInUser(users);
        }

        public FormsAuthenticationTicket Ticket { get; set; }
    }

    public class UserIdentity : IIdentity
    {
        private User user;
        public UserIdentity(User user)
        {
            this.user = user;
        }
        public string AuthenticationType
        {
            get { return ""; }
        }

        public bool IsAuthenticated
        {
            get { return true; }
        }

        public string Name
        {
            get { return user.LoginId; }
        }
    }
}
