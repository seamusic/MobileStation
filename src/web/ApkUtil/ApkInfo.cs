using System;
using System.Collections.Generic;

namespace ApkUtil
{
    public class ApkInfo
    {
        public ApkInfo()
        {
            UsesPermissions = new List<string>();
            ApplicationIcons = new Dictionary<string, string>();
            ImpliedFeatures = new List<ImpliedFeature>();
            Features = new List<string>();
        }

        /// <summary>
        ///     获取或设置 内部版本号
        /// </summary>
        public String VersionCode { get; set; }

        /// <summary>
        ///     获取或设置 外部版本号
        /// </summary>
        public String VersionName { get; set; }

        /// <summary>
        ///     获取或设置 包名
        /// </summary>
        public String PackageName { get; set; }

        /// <summary>
        ///     获取或设置 所需要的权限
        /// </summary>
        public List<String> UsesPermissions { get; set; }

        /// <summary>
        ///     获取或设置 支持的SDK版本
        /// </summary>
        public String SdkVersion { get; set; }

        /// <summary>
        ///     获取或设置 建议的SDK版本
        /// </summary>
        public String TargetSdkVersion { get; set; }

        /// <summary>
        ///     获取或设置 应用程序名
        /// </summary>
        public String ApplicationLabel { get; set; }

        /// <summary>
        ///     获取或设置 各个分辨率下的图标路径
        /// </summary>
        public Dictionary<String, String> ApplicationIcons { get; set; }

        /// <summary>
        ///     获取或设置 程序的图标
        /// </summary>
        public String ApplicationIcon { get; set; }

        /// <summary>
        ///     获取或设置 暗指的特性
        /// </summary>
        public List<ImpliedFeature> ImpliedFeatures { get; set; }

        /// <summary>
        ///     获取或设置 所需设备特性
        /// </summary>
        public List<String> Features { get; set; }

        /// <summary>
        ///     获取或设置 启动界面
        /// </summary>
        public String LaunchableActivity { get; set; }

        public override string ToString()
        {
            return "ApkInfo [VersionCode=" + VersionCode + ",\n VersionName="
                   + VersionName + ",\n PackageName=" + PackageName
                   + ",\n UsesPermissions="
                   + UsesPermissions.Count + ",\n SdkVersion=" + SdkVersion
                   + ",\n TargetSdkVersion=" + TargetSdkVersion
                   + ",\n ApplicationLabel=" + ApplicationLabel
                   + ",\n ApplicationIcons=" + ApplicationIcons.Count
                   + ",\n ApplicationIcon=" + ApplicationIcon
                   + ",\n ImpliedFeatures=" + ImpliedFeatures.Count + ",\n Features="
                   + Features.Count + ",\n LaunchableActivity=" + LaunchableActivity + "\n]";
        }
    }
}