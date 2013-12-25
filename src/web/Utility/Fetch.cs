using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace Lennon.Utils
{

    /// <summary>
    /// 对常用方法重新进行封装，及获取一些常用环境变量
    /// </summary>
    public class Fetch
    {
        #region Fields
        private static readonly string mTablePrefix;
        public static readonly string SiteMapPath;
        #endregion

        #region 构造函数,初始化变量前缀等。
        static Fetch()
        {
            mTablePrefix = string.Empty;
            mTablePrefix = string.IsNullOrEmpty(mTablePrefix) ? "YC_" : mTablePrefix.Replace("'", "''");
            SiteMapPath = Fetch.MapPath(".");
        }
        #endregion

        #region 获取页面提交的参数值，相当于 Request.Form public static string Post(string name)
        /// <summary>
        /// 获取页面提交的参数值，相当于 Request.Form
        /// </summary>
        public static string Post(string name)
        {
            string value = HttpContext.Current.Request.Form[name];
            return value == null ? string.Empty : value.Trim();
        }
        #endregion

        #region 获取页面地址的参数值，相当于 Request.QueryString public static string Get(string name)
        /// <summary>
        /// 获取页面地址的参数值，相当于 Request.QueryString
        /// </summary>
        public static string Get(string name)
        {
            string value = HttpContext.Current.Request.QueryString[name];
            return value == null ? string.Empty : value.Trim();
        }
        #endregion

        #region 获取页面地址的参数值并检查安全性，相当于 Request.QueryString public static string Get(string name, CheckGetEnum chkType)
        /// <summary>
        /// 获取页面地址的参数值并检查安全性，相当于 Request.QueryString
        /// chkType 有 CheckGetEnum.Int， CheckGetEnum.Safety两种类型，
        /// CheckGetEnum.Int 保证参数是数字型
        /// CheckGetEnum.Safety 保证提交的参数值没有操作数据库的语句
        /// </summary>
        public static string Get(string name, CheckGetEnum chkType)
        {
            string value = Get(name);
            bool isPass = false;
            switch (chkType)
            {
                default:
                    isPass = true;
                    break;
                case CheckGetEnum.Int:
                    {
                        try
                        {
                            int.Parse(value);
                            isPass = RegExp.IsNumeric(value);
                        }
                        catch
                        {
                            isPass = false;
                        }
                        break;
                    }
                case CheckGetEnum.Safety:
                    isPass = RegExp.IsSafety(value);
                    break;
            }
            if (!isPass)
            {
                //new Terminator().Throw("地址栏中参数“" + name + "”的值不符合要求或具有潜在威胁，请不要手动修改URL。");
                return string.Empty;
            }
            return value;
        }
        #endregion

        #region 跟踪调试输出一个对象 public static void  Trace(object obj)
        /// <summary>
        /// 跟踪调试输出一个对象
        /// </summary>
        public static void Trace(object obj)
        {
            HttpContext.Current.Response.Write(obj.ToString());
        }
        #endregion

        #region 将相对地址转化为绝对地址，进一步封装和优化 Server.MapPath public static string MapPath(string path)
        /// <summary>
        /// 将相对地址转化为绝对地址，进一步封装和优化 Server.MapPath
        /// </summary>
        public static string MapPath(string path)
        {
            if (RegExp.IsPhysicalPath(path))
            {
                return path;
            }

            if (null != HttpContext.Current)
            {
                if (!RegExp.IsRelativePath(path))
                {
                    return HttpContext.Current.Server.MapPath(path);
                }
#if DEBUG
                if (null == HttpContext.Current)
                {
                    throw new Exception("HttpContext.Current 为空引用");
                }
#endif
                return HttpContext.Current.Server.MapPath(PathUpSeek + "/" + path);
            }
            else if (SiteMapPath.Length > 0)
            {
                return Text.JoinString(SiteMapPath + "/" + path);
            }
            else
            {
                throw new Exception("HttpContext.Current 为空引用");
            }
        }
        #endregion

        #region IP 地址字符串形式转换成长整型 public static long Ip2Int(string ip)
        /// <summary>
        /// IP 地址字符串形式转换成长整型
        /// </summary>
        public static long Ip2Int(string ip)
        {
            if (!RegExp.IsIp(ip))
            {
                return -1;
            }
            string[] arr = ip.Split('.');
            long lng = long.Parse(arr[0]) * 16777216;
            lng += int.Parse(arr[1]) * 65536;
            lng += int.Parse(arr[2]) * 256;
            lng += int.Parse(arr[3]);
            return lng;
        }
        #endregion

        #region 获取客户端IP  public static string UserIp
        /// <summary>
        /// 获取客户端IP 
        /// </summary>
        public static string UserIp
        {
            get
            {
                string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (string.IsNullOrEmpty(ip))
                {
                    ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                }
                if (!RegExp.IsIp(ip))
                {
                    return "Unknown";
                }
                return ip;
            }
        }
        #endregion

        #region  获取访问者所使用的浏览器名 public static string UserBrowser
        /// <summary>
        /// 获取访问者所使用的浏览器名
        /// </summary>
        public static string UserBrowser
        {
            get
            {
                string agent = HttpContext.Current.Request.UserAgent;
                if (string.IsNullOrEmpty(agent))
                    return "Unknown";
                agent = agent.ToLower();

                HttpBrowserCapabilities bc = HttpContext.Current.Request.Browser;
                if (agent.IndexOf("firefox") >= 0
                    || agent.IndexOf("firebird") >= 0
                    || agent.IndexOf("myie") >= 0
                    || agent.IndexOf("opera") >= 0
                    || agent.IndexOf("netscape") >= 0
                    || agent.IndexOf("msie") >= 0
                    )
                    return bc.Browser + bc.Version;

                return "Unknown";
            }
        }
        #endregion

        #region 获得网站域名 	public static string ServerDomain
        /// <summary>
        /// 获得网站域名
        /// </summary>
        public static string ServerDomain
        {
            get
            {
                string host = HttpContext.Current.Request.Url.Host.ToLower();
                string[] arr = host.Split('.');
                if (arr.Length < 3 || RegExp.IsIp(host))
                {
                    return host;
                }
                string domain = host.Remove(0, host.IndexOf(".") + 1);
                if (domain.StartsWith("com.") || domain.StartsWith("net.") || domain.StartsWith("org.") || domain.StartsWith("gov."))
                {
                    return host;
                }
                return domain;
            }
        }
        #endregion

        #region 获得当前路径
        /// <summary>
        /// 获得当前路径
        /// </summary>
        public static string CurrentPath
        {
            get
            {
                string path = HttpContext.Current.Request.Path;
                path = path.Substring(0, path.LastIndexOf("/"));
                if (path == "/")
                {
                    return string.Empty;
                }
                return path;
            }
        }
        #endregion

        #region 获得网站虚拟根目录 	public static string PathUpSeek
        /// <summary>
        /// 获得网站虚拟根目录
        /// </summary>
        public static string PathUpSeek
        {
            get
            {
                string currentPath = CurrentPath;
                string lower_current_path = currentPath.ToLower();


#if DEBUG
                string[] arr = (Text.JoinString(string.Empty, "|/install|/upgrade|/test")).ToLower().Split('|');
#else
                string[] arr = (Text.JoinString(string.Empty, "|/install|/upgrade|/test")).ToLower().Split('|');
#endif


                foreach (string s in arr)
                {
                    if (string.IsNullOrEmpty(s))
                    {
                        continue;
                    }
                    if (s[0] != '/')
                    {
                        continue;
                    }
                    if (lower_current_path.EndsWith(s))
                    {
                        return currentPath.Remove(currentPath.Length - s.Length, s.Length);
                    }
                }

                int indexof = currentPath.IndexOf("/templates/");
                if (-1 != indexof)
                {
                    return currentPath.Substring(0, indexof);
                }
                return currentPath;
            }
        }
        #endregion

        #region 获得当前URL public static string CurrentUrl
        /// <summary> 
        /// 获得当前URL
        /// </summary>
        public static string CurrentUrl
        {
            get
            {
                return HttpContext.Current.Request.Url.ToString();
            }
        }
        #endregion

        #region 获取当前请求的原始URL
        /// <summary>
        /// 获取当前请求的原始 URL
        /// </summary>
        public static string webCurrentUrl
        {
            get
            {
                return HttpContext.Current.Request.RawUrl.ToString();
            }
        }
        #endregion

        #region 获得来源URL public static string Referrer
        /// <summary>
        /// 获得来源URL
        /// </summary>
        public static string Referrer
        {
            get
            {
                Uri uri = HttpContext.Current.Request.UrlReferrer;
                if (uri == null)
                {
                    return string.Empty;
                }
                return Convert.ToString(uri);
            }
        }
        #endregion

        #region 是否从其他连接向本域名连接 	public static bool IsPostFromAnotherDomain
        /// <summary>
        /// 是否从其他连接向本域名连接
        /// </summary>
        public static bool IsPostFromAnotherDomain
        {
            get
            {
                if (HttpContext.Current.Request.HttpMethod == "GET")
                {
                    return false;
                }
                return Referrer.IndexOf(ServerDomain) == -1;
            }
        }
        #endregion

        #region 是否从其他连接向本域名以POST方式提交表单 	public static bool IsGetFromAnotherDomain
        /// <summary>
        /// 是否从其他连接向本域名以POST方式提交表单
        /// </summary>
        public static bool IsGetFromAnotherDomain
        {
            get
            {
                if (HttpContext.Current.Request.HttpMethod == "POST")
                {
                    return false;
                }
                return Referrer.IndexOf(ServerDomain) == -1;
            }
        }
        #endregion

        #region 是否被判断为机器人 public static bool IsRobots
        /// <summary>
        /// 是否被判断为机器人 
        /// </summary>
        public static bool IsRobots
        {
            get
            {
                return IsWebSearch();
            }
        }
        #endregion

        #region 搜索引擎来源判断 public static bool IsWebSearch()

        /// <summary>
        /// 搜索引擎来源判断
        /// </summary>
        private static string[] _WebSearchList = new string[] { "google", "isaac", "surveybot", "baiduspider", "yahoo", "yisou", "3721", "qihoo", "daqi", "ia_archiver", "p.arthur", "fast-webcrawler", "java", "microsoft-atl-native", "turnitinbot", "webgather", "sleipnir", "msn" };
        public static bool IsWebSearch()
        {
            string user_agent = HttpContext.Current.Request.UserAgent;
            if (string.IsNullOrEmpty(user_agent))
            {
                return true;
            }
            else
            {
                user_agent = user_agent.ToLower();
            }

            for (int i = 0; i < _WebSearchList.Length; i++)
            {
                if (-1 != user_agent.IndexOf(_WebSearchList[i]))
                {
                    return true;
                }
            }
            return UserBrowser.Equals("Unknown");
        }
        #endregion

        #region Url编码，相当于 Server.UrlEncode public static string UrlEncode(string url)
        /// <summary>
        /// Url编码，相当于 Server.UrlEncode
        /// </summary>
        public static string UrlEncode(string url)
        {
            return HttpContext.Current.Server.UrlEncode(url);
        }
        #endregion

        #region 属性
        /// <summary>
        /// 变量前缀
        /// </summary>
        public static string TablePrefix
        {
            get
            {
                return mTablePrefix;
            }
        }

        /// <summary>
        /// 当前的模板名
        /// </summary>

        public static string CurrentTemplateName
        {
            get
            {
                string tpl_name = string.Empty;
                if (string.IsNullOrEmpty(tpl_name))
                {
                    tpl_name = "default";
                }
                return tpl_name;
            }
        }

        /// <summary>
        /// 当前的皮肤名
        /// </summary>
        public static string CurrentSkinName
        {
            get
            {
                string skin_name = string.Empty;
                if (string.IsNullOrEmpty(skin_name))
                {
                    skin_name = "default";
                }
                return skin_name;
            }
        }

        /// <summary>
        /// 当前的皮肤路径
        /// </summary>
        public static string CurrentSkinPath
        {
            get
            {
                string pathUpSeek = Fetch.PathUpSeek;
                return pathUpSeek + (string.Empty != pathUpSeek ? "/" : string.Empty) + "templates/" + CurrentTemplateName + "/skins/" + CurrentSkinName + "/";
            }
        }

        /// <summary>
        /// 获取验证码文件的地址
        /// </summary>
        public static string ValidateCodeFileName
        {
            get
            {
                string fileName = string.Empty;
                if (string.IsNullOrEmpty(fileName))
                {
                    fileName = "image.aspx";
                }
                return fileName;
            }
        }
        #endregion

    }
}
