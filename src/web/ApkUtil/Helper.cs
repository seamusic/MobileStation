using System;
using System.IO;
using System.Reflection;

namespace ApkUtil
{
    internal static class Helper
    {
        /// <summary>
        ///     获取文件流
        /// </summary>
        /// <param name="assembly"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public static Stream GetFileStream(Assembly assembly, String filename)
        {
            string[] names = assembly.GetManifestResourceNames();
            string name = String.Empty;
            foreach (string s in names)
            {
                if (String.Equals(s, filename, StringComparison.CurrentCultureIgnoreCase) || s.EndsWith(filename))
                    name = s;
            }
            return String.IsNullOrEmpty(name) ? null : assembly.GetManifestResourceStream(name);
        }
    }
}