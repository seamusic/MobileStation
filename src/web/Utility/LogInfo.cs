using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;

namespace Lennon.Utility
{
    public static class LogInfo
    {
        public static string TraceToMessage(StackTrace trace)
        {
            return String.Format("文件:{0}，方法/属性：{1} ,行数：{2}", trace.GetFrame(0).GetFileName(), trace.GetFrame(0).GetMethod().Name, trace.GetFrame(0).GetFileLineNumber());

        }

        /// <summary>
        /// 将属性名称生成及值字符串
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="proeprtyname"></param>
        /// <returns></returns>
        public static string PropertyToMessage(object obj, string proeprtyname)
        {
            var property = obj.GetType().GetProperty(proeprtyname);
            return GetPropertyValue(obj, property);
        }

        private static string GetPropertyValue(object obj, PropertyInfo property)
        {
            string result = property.Name + "=[Value:{0}]";
            object propertyvalue = null;
            if (property != null) propertyvalue = property.GetValue(obj, null);
            return result = string.Format(result, propertyvalue);
        }

        /// <summary>
        /// 将属性名称集合及值生成字符串
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="propertiesname"></param>
        /// <returns></returns>
        public static string PropertiesToMessage(object obj, IList<string> propertiesname)
        {
            var result = "";
            try
            {
                foreach (string propertyname in propertiesname)
                {
                    if (!string.IsNullOrEmpty(result)) result += ", ";
                    result += PropertyToMessage(obj, propertyname);
                }
            }
            catch{}
            return result;
        }

        public static string ObjectToMessage(object obj)
        {
            var result = "Null";
            if (obj != null)
            {
                result = "";
                try
                {
                    var propenum = obj.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance).GetEnumerator();
                    while (propenum.MoveNext())
                    {
                        var info = (PropertyInfo)propenum.Current;
                        if (!string.IsNullOrEmpty(result)) result += ", ";
                        result += GetPropertyValue(obj, info);
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return result;
        }
    }
}