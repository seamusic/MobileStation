using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;

namespace Lennon.Utility
{
    /// <summary>
    /// 自定义属性，用来配置默认的属性
    /// </summary>
    [AttributeUsage(AttributeTargets.All, AllowMultiple = false)]
    public class AppDefaultValueAttribute : System.Attribute
    {
        public object DefaultValue;


        public AppDefaultValueAttribute(object defaultvalue)
        {
            DefaultValue = defaultvalue;
        }

    }

    /// <summary>
    /// 配置文件读写对象，对config 配置进行读写
    /// </summary>
    internal class AppConfigHandler
    {
        private readonly Configuration _config;

        public AppConfigHandler(string configfile)
        {
            try
            {
                if (configfile.IndexOf(@":\\", System.StringComparison.Ordinal) < 0)
                {
                    configfile = Path.Combine(AppDomain.CurrentDomain.SetupInformation.ApplicationBase, configfile);
                }

                var file = new ExeConfigurationFileMap
                {
                    ExeConfigFilename = configfile
                    //Path.Combine(AppDomain.CurrentDomain.BaseDirectory, SystemParameter.ConfigName)
                };

                _config = ConfigurationManager.OpenMappedExeConfiguration(file, ConfigurationUserLevel.None);
                LogHelper.Info(this.GetType(), "配置的目录为：" + _config.FilePath);
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
                throw;
            }

        }


        public object Read(string section, Type datatype, object defaultvalue)
        {
            var result = ReadString(section, defaultvalue.ToString());
            return Convert.ChangeType(result, datatype);
        }

        /// <summary>
        /// 读取配置返回泛型
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="section"></param>
        /// <param name="defaultvalue"></param>
        /// <returns></returns>
        public T Read<T>(string section, T defaultvalue)
        {
            var result = ReadString(section, defaultvalue.ToString());
            return (T)Convert.ChangeType(result, typeof(T));

        }

        public void Write<T>(string section, T configvalue)
        {
            WriteString(section, configvalue.ToString());
        }


        /**
        /// <summary>
        /// 从配置文件读取整数的配置值
        /// </summary>
        /// <param name="section"></param>
        /// <param name="defaultvalue"></param>
        /// <returns></returns>
        public int ReadInt(string section, int defaultvalue)
        {
            int intresult = defaultvalue;
            try
            {
                var stringvalue = ReadString(section, string.Empty);
                if (!string.IsNullOrEmpty(stringvalue))
                {
                    int sectionvalue;
                    if (int.TryParse(stringvalue, out sectionvalue))
                    {
                        intresult = sectionvalue;
                    }
                }
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
            }
            return intresult;
        }

        /// <summary>
        /// 在配置文件中写入int
        /// </summary>
        /// <param name="section"></param>
        /// <param name="configvalue"></param>
        public void WriteInt(string section, int configvalue)
        {
            try
            {
                WriteString(section, configvalue.ToString());
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
                throw;
            }
        }
        **/


        /// <summary>
        ///  从配置文件中读字符串
        /// </summary>
        /// <param name="section"></param>
        /// <param name="defaultvalue"></param>
        /// <returns></returns>
        protected string ReadString(string section, string defaultvalue)
        {
            string result = defaultvalue;
            try
            {
                var appsection = _config.AppSettings.Settings[section];
                result = appsection == null ? defaultvalue : appsection.Value;
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
            }
            return result;
        }



        /// <summary>
        /// 在配置文件中写入字符串
        /// </summary>
        /// <param name="section"></param>
        /// <param name="configvalue"></param>
        protected void WriteString(string section, string configvalue)
        {
            try
            {
                var appsection = _config.AppSettings.Settings[section];
                if (appsection == null)
                {
                    _config.AppSettings.Settings.Add(section, configvalue);
                }
                else
                {
                    appsection.Value = configvalue;
                }
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
                throw;
            }
        }

        /// <summary>
        /// 保存配置
        /// </summary>
        public void Save()
        {
            try
            {
                _config.Save();
            }
            catch (Exception err)
            {

                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
                throw;
            }

        }
    }
}