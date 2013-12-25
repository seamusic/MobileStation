using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;

namespace Lennon.Utils
{
    /// <summary>
    /// 常用文本处理方法
    /// </summary>
    public class Text
    {
        #region 32 位 MD5 加密 public static string MD5(string s)
        /// <summary>
        /// 32 位 MD5 加密 
        /// </summary>
        public static string MD5(string s)
        {
            if (null == s || 0 == s.Length)
            {
                s = string.Empty;
            }

            return FormsAuthentication.HashPasswordForStoringInConfigFile(s, "MD5").ToLower();
        }
        #endregion

        #region 获取DV模式的MD5密码 public static string MD5(string s,int start,int length)
        /// <summary>
        /// 获取DV模式的MD5密码
        /// </summary>
        public static string MD5(string s, int start, int length)
        {
            if (null == s || 0 == s.Length)
            {
                s = string.Empty;
            }

            return FormsAuthentication.HashPasswordForStoringInConfigFile(s, "MD5").ToLower().Substring(start, length);
        }
        #endregion

        #region 以 32 位 MD5 加密加CookieToken后缀的形式产生 cookie 密文 public static string GenerateToken(string s)
        /// <summary>
        /// 以 32 位 MD5 加密加CookieToken后缀的形式产生 cookie 密文
        /// </summary>
        public static string GenerateToken(string s)
        {
            if (null == s || 0 == s.Length)
            {
                s = string.Empty;
            }

            return MD5(s + string.Empty);
        }
        #endregion

        #region 密码比较，支持 32位，16位密码比较 public static bool ComparePassword(string pwd1, string pwd2)

        /// <summary>
        /// 密码比较，支持 32位，16位密码比较
        /// </summary>
        public static bool ComparePassword(string pwd1, string pwd2)
        {

            if (null == pwd1 && null == pwd2)
            {
                return true;
            }
            else if (null == pwd1 || null == pwd2)
            {
                return false;
            }

            int len1 = pwd1.Length, len2 = pwd2.Length;
            if (len1 == len2 && 0 != len1)
            {
                // 执行不区分大小写的检查
                return (0 == string.Compare(pwd1, pwd2, true));
            }
            else if (32 == len1 && 16 == len2)
            {
                // 执行不区分大小写的检查
                return (0 == string.Compare(pwd1.Substring(8, 16), pwd2, true));
            }
            else if (16 == len1 && 32 == len2)
            {
                // 执行不区分大小写的检查
                return (0 == string.Compare(pwd2.Substring(8, 16), pwd1, true));
            }


            return false;
        }
        #endregion

        #region 为字符串加0  public static string AddZero(int i)
        /// <summary>
        /// add zero
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public static string AddZero(int i)
        {
            return (i > 9 ? string.Empty : "0") + i;
        }
        #endregion

        #region 编码成 sql 文本可以接受的格式
        /// <summary>
        /// 编码成 sql 文本可以接受的格式
        /// </summary>
        public static string SqlEncode(string s)
        {
            if (null == s || 0 == s.Length)
            {
                return string.Empty;
            }

            return s.Trim().Replace("'", "''");
        }
        #endregion

        #region 过滤脏词 public static string ShitEncode(string s)
        /// <summary>
        /// 过滤脏词，默认有为“妈的|你妈|他妈|妈b|妈比|fuck|shit|我日|法轮|我操”
        /// 可以在 bbs.config 里设置 BadWords 的值
        /// </summary>
        public static string ShitEncode(string s)
        {
            string bw = string.Empty;
            if (bw == null || 0 == bw.Length)
            {
                bw = "妈的|你妈|他妈|妈b|妈比|fuck|shit|我日|法轮|我操";
            }
            else
            {
                bw = Regex.Replace(bw, @"\|{2,}", "|");
                bw = Regex.Replace(bw, @"(^\|)|(\|$)", string.Empty);
            }
            return Regex.Replace(s, bw, "**", RegexOptions.IgnoreCase);
        }
        #endregion

