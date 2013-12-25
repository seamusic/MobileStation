using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace ApkUtil
{
    public class Reader
    {
        private static readonly Dictionary<String, Action<ApkInfo, String>> ActionMap;

        static Reader()
        {
            ActionMap = new Dictionary<string, Action<ApkInfo, string>>
                {
                    {"package", ReadPackage},
                    {"sdkVersion", (i, s) => i.SdkVersion = GetPropertyInQuote(s)},
                    {"targetSdkVersion", (i, s) => i.TargetSdkVersion = GetPropertyInQuote(s)},
                    {"application-label", (i, s) => i.ApplicationLabel = GetPropertyInQuote(s)},
                    {"launchable-activity", (i, s) => i.LaunchableActivity = GetPropertyInQuote(s)},
                    {"uses-permission", (i, s) => i.UsesPermissions.Add(GetPropertyInQuote(s))},
                    {"application:", ReadApplicationIcon},
                    {"application-icon-", AddIcons},
                    {"uses-feature", (i, s) => i.Features.Add(GetPropertyInQuote(s))},
                    {"uses-implied-feature", AddFeature}
                };
        }

        public Reader()
        {
            string path = AaptPath;
            if (File.Exists(path)) return;
            lock (typeof(Reader))
            {
                if (File.Exists(path)) return;
                using (var fs = new FileStream(path, FileMode.Create))
                {
                    using (Stream ms = Helper.GetFileStream(typeof(Reader).Assembly, "aapt.exe"))
                    {
                        const int bufferSize = 1024;
                        var buffer = new byte[bufferSize];
                        int readLength;
                        while ((readLength = ms.Read(buffer, 0, bufferSize)) > 0)
                        {
                            fs.Write(buffer, 0, readLength);
                        }
                    }
                }
            }
        }

        /// <summary>
        ///     获取aapt文件的路径
        /// </summary>
        public String AaptPath
        {
            get { return Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "aapt.exe"); }
        }

        private static String GetPropertyInQuote(String source)
        {
            return source.Split(new[] { '\'' }, StringSplitOptions.RemoveEmptyEntries)[1];
        }

        private static void ReadPackage(ApkInfo info, String line)
        {
            if (String.IsNullOrEmpty(line)) return;
            string[] arr = line.Split(new[] { ' ', '=', ':', '\'' }, StringSplitOptions.RemoveEmptyEntries);
            info.PackageName = arr[2];
            info.VersionCode = arr[4];
            info.VersionName = arr[6];
        }

        private static void ReadApplicationIcon(ApkInfo info, String line)
        {
            if (String.IsNullOrEmpty(line)) return;
            string[] arr = line.Split(new[] { '\'' }, StringSplitOptions.RemoveEmptyEntries);
            info.ApplicationIcon = arr[arr.Length - 1];
        }

        private static void AddIcons(ApkInfo info, String line)
        {
            //application-icon-160:'res/drawable/icon.png'
            if (String.IsNullOrEmpty(line)) return;
            string[] arr = line.Split(new[] { ':', '\'' }, StringSplitOptions.RemoveEmptyEntries);
            if (arr.Length != 2) return;
            info.ApplicationIcons.Add(arr[0], arr[1]);
        }

        private static void AddFeature(ApkInfo info, String line)
        {
            //uses-implied-feature:'android.hardware.screen.portrait','one or more activities have specified a portrait orientation'
            if (String.IsNullOrEmpty(line)) return;
            string[] arr = line.Split(new[] { ':', '\'', ',' }, StringSplitOptions.RemoveEmptyEntries);
            if (arr.Length != 3) return;
            var f = new ImpliedFeature(arr[1], arr[2]);
            info.ImpliedFeatures.Add(f);
        }

        public ApkInfo GetApkInfo(String apkPath)
        {
            ApkInfo info;
            using (var p = new Process())
            {
                p.StartInfo = new ProcessStartInfo(AaptPath, String.Format("d badging \"{0}\"", apkPath))
                    {
                        UseShellExecute = false,
                        CreateNoWindow = true,
                        RedirectStandardOutput = true,
                        RedirectStandardError = true,
                        StandardOutputEncoding = Encoding.UTF8,
                        StandardErrorEncoding = Encoding.UTF8
                    };
                p.Start();
                StreamReader output = p.StandardOutput;
                string line = output.ReadLine();
                if (String.IsNullOrEmpty(line) || !line.StartsWith("package"))
                {
                    throw new ArgumentException("参数不正确，无法正常解析APK包。输出结果为：" + line + Environment.NewLine +
                                                output.ReadToEnd());
                }
                info = new ApkInfo();
                do
                {
                    if (String.IsNullOrEmpty(line)) continue;
                    foreach (var action in ActionMap)
                    {
                        if (line.StartsWith(action.Key, StringComparison.CurrentCultureIgnoreCase))
                        {
                            action.Value(info, line);
                        }
                    }
                } while (!String.IsNullOrEmpty(line = output.ReadLine()));
            }
            return info;
        }

        private delegate void Action<in T1, in T2>(T1 a, T2 b);
    }
}