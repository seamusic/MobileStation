using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace Lennon.Utils
{

    /// <summary>
    /// 对Session操作进行封装
    /// </summary>
    public class SessionState
    {

        #region 从 Session 读取 键为 name 的值 public static object Get(string name)
        /// <summary>
        /// 从 Session 读取 键为 name 的值
        /// </summary>
        public static object Get(string name)
        {
            string appPrefix = string.Empty;
            return (object)HttpContext.Current.Session[appPrefix + name];
        }
        #endregion

        #region 向 Session 保存 键为 name 的， 值为 value public static void Set(string name, object value)
        /// <summary>
        /// 向 Session 保存 键为 name 的， 值为 value
        /// </summary>
        public static void Set(string name, object value)
        {
            string appPrefix = string.Empty;
            HttpContext.Current.Session.Add(appPrefix + name, value);
        }
        #endregion

        #region 从 Session 删除 键为 name session 项 public static void Remove(string name)
        /// <summary>
        /// 从 Session 删除 键为 name session 项
        /// </summary>
        public static void Remove(string name)
        {
            string appPrefix = string.Empty;
            if (HttpContext.Current.Session[appPrefix + name] != null)
            {
                HttpContext.Current.Session.Remove(appPrefix + name);
            }
        }
        #endregion

        #region 删除所有 session 项
        /// <summary>
        /// 删除所有 session 项
        /// </summary>
        public static void RemoveAll()
        {
            HttpContext.Current.Session.RemoveAll();
        }
        #endregion
    }
}
