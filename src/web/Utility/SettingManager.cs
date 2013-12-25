using System;
using System.Diagnostics;
using System.Reflection;

namespace Lennon.Utility
{
    public class SettingManager<T> where T : new()
    {
        private T _config;
        protected static SettingManager<T> ManagerProxy;

        public string ConfigName { get; protected set; }

        private AppConfigHandler GetHandler()
        {
            return new AppConfigHandler(ConfigName);
        }

        /// <summary>
        /// 扫描对象的属性读取配置
        /// </summary>
        /// <returns></returns>
        public virtual T LoadConfig()
        {
            if (_config == null)
            {
                _config = new T();
                var fields = _config.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
                var ienum = fields.GetEnumerator();
                var handler = GetHandler();
                while (ienum.MoveNext())
                {
                    var field = (PropertyInfo)ienum.Current;
                    var attrib =
                        (AppDefaultValueAttribute)Attribute.GetCustomAttribute(field, typeof(AppDefaultValueAttribute));
                    object defaultvalue = default(object);
                    if (attrib != null) defaultvalue = attrib.DefaultValue;
                    field.SetValue(_config, handler.Read(field.Name, field.PropertyType, defaultvalue), null);
                }
            }
            return _config;
        }

        /// <summary>
        /// 扫描对象保存到配置中
        /// </summary>
        public virtual void SaveConfig()
        {
            SaveConfig(_config);
        }

        /// <summary>
        /// 扫描对象保存到配置中
        /// </summary>
        /// <param name="setting"></param>
        public virtual void SaveConfig(T setting)
        {
            var handler = GetHandler();
            var fields = setting.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
            var ienum = fields.GetEnumerator();
            while (ienum.MoveNext())
            {
                var field = (PropertyInfo)ienum.Current;
                var value = field.GetValue(setting, null);
                handler.Write(field.Name, value);
            }
            try
            {
                handler.Save();
            }
            catch (Exception err)
            {
                LogHelper.Error(GetType(), LogInfo.TraceToMessage(new StackTrace(true)), err);
                throw;
            }
        }

        public virtual void Reset()
        {
            _config = default(T);
            ManagerProxy = null;
        }
    }
}