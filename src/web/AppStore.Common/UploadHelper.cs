using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using ApkUtil;
using Lennon.Utility;

namespace AppStore.Common
{
    public class UploadFileInfo
    {
        public string Name { get; set; }
        public string CnName { get; set; }
        public string SitePath { get; set; }
        public string RelativePath { get; set; }
        public string Extension { get; set; }
        public long FileSize { get; set; }
    }

    public class ViewDataUploadFilesResult
    {
        public string name { get; set; }
        public int size { get; set; }
        public string type { get; set; }
        public string url { get; set; }
        public string delete_url { get; set; }
        public string thumbnail_url { get; set; }
        public string delete_type { get; set; }
    }

    public class UploadHelper
    {
        private ServerSetting _setting = ServerSettingProxy.Instance.LoadConfig();


        private string GetSavePath(string savePath, string path)
        {
            path = string.IsNullOrEmpty(path) ? _setting.TemplatePath : path;
            var uploadPath = savePath;
            if (!string.IsNullOrEmpty(path))
            {
                uploadPath = Path.Combine(savePath, path);
            }
            uploadPath = System.Web.HttpContext.Current.Server.MapPath(uploadPath);
            if (!System.IO.Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            return uploadPath;
        }

        /// <summary>
        /// 保存上传的文件
        /// 如果传入的路径为空，则保存在临时文件目录下
        /// 如果传入不为空，则上传文件夹的指定目录下
        /// </summary>
        /// <param name="request"></param>
        /// <param name="path"></param>
        /// <param name="rename"></param>
        /// <returns></returns>
        public IList<UploadFileInfo> Upload(HttpRequestBase request, string path, bool rename)
        {
            IList<UploadFileInfo> uploadList = new List<UploadFileInfo>();
            var savePath = string.IsNullOrEmpty(path) ? _setting.TemplatePath : path;
            var uploadPath = GetSavePath(_setting.UploadPath, savePath);

            var chunk = string.IsNullOrEmpty(request.Params["chunk"]) ? 0 : int.Parse(request.Params["chunk"]);
            var chunks = string.IsNullOrEmpty(request.Params["chunks"]) ? 0 : int.Parse(request.Params["chunks"]);
            var fileName = string.IsNullOrEmpty(request.Params["name"]) ? Guid.NewGuid().ToString() : request.Params["name"];

            //判断Request中是否有接收Files文件
            if (request.Files.Count != 0)
            {
                for (int i = 0; i < request.Files.Count; i++)
                {
                    //HttpPostedFileBase类，提供对用户上载的单独文件的访问
                    //获取到用户上传的文件
                    var file = request.Files[i];

                    if (file == null)
                    {
                        continue;
                    }

                    //获取用户上传文件的后缀名
                    string extension = Path.GetExtension(fileName);
                    //重新命名文件
                    var saveFileName = rename ? DateTime.Now.ToString("yyyyMMddHHmmss") + extension : fileName;
                    string filePath = Path.Combine(uploadPath, saveFileName);

                    if (chunk == 0)
                    {
                        //有则删除之，以免后患
                        if (File.Exists(filePath))
                        {
                            File.Delete(filePath);
                        }
                    }

                    //不相等则说明是分段上传的
                    if (!fileName.Equals(file.FileName, StringComparison.OrdinalIgnoreCase))
                    {
                        using (var fs = new FileStream(filePath, FileMode.Append, FileAccess.Write))
                        {
                            var buffer = new byte[1024];
                            var len = file.InputStream.Read(buffer, 0, 1024);
                            while (len > 0)
                            {
                                fs.Write(buffer, 0, len);
                                len = file.InputStream.Read(buffer, 0, 1024);
                            }
                            fs.Flush();
                            fs.Close();
                        }
                    }
                    else
                    {
                        //不是分段上传的则直接保存
                        file.SaveAs(filePath);
                    }

                    var info = new UploadFileInfo
                    {
                        Name = saveFileName,
                        CnName = file.FileName,
                        FileSize = file.ContentLength,
                        RelativePath = Path.Combine(savePath, saveFileName).Replace('\\', '/'),
                        SitePath = Path.Combine(savePath, saveFileName).Replace('\\', '/'),
                        Extension = extension
                    };
                    uploadList.Add(info);
                }
            }
            return uploadList;
        }

        public string MotoPath(string pics, string olddir, string newdir)
        {
            var newpics = pics.Replace(olddir, _setting.AppPath + "/" + newdir);
            var p = pics.Split(',');
            var n = newpics.Split(',');
            for (int i = 0; i < pics.Length; i++)
            {
                var path = GetSavePath(_setting.UploadPath, p[i]);
                var oldPath = GetSavePath(_setting.UploadPath, n[i]);
                try
                {
                    File.Move(oldPath, path);
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), string.Format("移动文件出错{0}.{1}", path, oldPath), ex);
                }
            }
            return newpics;
        }

