using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;
using System.Net;
using System.Web;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Lennon.Utility
{
    public class ContentData
    {
        /// <summary>
        /// 处理后的内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 内容包含文件列表(主要为图片)
        /// </summary>
        public List<string> FileList { get; set; }
    }

    public class SaveRemoteFileHelper
    {
        public static ContentData SavePic(string HtmlContent, bool AutoMark)
        {
            ContentData cData = new ContentData();
            cData.Content = string.Empty;
            cData.FileList = new List<string>();
            long MinFileSize = 1024 * 10;

            string PicWaterMarkFile = ConfigurationManager.AppSettings["PicWaterMarkFile"];
            string PicSaveWebPath = ConfigurationManager.AppSettings["PicSaveWebPath"];
            string FileSavePath = HttpContext.Current.Server.MapPath(PicSaveWebPath);

            if (PicSaveWebPath.IndexOf('~') == 0)
            {
                PicSaveWebPath = PicSaveWebPath.Remove(0, 1);
            }

            string PicUrl = PathHelper.CombineUrl(PathHelper.GetWebAppUrl(),PicSaveWebPath);
            PicUrl = PathHelper.CombineUrl(PicUrl, DateTime.Now.ToString("yyyyMMdd"));
            MinFileSize = AppSettingsHelper.GetInt32("MinFileSize");

            string SaveFullPath = System.IO.Path.Combine(FileSavePath ,DateTime.Now.ToString("yyyyMMdd"));

            WebClient client = new WebClient();
            MatchCollection matchs = new Regex(@"((http|https|ftp|rtsp|mms):(\/\/|\\\\){1}([\w\-]+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(([^.])+[.]{1}(gif|jpg|jpeg|jpe|bmp|png)))", RegexOptions.IgnoreCase).Matches(HtmlContent);

            if (matchs.Count > 0)
            {
                if (!Directory.Exists(SaveFullPath))
                {
                    Directory.CreateDirectory(SaveFullPath);
                }
            }

            //准备处理要下载的文件
            int num = 0;
            List<string> urls = new List<string>();

            foreach (Match match in matchs)
            {
                num++;
                string fileurl = match.Groups[1].Value.ToLower();
                string fileextname = Path.GetExtension(fileurl).ToLower();
                string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string newfilename = fileName + fileextname;
                string fullFileName = System.IO.Path.Combine(SaveFullPath , newfilename);

                if (fileurl.Contains("PicUrl"))
                {
                    continue;
                }

                //防止重复下载
                if (urls.Contains(fileurl))
                {
                    HtmlContent = HtmlContent.Replace(fileurl, PathHelper.CombineUrl(PicUrl, newfilename));
                    continue;
                }
                else
                {
                    urls.Add(fileurl);
                }

                if (AutoMark)
                {
                    string tfilename = fileName + "_t" + fileextname;
                    //下载文件
                    client.DownloadFile(fileurl, System.IO.Path.Combine(SaveFullPath , tfilename));
                    ImageHelper.CreateWeaterPicture(System.IO.Path.Combine(SaveFullPath, tfilename), System.IO.Path.Combine(SaveFullPath, newfilename), HttpContext.Current.Server.MapPath(PicWaterMarkFile), fileextname);
                }
                else
                {
                    //下载文件
                    client.DownloadFile(fileurl, fullFileName);
                    //判断文件大小，大小就删除，不要
                    FileInfo info = new FileInfo(fullFileName);
                    if (info.Length < MinFileSize)
                    {
                        File.Delete(fullFileName);
                        continue;
                    }
                }

                //替换内容
                HtmlContent = HtmlContent.Replace(fileurl, PathHelper.CombineUrl(PicUrl, newfilename));

                //添加到集合
                cData.FileList.Add(PathHelper.CombineUrl(PicUrl, newfilename));
            }
            client.Dispose();

            cData.Content = HtmlContent;


            return cData;
        }

        public static string SaveRequestFiles(string input_name, int uptype)
        {
            string result = "";

            int fCount = HttpContext.Current.Request.Files.Count;

            string PicWaterMarkFile = ConfigurationManager.AppSettings["PicWaterMarkFile"];
            string FileSavePath = ConfigurationManager.AppSettings["FileSavePath"];
            string PicSaveWebPath = ConfigurationManager.AppSettings["PicSaveWebPath"];
            string PicUrl = ConfigurationManager.AppSettings["PicUrl"];
            int automark = RequestHelper.GetQueryInt32("automark", 0);

            string FileSubPath = string.Format("{0}/{1}/{2}/", DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"));
            PicSaveWebPath += FileSubPath;
            string SaveFullPath = FileSavePath + PicSaveWebPath.Replace("/", "\\");

            Random random = new Random(unchecked((int)DateTime.Now.Ticks));

            for (int i = 0; i < fCount; i++)
            {
                if (!HttpContext.Current.Request.Files[i].FileName.Equals("") && HttpContext.Current.Request.Files.AllKeys[i].Equals(input_name))
                {

                    System.IO.FileInfo file = new System.IO.FileInfo(HttpContext.Current.Request.Files[i].FileName);
                    string filename = file.Name;
                    string fileextname = file.Extension.ToLower();
                    string filetype = HttpContext.Current.Request.Files[i].ContentType.ToLower();
                    int filesize = HttpContext.Current.Request.Files[i].ContentLength;
                    string newfilename = Guid.NewGuid().ToString() + fileextname;
                    System.Net.WebClient wc = new System.Net.WebClient();

                    if (CheckFileExt(fileextname))
                    {
                        // 如果指定目录不存在则建立
                        if (!System.IO.Directory.Exists(SaveFullPath))
                        {
                            System.IO.Directory.CreateDirectory(SaveFullPath);
                        }


                        if (automark == 1)
                        {
                            string tfilename = Guid.NewGuid().ToString() + "t" + fileextname;
                            HttpContext.Current.Request.Files[i].SaveAs(SaveFullPath + tfilename);
                            ImageHelper.CreateWeaterPicture(SaveFullPath + tfilename, SaveFullPath + newfilename, HttpContext.Current.Server.MapPath(PicWaterMarkFile), fileextname);
                        }
                        else
                        {

                            HttpContext.Current.Request.Files[i].SaveAs(SaveFullPath + newfilename);
                        }


                        if (uptype == 1)
                        {
                            result = "{\"error\":0,\"url\":\"" + PicUrl + PicSaveWebPath + newfilename + "\"}";
                        }
                        else
                        {
                            result = PicUrl + PicSaveWebPath + newfilename;
                        }
                    }
                    else
                    {
                        //文件格式无效
                        if (uptype == 1)
                        {

                            result = "{\"error\":1,\"message\":\"文件格式无效\"}";
                        }
                        else
                        {
                            result = "";
                        }
                    }


                }
            }//for end

            return result;

        }


        /// <summary>
        /// 检查是否为合法的上传文件
        /// </summary>
        /// <param name="_fileExt"></param>
        /// <returns></returns>
        private static bool CheckFileExt(string _fileExt)
        {
            string[] allowExt = new string[] { ".gif", ".jpg", ".jpeg", ".png", ".swf" };
            for (int i = 0; i < allowExt.Length; i++)
            {
                if (allowExt[i] == _fileExt) { return true; }
            }
            return false;

        }


    }
}
