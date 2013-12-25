using Lennon.Utility;

namespace AppStore.Common
{
    public class ServerSetting
    {
        /// <summary>
        /// 报表所在目录
        /// </summary>
        [AppDefaultValue("/Content/UploadFile")]
        public string UploadPath { get; set; }

        [AppDefaultValue("Template")]
        public string TemplatePath { get; set; }

        [AppDefaultValue("Androids")]
        public string AppPath { get; set; }

        [AppDefaultValue("Drivers")]
        public string DriverPath { get; set; }

        [AppDefaultValue("/Downloads/")]
        public string DownloadPath { get; set; }
    }
}
