using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Caching;

namespace Lennon.Utils
{
    /// <summary>
    /// 对缓存操作进行封装
    /// </summary>
    public class Caching
    {
        #region  获取缓存内容 public static object Get(string name)
        /// <summary>
        /// 获取缓存内容
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static object Get(string name)
        {
            string appPrefix = string.Empty;
            if (null != HttpContext.Current)
            {
                return HttpContext.Current.Cache.Get(appPrefix + name);
            }
            else
            {
                return HttpRuntime.Cache.Get(appPrefix + name);
            }
        }
        #endregion

        #region 设置缓存 	public static void Set(string name, object value, CacheDependency cacheDependency)
        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="cacheDependency"></param>
        public static void Set(string name, object value, CacheDependency cacheDependency)
        {

            Set(name, value, cacheDependency, DateTime.Now.AddSeconds(20), TimeSpan.Zero);

        }
        #endregion

        #region 设置缓存 public static void Set(string name, object value, CacheDependency cacheDependency, DateTime dt)

        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="cacheDependency"></param>
        /// <param name="dt"></param>
        public static void Set(string name, object value, CacheDependency cacheDependency, DateTime dt)
        {
            Set(name, value, cacheDependency, dt, TimeSpan.Zero);
        }
        #endregion

        #region 设置缓存 public static void Set(string name, object value, CacheDependency cacheDependency, TimeSpan ts)
        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="cacheDependency"></param>
        /// <param name="ts"></param>
        public static void Set(string name, object value, CacheDependency cacheDependency, TimeSpan ts)
        {
            Set(name, value, cacheDependency, Cache.NoAbsoluteExpiration, ts);
        }
        #endregion
        #region 设置缓存 public static void Set(string name, object value, CacheDependency cacheDependency, DateTime dt, TimeSpan ts)
        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="cacheDependency"></param>
        /// <param name="dt"></param>
        /// <param name="ts"></param>
        public static void Set(string name, object value, CacheDependency cacheDependency, DateTime dt, TimeSpan ts)
        {
            string appPrefix = string.Empty;
#if DEBUG
            HttpRuntime.Cache.Insert(appPrefix + name, value, cacheDependency, DateTime.Now.AddSeconds(10), Cache.NoSlidingExpiration);
#else
//			HttpContext.Current.Cache.Insert(appPrefix + name, value, cacheDependency, dt, ts);
			HttpRuntime.Cache.Insert(appPrefix + name, value, cacheDependency, dt, ts);
#endif
        }
        #endregion

        #region 清除缓存 public static void Remove(string name)
        /// <summary>
        /// 清除缓存
        /// </summary>
        /// <param name="name"></param>
        public static void Remove(string name)
        {
            string appPrefix = string.Empty;
            object obj = HttpContext.Current.Cache[appPrefix + name];
            if (obj != null)
            {
                HttpContext.Current.Cache.Remove(appPrefix + name);
            }
        }
        #endregion
    }
}
