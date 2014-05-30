using System;

namespace AppStore.Models
{
    public class AppModel
    {
        public string ApplicationID { get; set; }
        public string BrandID { get; set; }
        public int AppType { get; set; }
        public string ApplicationName { get; set; }
        public string PictureUrl { get; set; }
        public string Version { get; set; }
        public string Size { get; set; }
        public string Description { get; set; }
        public string OfficialWebsite { get; set; }
        public string DownloadUrl { get; set; }
        public bool IsValid { get; set; }
        public System.DateTime UpdateTime { get; set; }
        public int Total { get; set; }
        public bool IsRecommend { get; set; }
        public bool IsNecessary { get; set; }
        public decimal Score { get; set; }
        public string Checksum { get; set; }
        public string PackageName { get; set; }
        public string ServerPath { get; set; }
        public string RelativePath { get; set; }
        public string OSVersion { get; set; }
        public string SDKVersion { get; set; }
        public string Icon { get; set; }
        public Nullable<int> Seq { get; set; }
        public Nullable<System.DateTime> CreateTime { get; set; }
        public bool AutoDownload { get; set; }
    }
}