        #region 文本编码 	public static string TextEncode(string s)
        /// <summary>
        /// 文本编码
        ///</summary>
        public static string TextEncode(string s)
        {
            if (null == s || 0 == s.Length)
            {
                return string.Empty;
            }

            StringBuilder sb = new StringBuilder(s);
            sb.Replace("&", "&amp;");
            sb.Replace("<", "&lt;");
            sb.Replace(">", "&gt;");
            sb.Replace("\"", "&quot;");
            sb.Replace("\'", "&#39;");
            return ShitEncode(sb.ToString());
        }
        #endregion

        #region HTML 编码 public static string HtmlEncode(string s)
        /// <summary>
        /// HTML 编码
        ///</summary>
        public static string HtmlEncode(string s)
        {
            return HtmlEncode(s, false);
        }

        public static string HtmlEncode(string s, bool bln)
        {
            if (null == s || 0 == s.Length)
            {
                return s;
            }

            StringBuilder sb = new StringBuilder(s);
            sb.Replace("&", "&amp;");
            sb.Replace("<", "&lt;");
            sb.Replace(">", "&gt;");
            sb.Replace("\"", "&quot;");
            sb.Replace("\'", "&#39;");

            if (bln)
            {
                return ShitEncode(sb.ToString());
            }
            else
            {
                return sb.ToString();
            }
        }
        #endregion

        #region HTML 解码 public static string HtmlDecode(string s)
        /// <summary>
        /// HTML 解码
        ///</summary>
        public static string HtmlDecode(string s)
        {
            StringBuilder sb = new StringBuilder(s);
            sb.Replace("&amp;", "&");
            sb.Replace("&lt;", "<");
            sb.Replace("&gt;", ">");
            sb.Replace("&quot;", "\"");
            sb.Replace("&#39;", "'");

            return sb.ToString();
        }
        #endregion

        #region TEXT解码		public static string TextDecode(string s)
        /// <summary>
        /// TEXT解码
        /// </summary>
        public static string TextDecode(string s)
        {
            StringBuilder sb = new StringBuilder(s);
            sb.Replace("<br/><br/>", "\r\n");
            sb.Replace("<br/>", "\r");
            sb.Replace("<p></p>", "\r\n\r\n");
            return sb.ToString();
        }
        #endregion

        #region 字符串的长度 public static int Len(string s)
        /// <summary>
        /// 字符串的长度
        /// </summary>
        public static int Len(string s)
        {
            return HttpContext.Current.Request.ContentEncoding.GetByteCount(s);
        }
        #endregion

        #region 截断字符串 public static string Left(string s, int need, bool encode)
        /// <summary>
        /// 截断字符串，如果str 的长度超过 need，则提取 str 的前 need 个字符，并在尾部加 “...”
        /// </summary>
        public static string Left(string s, int need, bool encode)
        {
            if (s == null || s == "")
            {
                return string.Empty;
            }

            int len = s.Length;
            if (len < need / 2)
            {
                return encode ? TextEncode(s) : s;
            }

            int i, j, bytes = 0;
            for (i = 0; i < len; i++)
            {
                bytes += RegExp.IsUnicode(s[i].ToString()) ? 2 : 1;
                if (bytes >= need)
                {
                    break;
                }
            }

            string result = s.Substring(0, i);
            if (len > i)
            {
                for (j = 0; j < 5; j++)
                {
                    bytes -= RegExp.IsUnicode(s[i - j].ToString()) ? 2 : 1;
                    if (bytes <= need)
                    {
                        break;
                    }
                }
                result = s.Substring(0, i - j) + "...";
            }
            return encode ? TextEncode(result) : result;
        }
        #endregion

        #region Email 编码 public static string EmailEncode(string s)
        /// <summary>
        /// Email 编码
        /// </summary>
        public static string EmailEncode(string s)
        {
            string email = (TextEncode(s)).Replace("@", "&#64;").Replace(".", "&#46;");

            return JoinString("<a href='mailto:", email, "'>", email, "</a>");
        }
        #endregion

        #region 高效字符串连接操作 public static string JoinString(params string[] value)
        /// <summary>
        /// 高效字符串连接操作。
        /// </summary>
        /// <param name="value">要连接的字符串</param>
        /// <returns>连接后的字符串</returns>
        public static string JoinString(params string[] value)
        {
            if (null == value)
            {
                throw new System.ArgumentNullException("value");
            }
            if (0 == value.Length)
            {
                return string.Empty;
            }
            return string.Join(string.Empty, value);
        }
        #endregion

