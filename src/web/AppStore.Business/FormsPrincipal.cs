using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using Lennon.Utility;

namespace AppStore.Business
{
    class FormsPrincipal:IPrincipal
    {
        private System.Web.Security.FormsAuthenticationTicket ticket;
        private UserDataPrincipal UserData;

        public FormsPrincipal(System.Web.Security.FormsAuthenticationTicket ticket, UserDataPrincipal userData)
        {
            if (ticket == null)
                throw new ArgumentNullException("ticket");
            if (userData == null)
                throw new ArgumentNullException("userData");

            this.ticket = ticket;
            this.UserData = userData;
        }
        public bool IsInRole(string role)
        {
            var userData = UserData as UserDataPrincipal;
            if (userData == null)
                throw new NotImplementedException();

            return Singleton<AuthorizeBusiness>.Instance.IsInRole(userData.UserId,role);
        }

        public IIdentity Identity { get; private set; }
    }

    class UserDataPrincipal
    {
        public string UserName;
        public string UserId { get; set; }
    }
}
