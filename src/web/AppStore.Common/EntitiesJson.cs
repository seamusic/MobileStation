using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Reflection;
using System.Text;

namespace AppStore.Common
{
    public static class EntitiesJson
    {
        #region 实体扩展方法
        /// <summary>
        /// 转换实体信息为Json
        /// </summary>
        /// <param name="obj">实体对象</param>
        /// <returns></returns>
        public static String ToEntitiesJson(this EntityObject obj)
        {
            return new EntitiesTools().EntitiesToJson(obj, "");
        }
        /// <summary>
        /// 转换实体信息为Json
        /// </summary>
        /// <param name="obj">实体对象</param>
        /// <param name="Include">获取子对象：使用，号分开</param>
        /// <returns></returns>
        public static String ToEntitiesJson(this EntityObject obj, String Include)
        {
            return new EntitiesTools().EntitiesToJson(obj, Include);
        }
        /// <summary>
        /// 转换实体信息为Json
        /// </summary>
        /// <param name="obj">实体对象</param>
        /// <returns></returns>
        public static String ToEntitiesJson(this IQueryable obj)
        {
            return new EntitiesTools().EntitiesToJson(obj, "");
        }
        /// <summary>
        /// 转换实体信息为Json
        /// </summary>
        /// <param name="obj">实体对象</param>
        /// <param name="Include">获取子对象：使用，号分开</param>
        /// <returns></returns>
        public static String ToEntitiesJson(this IQueryable obj, String Include)
        {
            return new EntitiesTools().EntitiesToJson(obj, Include);
        }
        #endregion
        #region 转换实体信息为Json
        /// <summary>
        /// 转换实体信息为Json
        /// </summary>
        public class EntitiesTools
        {
            #region 转换实体信息为Json
            /// <summary>
            /// 转换实体信息为Json
            /// </summary>
            /// <param name="obj">实体对象</param>
            /// <param name="Include">获取子对象：使用，号分开</param>
            /// <returns></returns>
            public String EntitiesToJson(Object obj, String Include)
            {
                Type _Type = obj.GetType();
                String sJosnString = "";
                StringBuilder TempStringJson = new StringBuilder();
                StringBuilder _Json = new StringBuilder();
                switch (_Type.Name)
                {
                    case "ObjectQuery`1":
                        TempStringJson.Clear();
                        _Json.Append("[");
                        foreach (Object _obj in obj as IQueryable)
                        {
                            TempStringJson.Append(EntitiesToJson(_obj, Include, 0));
                            TempStringJson.Append(",");
                        }
                        sJosnString = TempStringJson.ToString();
                        _Json.Append(sJosnString.Substring(0, sJosnString.Length - 1));
                        _Json.Append("]");
                        break;
                    case "List`1":
                        TempStringJson.Clear();
                        _Json.Append("[");
                        foreach (Object _obj in obj as IList)
                        {
                            TempStringJson.Append(EntitiesToJson(_obj, Include, 0));
                            TempStringJson.Append(",");
                        }
                        sJosnString = TempStringJson.ToString();
                        _Json.Append(sJosnString.Substring(0, sJosnString.Length - 1));
                        _Json.Append("]");
                        break;
                    default:
                        _Json.Append(EntitiesToJson(obj, Include, 0));
                        break;
                }
                return _Json.ToString();
            }
            /// <summary>
            /// 转换实体信息为Json
            /// </summary>
            /// <param name="obj">实体对象</param>
            /// <param name="Include">获取子对象：使用，号分开</param>
            /// <param name="Level">当前递归的层级</param>
            /// <returns></returns>
            private String EntitiesToJson(Object obj, String Include, int Level)
            {
                if (obj == null) { return null; }
                StringBuilder TempStringJson = new StringBuilder();
                List<String> IncludeA = Include.Split(',').ToList<String>();
                //需要排除的属性类型
                List<String> ignoreEntityTypes = new List<String> { "EntityReference`1,EntityState", "EntityKey", "EntitySetName" };
                //实体集合
                List<String> ListType = new List<String> { "EntityCollection`1" };
                //数据类型(非实体集合类型)
                List<String> EntitesType = new List<String> { "Binary", "Boolean", "DateTime", "DateTimeOffset", "Decimal", "Double", "Guid", "Int16", "Int32", "Int64", "Single", "String", "Time" };
                //未支持的数据类型
                List<String> NotType = new List<String> { "Byte", "SByte" };

                StringBuilder _Json = new StringBuilder();
                _Json.Append("{");
                Type _Type = obj.GetType();
                PropertyInfo[] _PropertyInfoList = _Type.GetProperties();
                string doubleQuote = "\"";
                #region 迭代属性
                foreach (PropertyInfo _PropertyInfo in _PropertyInfoList)
                {
                    #region 排除类型
                    if (ignoreEntityTypes.Contains(_PropertyInfo.PropertyType.Name))
                    {
                        continue;
                    }
                    #endregion
                    var propertyName = _PropertyInfo.Name;
                    var propertyType = _PropertyInfo.PropertyType;
                    var propertyValue = _PropertyInfo.GetValue(obj, null);
                    try
                    {
                        #region 值=null
                        if (propertyValue == null)
                        {
                            _Json.Append(doubleQuote + propertyName + doubleQuote +
                                            ":" + "null");
                            _Json.Append(",");
                            continue;
                        }
                        #endregion
                        //缺少EntityReference的处理
                        #region 非实体集合类型
                        if (EntitesType.Contains(propertyValue.GetType().Name))
                        {
                            try
                            {
                                TempStringJson.Clear();
                                TempStringJson.Append(doubleQuote + propertyName + doubleQuote +
                                            ":" + propertyValue.ToString());
                                TempStringJson.Append(",");
                                _Json.Append(TempStringJson);
                                continue;
                            }
                            catch (Exception Err)
                            {
                                throw Err;
                            }
                        }
                        #endregion
                        #region 非Include对象
                        if (!IncludeA.Contains(propertyName))
                        {
                            _Json.Append(doubleQuote + propertyName + doubleQuote +
                                            ":" + "null");
                            _Json.Append(",");
                            continue;
                        }
                        #endregion
                        #region 实体集合类型
                        if (ListType.Contains(propertyValue.GetType().Name) && Level == 0)
                        {
                            try
                            {
                                TempStringJson.Clear();
                                bool IsNull = true;
                                //用来判断集合是否为空，待改善的方法
                                foreach (Object p in (IRelatedEnd)propertyValue)
                                {
                                    IsNull = false;
                                    break;
                                }
                                if (IsNull)
                                {
                                    TempStringJson.Append(doubleQuote + propertyName + doubleQuote +
                                                    ":" + "null");
                                    TempStringJson.Append(",");
                                    continue;
                                }
                                StringBuilder ListJosnString = new StringBuilder();
                                _Json.Append(doubleQuote + propertyName + doubleQuote + ":[");
                                foreach (Object p in (IRelatedEnd)propertyValue)
                                {
                                    String Child = EntitiesToJson(p, Include, 1);
                                    ListJosnString.Append(Child);
                                    ListJosnString.Append(",");
                                }
                                String sListJosnString = ListJosnString.ToString();
                                TempStringJson.Append(sListJosnString.Substring(0, sListJosnString.Length - 1));
                                TempStringJson.Append("]");
                                TempStringJson.Append(",");

                                _Json.Append(TempStringJson);
                                continue;
                            }
                            catch (Exception Err)
                            {
                                throw Err;
                            }
                        }
                        #endregion
                        #region 其他类型[应该只剩下实体对象了],有可能有没有考虑到的情况！
                        try
                        {
                            TempStringJson.Clear();
                            TempStringJson.Append(doubleQuote + propertyName + doubleQuote +
                                            ":" + EntitiesToJson(propertyValue, Include, 1));
                            TempStringJson.Append(",");

                            _Json.Append(TempStringJson);
                            continue;
                        }
                        catch (Exception Err)
                        {
                            throw Err;
                        }
                        #endregion
                    }
                    catch (Exception Err)
                    {
                        _Json.Append(doubleQuote + propertyName + doubleQuote +
                                        ":" + "null");
                        _Json.Append(",");
                        continue;
                    }
                }
                #endregion
                String sJosnString = _Json.ToString();
                return sJosnString.Substring(0, sJosnString.Length - 1) + "}";
            }
            #endregion
        }
        #endregion
    }
}
