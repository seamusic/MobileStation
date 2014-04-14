using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Security.Principal;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using AppStore.Models;

namespace AppStore.Business
{
    public class AuthorizeBusiness : IBusiness
    {
        public bool IsAllowed(User user, string controller, string action)
        {
            if (user == null)
            {
                return false;
            }

            var actionPermissionList = HttpRuntime.Cache.Get("ActionPermissionList") as IList<ActionPermission>;
            if (actionPermissionList == null)
            {
                actionPermissionList = GetAllAction();
                HttpRuntime.Cache.Insert("ActionPermissionList", actionPermissionList);
            }

            var userRoleList = HttpRuntime.Cache.Get("UserRoleList") as IList<UserRole>;
            if (userRoleList == null)
            {
                userRoleList = GetUserRoles();
                HttpRuntime.Cache.Insert("UserRoleList", userRoleList);
            }

            var actionPermissionRoleList = HttpRuntime.Cache.Get("ActionPermissionRoleList") as IList<ActionPermissionRole>;
            if (actionPermissionRoleList == null)
            {
                actionPermissionRoleList = GetaActionPermissionRoles();
                HttpRuntime.Cache.Insert("ActionPermissionRoleList", actionPermissionRoleList);
            }


            // 找controllerActionControllerName
            var controllerAction = actionPermissionList.FirstOrDefault(ca => ca.IsController == false && ca.ActionName == action && ca.ControlName == controller);

            //action无记录，找controller
            if (controllerAction == null)
            {
                controllerAction = actionPermissionList.FirstOrDefault(ca => ca.IsController && ca.ControlName == controller);
            }

            // 无规则
            if (controllerAction == null)
            {
                return true;
            }


            // 允许没有角色的：也就是说允许所有人，包括没有登录的用户 
            if (controllerAction.IsAllowedNoneRoles)
            {
                return true;
            }

            var hasUser = HasUser(user.LoginId);
            if (!hasUser)
            {
                return false;
            }

            // 允许所有角色：只要有角色，就可以访问 
            if (controllerAction.IsAllowedAllRoles)
            {
                var roles = userRoleList.Where(ur => ur.UserId == user.UserId).ToList();
                if (roles.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }


            // 选出action对应的角色 ControllerActionId
            var actionRoles = actionPermissionRoleList.Where(ca => ca.ActionPermissionId == controllerAction.ActionPermissionId).ToList();
            if (actionRoles.Count == 0)
            {
                // 角色数量为0，也就是说没有定义访问规则，默认允许访问 
                return false;
            }

            var userHavedRolesids = userRoleList.Where(ur => ur.UserId == user.UserId).Select(ca => ca.RoleId).ToList();
            // 查找禁止的角色 
            var notAllowedRoles = actionRoles.FindAll(r => !r.IsAllowed).Select(ca => ca.RoleId).ToList();
            if (notAllowedRoles.Count > 0)
            {
                foreach (string roleId in notAllowedRoles)
                {
                    // 用户的角色在禁止访问列表中，不允许访问 
                    if (userHavedRolesids.Contains(roleId))
                    {
                        return false;
                    }
                }
            }

            // 查找允许访问的角色列表 
            var allowRoles = actionRoles.FindAll(r => r.IsAllowed).Select(ca => ca.RoleId).ToList();
            if (allowRoles.Count > 0)
            {
                foreach (string roleId in allowRoles)
                {
                    // 用户的角色在访问的角色列表 
                    if (userHavedRolesids.Contains(roleId))
                    {
                        return true;
                    }
                }
            }

            // 默认禁止访问
            return false;
        }

        public bool IsAllowed(string loginId, string permission)
        {
            return false;
        }

        public bool ValidateUser(string loginId, string password)
        {
            using (var db = new appstoreEntities())
            {
                var user = db.User.FirstOrDefault(u => u.LoginId.Equals(loginId, StringComparison.OrdinalIgnoreCase));
                var hash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                if (user != null && user.Password.Equals(hash, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }

        public bool SaveUser(User user)
        {
            bool result = false;

            if (user == null)
            {
                return false;
            }

            using (var db = new appstoreEntities())
            {
                if (string.IsNullOrEmpty(user.Password))
                {
                    var hash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(user.Password, "MD5");
                    user.Password = hash;
                }
                if (user.UpdateTime == DateTime.MinValue || user.UpdateTime == null)
                {
                    if (HasUser(user.LoginId))
                    {
                        return false;
                    }
                    user.UpdateTime = DateTime.Now;
                    db.User.Add(user);
                }
                else
                {
                    user.UpdateTime = DateTime.Now;
                    db.User.Attach(user);
                    db.Entry(user).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        public User GetUserByLoginId(string loginId)
        {
            using (var db = new appstoreEntities())
            {
                return db.User.FirstOrDefault(u => u.LoginId.Equals(loginId, StringComparison.OrdinalIgnoreCase));
            }
        }
        private List<Role> GetUserRoles(string loginId)
        {
            using (var db = new appstoreEntities())
            {
                return db.UserRole.Where(u => u.User.LoginId.Equals(loginId, StringComparison.OrdinalIgnoreCase)).Select(c => c.Role).ToList();
            }
        }

        public bool HasUser(string loginId)
        {
            using (var db = new appstoreEntities())
            {
                return db.User.Any(u => u.LoginId.Equals(loginId, StringComparison.OrdinalIgnoreCase));
            }
        }

        public void SignIn(string loginId, bool rememberMe)
        {
            var user = GetUserByLoginId(loginId);
            var userRols = GetUserRoles(loginId);
            var userData = new UserDataPrincipal()
            {
                UserId = user.UserId,
                LoginId = user.LoginId,
                UserName = user.UserName,
                Roles = string.Join(",", userRols.Select(ca => ca.Name))
            };

            var data = (new JavaScriptSerializer()).Serialize(userData);
            //创建ticket
            var ticket = new FormsAuthenticationTicket(
                2, loginId, DateTime.Now, DateTime.Now.AddDays(7), rememberMe, data);
            
            //加密ticket
            var cookieValue = FormsAuthentication.Encrypt(ticket);

            //创建Cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, cookieValue)
            {
                HttpOnly = true,
                Secure = FormsAuthentication.RequireSSL,
                Domain = FormsAuthentication.CookieDomain,
                Path = FormsAuthentication.FormsCookiePath,
            };
            if (rememberMe)
                cookie.Expires = DateTime.Now.AddDays(7);

            //写入Cookie
            HttpContext.Current.Response.Cookies.Remove(cookie.Name);
            HttpContext.Current.Response.Cookies.Add(cookie);

            FormsAuthentication.SetAuthCookie(loginId, true);
            //return new FormsPrincipal(ticket: ticket, userData: userData);
        }

        //从Request中解析出Ticket,UserData
        public IPrincipal TryParsePrincipal(HttpRequest request)
        {
            if (request == null)
                throw new ArgumentNullException("request");

            // 1. 读登录Cookie
            var cookie = request.Cookies[FormsAuthentication.FormsCookieName];
            if (cookie == null || string.IsNullOrEmpty(cookie.Value)) return null;

            try
            {
                // 2. 解密Cookie值，获取FormsAuthenticationTicket对象
                var ticket = FormsAuthentication.Decrypt(cookie.Value);
                if (ticket != null && !string.IsNullOrEmpty(ticket.UserData))
                {
                    var userData = (new JavaScriptSerializer()).Deserialize<UserDataPrincipal>(ticket.UserData);
                    if (userData != null)
                    {
                        return new FormsPrincipal(ticket, userData);
                    }
                }
                return null;
            }
            catch
            {
                /* 有异常也不要抛出，防止攻击者试探。 */
                return null;
            }
        }

        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }

        public bool IsAdmin(string loginId)
        {
            return IsInRole(loginId, "系统管理员");
        }

        public bool IsInRole(string loginId, string role)
        {
            using (var db = new appstoreEntities())
            {
                //找出用户所有所属角色
                var userroles = db.UserRole.Where(u => u.User.LoginId == loginId).Select(u => u.Role.Name).ToList();
                var roles = role.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                return (from s in roles from userrole in userroles where s.Equals(userrole, StringComparison.OrdinalIgnoreCase) select s).Any();
            }
        }
        public bool IsInUser(string userIds)
        {
            //找出用户所有所属角色
            var users = userIds.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            using (var db = new appstoreEntities())
            {
                return db.User.Any(u => users.Contains(u.LoginId));
            }
        }

        public IList<ActionPermission> GetAllActionByAssembly()
        {
            var result = new List<ActionPermission>();
            var types = Assembly.Load("AppStore.Manage").GetTypes();
            foreach (var type in types)
            {
                if (type.BaseType != null && type.BaseType.Name == "BaseController")//如果是Controller
                {
                    var members = type.GetMethods();
                    foreach (var member in members)
                    {
                        if (member.ReturnType.Name == "ActionResult")//如果是Action
                        {

                            var ap = new ActionPermission { ActionName = member.Name };

                            if (member.DeclaringType != null)
                                ap.ControlName = member.DeclaringType.Name.Substring(0, member.DeclaringType.Name.Length - 10); // 去掉“Controller”后缀

                            object[] attrs = member.GetCustomAttributes(typeof(System.ComponentModel.DescriptionAttribute), true);
                            if (attrs.Length > 0)
                            {
                                var attribute = attrs[0] as System.ComponentModel.DescriptionAttribute;
                                if (attribute != null)
                                    ap.Description = attribute.Description;
                            }

                            result.Add(ap);
                        }

                    }
                }
            }
            return result;
        }

        public void InitPermission()
        {
            var list = GetAllActionByAssembly();
            var actionList = GetAllAction();
            using (var db = new appstoreEntities())
            {
                //系统管理员
                var system = db.Role.FirstOrDefault(o => o.Name == "系统管理员");
                foreach (ActionPermission actionPermission in list)
                {
                    if (string.IsNullOrEmpty(actionPermission.Description))
                    {
                        continue;
                    }

                    var has = actionList.Any(o => o.ControlName == actionPermission.ControlName && o.ActionName == actionPermission.ActionName);
                    if (!has)
                    {
                        actionPermission.ActionPermissionId = Guid.NewGuid().ToString();
                        actionPermission.CreateTime = DateTime.Now;
                        actionPermission.IsAllowed = true;
                        actionPermission.IsAllowedAllRoles = false;
                        actionPermission.IsAllowedNoneRoles = false;
                        actionPermission.IsController = false;
                        actionPermission.Permission = 0;

                        if (system != null)
                            actionPermission.ActionPermissionRole = new Collection<ActionPermissionRole>()
                            {
                                new ActionPermissionRole()
                                {
                                    ActionPermissionRoleId = Guid.NewGuid().ToString(),
                                    ActionPermissionId = actionPermission.ActionPermissionId,
                                    RoleId = system.RoleID,
                                    IsAllowed = true
                                }
                            };
                        db.ActionPermission.Add(actionPermission);
                    }
                }
                db.SaveChanges();
            }
        }

        public IList<ActionPermission> GetAllAction()
        {
            using (var db = new appstoreEntities())
            {
                return db.ActionPermission.ToList();
            }
        }

        public IList<UserRole> GetUserRoles()
        {
            using (var db = new appstoreEntities())
            {
                return db.UserRole.ToList();
            }
        }
        public IList<ActionPermissionRole> GetaActionPermissionRoles()
        {
            using (var db = new appstoreEntities())
            {
                return db.ActionPermissionRole.ToList();
            }
        }

        public IList<ActionPermission> QueryActionPlist(string query, int start, int limit, out long total)
        {
            IList<ActionPermission> allActions = GetAllActionByAssembly();

            total = (from a in allActions
                     where a.ActionName.ToLower().Contains(query.ToLower())
                     select a).Count();

            var result = (from a in allActions
                          where a.ActionName.ToLower().Contains(query.ToLower())
                          select a).Skip(start).Take(limit);

            return new List<ActionPermission>(result);
        }

        public bool CheckUserHasPermision(string userName, string permission)
        {
            using (var db = new appstoreEntities())
            {
                return db.UserRole.Any(o => o.UserId.Equals(userName, StringComparison.OrdinalIgnoreCase) || o.RoleId.Equals(permission, StringComparison.OrdinalIgnoreCase));
            }
        }
    }
}
