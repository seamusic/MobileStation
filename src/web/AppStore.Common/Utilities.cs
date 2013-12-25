using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;

namespace AppStore.Common
{
    public static class Utilities
    {
        public static string DataToJsonToBase64(Object data)
        {
            var serializer = new JavaScriptSerializer();
            var bytes = Encoding.UTF8.GetBytes(serializer.Serialize(data));
            return Convert.ToBase64String(bytes);
        }

        public static T Base64ToJsonToData<T>(string str)
        {
            var bytes = Convert.FromBase64String(str);
            var serializer = new JavaScriptSerializer();
            var data = Encoding.UTF8.GetString(bytes);
            return serializer.Deserialize<T>(data);
        }

        public static string GetUrlName(string fileName)
        {
            return null;
        }
    }
}
