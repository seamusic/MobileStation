using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Runtime.Serialization;
using AppStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Webdiyer.WebControls.Mvc;

namespace AppStore.Business
{
    public class ApplicationBusiness : BaseBusiness<ApplicationBusiness>, IBusiness
    {
        public IList<Application> GetApplication()
        {
            using (var db = new appstoreEntities())
            {
                return db.Application.OrderByDescending(o => o.UpdateTime).ToList();
            }

            return null;
        }

        public Application GetApplication(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.Application.FirstOrDefault(m => m.ApplicationID == id);
            }
        }
        
        public IList<Picture> GetApplicationPictures(string id)
        {
            using (var db = new appstoreEntities())
            {
                return db.Picture.Where(m => m.ApplicationID == id).ToList();
            }
        }

        /// <summary>
        /// 获取应用列表
        /// </summary>
        /// <param name="appTyle"></param>
        /// <param name="categoryId"></param>
        /// <param name="applicationName"></param>
        /// <param name="isrecommend"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public PagedList<Application> GetApplicationList(int? appTyle, string categoryId, string applicationName, bool? isrecommend, int index = 1, int count = 9)
        {
            using (var db = new appstoreEntities())
            {
                var qry = db.Application.AsQueryable();
                if (appTyle != null && appTyle != 0)
                    qry = qry.Where(a => a.AppType == appTyle);
                if (!string.IsNullOrWhiteSpace(categoryId))
                    qry = qry.Where(a => a.CategoryID == categoryId);
                if (!string.IsNullOrWhiteSpace(applicationName))
                    qry = qry.Where(a => a.ApplicationName.Contains(applicationName));
                if (isrecommend != null)
                {
                    qry = qry.Where(m => m.IsRecommend == isrecommend);
                }

                var model = qry.OrderByDescending(a => a.UpdateTime).ToPagedList(index, count);
                return model;
            }
            return null;
        }

        /// <summary>
        /// 获取目录列表
        /// </summary>
        /// <returns></returns>
        public IList<Category> GetCategory()
        {
            using (var db = new appstoreEntities())
            {
                return db.Category.OrderBy(o => o.Seq).ToList();
            }

            return null;
        }

        /// <summary>
        /// 获取目录列表
        /// </summary>
        /// <returns></returns>
        public IList<Category> GetCategoryList(int apptype)
        {
            using (var db = new appstoreEntities())
            {
                return db.Category.Where(m => m.AppTypeID == apptype).OrderBy(o => o.Seq).ToList();
            }

            return null;
        }

        /// <summary>
        /// 获取目录
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public Category GetCategory(string categoryId)
        {
            if (string.IsNullOrEmpty(categoryId))
            {
                return null;
            }

            using (var db = new appstoreEntities())
            {
                return db.Category.FirstOrDefault(o => o.CategoryID == categoryId);
            }
        }

        /// <summary>
        /// 保存目录
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public bool SaveCategory(Category category)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (string.IsNullOrEmpty(category.CategoryID))
                {
                    category.CategoryID = Guid.NewGuid().ToString();
                    db.Category.Add(category);
                }
                else
                {
                    db.Category.Attach(category);
                    db.Entry(category).State = EntityState.Modified;
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        /// <summary>
        /// 保存应用数据
        /// </summary>
        /// <param name="application"></param>
        /// <param name="pictures"></param>
        /// <returns></returns>
        public bool SaveApplication(Application application, IList<Picture> pictures)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                if (application.UpdateTime == DateTime.MinValue)
                {
                    application.UpdateTime = DateTime.Now;
                    db.Application.Add(application);
                }
                else
                {
                    application.UpdateTime = DateTime.Now;
                    db.Application.Attach(application);
                    db.Entry(application).State = EntityState.Modified;
                }

                var oldPics = db.Picture.Where(o => o.ApplicationID == application.ApplicationID);
                db.Picture.RemoveRange(oldPics);
                if (pictures!=null)
                {
                    db.Picture.AddRange(pictures);
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }
    }
}
