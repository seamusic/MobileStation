using ApkUtil;

namespace AppStore.Common
{
    public class ApplicationFileInfo
    {
        public string RelativePath { get; set; }
        public long Length { get; set; }
        public ApkInfo ApkInfo { get; set; }
    }
}