        #region 判断一个字符串是否是一个由逗号分隔的数字列表 public static bool IsNumberList(string str)
        /// <summary>
        /// 判断一个字符串是否是一个由逗号分隔的数字列表。
        /// </summary>
        /// <param name="str">需要判断的字符串</param>
        /// <returns></returns>
        public static bool IsNumberList(string str)
        {
            return IsNumberList(str, ',');
        }

        /// <summary>
        /// 判断一个字符串是否是一个由指定的字符分隔的数字列表。
        /// </summary>
        /// <param name="str"></param>
        /// <param name="separator"></param>
        /// <returns></returns>
        public static bool IsNumberList(string str, char separator)
        {
            if (null == str)
            {
                return false;
            }
            int len = str.Length;
            if (0 == len)
            {
                return false;
            }
            if (!char.IsNumber(str[0]) || !char.IsNumber(str[len - 1]))
            {
                return false;
            }
            len--;
            for (int i = 1; i < len; i++)
            {
                if (separator == str[i])
                {
                    if (!char.IsNumber(str[i - 1]) || !char.IsNumber(str[i + 1]))
                    {
                        return false;
                    }
                }
                else if (!char.IsNumber(str[i]))
                {
                    return false;
                }
            }
            return true;
        }
        #endregion

        #region 判断目标对象是否由数字组成 public static bool IsNumeric(object value)
        /// <summary>
        /// 判断目标对象是否由数字组成
        /// </summary>
        /// <param name="value">要判断的目标对象。</param>
        /// <returns>判断成功返回 true ， 否则返回 false 。</returns>
        public static bool IsNumeric(object value)
        {
            if (null == value)
            {
                return false;
            }
            return IsNumeric(value.ToString());
        }
        #endregion

        #region 判断字符串是否由数字组成 	public static bool IsNumeric(string value)
        /// <summary>
        /// 判断字符串是否由数字组成
        /// </summary>
        /// <param name="value">要判断的字符串。</param>
        /// <returns>判断成功返回 true ， 否则返回 false 。</returns>
        public static bool IsNumeric(string value)
        {
            if (null == value)
            {
                return false;
            }
            int len = value.Length;
            if (0 == len)
            {
                return false;
            }
            if ('-' != value[0] && !char.IsNumber(value[0]))
            {
                return false;
            }
            for (int i = 1; i < len; i++)
            {
                if (!char.IsNumber(value[i]))
                {
                    return false;
                }
            }
            return true;
        }
        #endregion

        #region JavaScript 编码 public static string JavaScriptEncode(string str)
        /// <summary>
        /// JavaScript 编码
        /// </summary>
        public static string JavaScriptEncode(string str)
        {
            StringBuilder sb = new StringBuilder(str);
            sb.Replace("\\", "\\\\");
            sb.Replace("\r", "\\0Dx");
            sb.Replace("\n", "\\x0A");
            sb.Replace("\"", "\\x22");
            sb.Replace("\'", "\\x27");
            return sb.ToString();
        }
        #endregion

        #region JavaScript 编码 public static string JavaScriptEncode(object obj)
        /// <summary>
        /// JavaScript 编码
        /// </summary>
        public static string JavaScriptEncode(object obj)
        {
            if (null == obj)
            {
                return string.Empty;
            }
            return JavaScriptEncode(obj.ToString());
        }
        #endregion

        #region 去除 htmlCode 中所有的HTML标签(包括标签中的属性) public static string StripHtml(string htmlCode)
        /// <summary>
        /// 去除 htmlCode 中所有的HTML标签(包括标签中的属性)
        /// </summary>
        /// <param name="htmlCode">包含 HTML 代码的字符串。</param>
        /// <returns>返回一个不包含 HTML 代码的字符串</returns>
        public static string StripHtml(string htmlCode)
        {
            if (null == htmlCode || 0 == htmlCode.Length)
            {
                return string.Empty;
            }
            return Regex.Replace(htmlCode, @"<[^>]+>", string.Empty, RegexOptions.IgnoreCase | RegexOptions.Multiline);
        }
        #endregion


    }
}