        public bool MoveToPath(UploadFileInfo info, string newpath)
        {
            if (info != null && File.Exists(info.RelativePath))
            {
                var path = GetSavePath(_setting.UploadPath, newpath);
                var oldPath = GetSavePath(_setting.UploadPath, info.RelativePath);
                try
                {
                    File.Move(oldPath, path);
                    return true;
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "移动文件出错", ex);
                    return false;
                }
            }
            return false;
        }

        public ApplicationFileInfo SaveApk(UploadFileInfo uploadFileInfo)
        {
            if (uploadFileInfo != null)
            {
                var filePath = Path.Combine(_setting.UploadPath,
                    uploadFileInfo.RelativePath);
                filePath = System.Web.HttpContext.Current.Server.MapPath(filePath);

                if (!File.Exists(filePath))
                {
                    return null;
                }

                var applicationFileInfo = new ApplicationFileInfo();
                var reader = new Reader();
                ApkInfo apkInfo = reader.GetApkInfo(filePath);
                var relativepath = Path.Combine(_setting.AppPath, apkInfo.PackageName);
                var dir = Path.Combine(_setting.UploadPath, relativepath);
                var localPath = System.Web.HttpContext.Current.Server.MapPath(dir);
                var name = string.Format("{0}_{1}{2}", "android", apkInfo.VersionName, uploadFileInfo.Extension);
                var newPath = Path.Combine(localPath, name);


                if (!Directory.Exists(localPath))
                {
                    Directory.CreateDirectory(localPath);
                }

                try
                {
                    if (File.Exists(newPath))
                    {
                        File.Delete(newPath);
                    }
                    File.Move(filePath, newPath);
                }
                catch (Exception ex)
                {
                    LogHelper.Error(this.GetType(), "移动文件出错", ex);
                    throw;
                }

                uploadFileInfo.CnName = string.Format("{0}_{1}{2}", apkInfo.ApplicationLabel, apkInfo.VersionName, uploadFileInfo.Extension);
                uploadFileInfo.Name = name;
                uploadFileInfo.RelativePath = Path.Combine(relativepath, uploadFileInfo.Name).Replace('\\', '/');
                uploadFileInfo.SitePath = Path.Combine(dir, uploadFileInfo.Name).Replace('\\', '/');

                applicationFileInfo.ApkInfo = apkInfo;
                applicationFileInfo.Length = uploadFileInfo.FileSize;
                applicationFileInfo.RelativePath = uploadFileInfo.RelativePath;

                return applicationFileInfo;
            }
            return null;
        }

        public IList<UploadFileInfo> UploadDriver(HttpRequestBase request)
        {
            var path = request.Headers["path"];
            path = _setting.DriverPath + "/" + path;
            return Upload(request, path, false);
        }

        // Upload partial file
        private void UploadPartialFile(string fileName, HttpContext context, List<FilesStatus> statuses)
        {
            if (context.Request.Files.Count != 1)
                throw new HttpRequestValidationException("Attempt to upload chunked file containing more than one fragment per request");

            var inputStream = context.Request.Files[0].InputStream;
            var fullName = GetSavePath(_setting.UploadPath, string.Empty) + Path.GetFileName(fileName);

            using (var fs = new FileStream(fullName, FileMode.Append, FileAccess.Write))
            {
                var buffer = new byte[1024];

                var l = inputStream.Read(buffer, 0, 1024);
                while (l > 0)
                {
                    fs.Write(buffer, 0, l);
                    l = inputStream.Read(buffer, 0, 1024);
                }
                fs.Flush();
                fs.Close();
            }
            statuses.Add(new FilesStatus(new FileInfo(fullName)));
        }

        // Upload entire file
        private void UploadWholeFile(HttpContext context, List<FilesStatus> statuses)
        {
            for (int i = 0; i < context.Request.Files.Count; i++)
            {
                var file = context.Request.Files[i];
                file.SaveAs(GetSavePath(_setting.UploadPath, string.Empty) + Path.GetFileName(file.FileName));

                string fullName = Path.GetFileName(file.FileName);
                statuses.Add(new FilesStatus(fullName, file.ContentLength));
            }
        }
    }
}
