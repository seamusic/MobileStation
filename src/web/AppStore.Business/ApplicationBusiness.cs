using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq.Expressions;
using System.Runtime.Serialization;
using AppStore.Common;
using AppStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Webdiyer.WebControls.Mvc;

namespace AppStore.Business
{
    public class ApplicationBusiness : IBusiness
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
                var ent = db.Application.Include(i => i.Category).FirstOrDefault(m => m.ApplicationID == id);
                try
                {
                    if (ent != null)
                    {
                        ent.Total += 1;
                        db.SaveChanges();
                    }
                }
                catch (Exception ex)
                {
                }
                return ent;
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
        public PagedList<Application> GetApplicationList(int? appTyle, string categoryId, string applicationName, bool? isrecommend,
            string order, bool asc, bool? isvalid, int index = 1, int count = 9)
        {
            using (var db = new appstoreEntities())
            {
                var qry = db.Application.Include(i => i.Category).AsQueryable();
                if (isvalid != null)
                {
                    qry = qry.Where(m => m.IsValid == isvalid);
                }
                if (appTyle != null && appTyle != 0)
                    qry = qry.Where(a => a.AppType == appTyle);
                if (!string.IsNullOrWhiteSpace(categoryId))
                    qry = qry.Where(a => a.Category.Any(o => o.CategoryID == categoryId));
                if (!string.IsNullOrWhiteSpace(applicationName))
                    qry = qry.Where(a => a.ApplicationName.Contains(applicationName));
                if (isrecommend != null)
                {
                    qry = qry.Where(m => m.IsRecommend == isrecommend);
                }
                if (string.IsNullOrEmpty(order))
                {
                    order = "Seq";
                }
                qry = asc ? qry.OrderBy(order) : qry.OrderByDescending(order);

                PagedList<Application> model = qry.ToPagedList(index, count);

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
                if (apptype==0)
                {
                    return db.Category.ToList<Category>();
                }
                else
                {
                    return db.Category.Where(m => m.AppTypeID == apptype).OrderBy(o => o.Seq).ToList<Category>();
                }
            }

            return null;
        }

        public IList<CategoryGroup> GetAllCategory()
        {
            using (var db = new appstoreEntities())
            {
                var list = db.Category.ToList();
                var group = new List<CategoryGroup>();
                group.Add(new CategoryGroup() { Id = (int)ApplicationType.装机必备, Name = ApplicationType.装机必备.ToString(), Categories = list.Where(o => o.AppTypeID == (int)ApplicationType.装机必备).OrderBy(o => o.Seq).ToList() });
                group.Add(new CategoryGroup() { Id = (int)ApplicationType.应用工具, Name = ApplicationType.应用工具.ToString(), Categories = list.Where(o => o.AppTypeID == (int)ApplicationType.应用工具).OrderBy(o => o.Seq).ToList() });
                group.Add(new CategoryGroup() { Id = (int)ApplicationType.游戏娱乐, Name = ApplicationType.游戏娱乐.ToString(), Categories = list.Where(o => o.AppTypeID == (int)ApplicationType.游戏娱乐).OrderBy(o => o.Seq).ToList() });
                return group;
            }
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

        public IList<Application> GetTopRanking(string categoryId, int count = 10)
        {
            if (string.IsNullOrEmpty(categoryId))
            {
                return null;
            }

            using (var db = new appstoreEntities())
            {
                return db.Application.Where(o => o.Category.Any(c => c.CategoryID == categoryId)).OrderByDescending(o => o.Total).Take(count).ToList();
            }
        }

        public IList<Category> GetCategories(int? appTyle)
        {
            if (appTyle == null || appTyle == 0)
            {
                return null;
            }

            using (var db = new appstoreEntities())
            {
                return db.Category.Where(o => o.AppTypeID == appTyle).ToList();
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

        public bool DeleteApplication(string id)
        {
            bool result = false;
            using (var db = new appstoreEntities())
            {
                var app = db.Application.Include(i => i.Category).FirstOrDefault(o => o.ApplicationID == id);
                if (app != null)
                {
                    var pics = db.Picture.Where(o => o.ApplicationID == id);
                    db.Picture.RemoveRange(pics);

                    app.Category = null;

                    db.Application.Remove(app);
                    result = db.SaveChanges() > 0;
                }
            }
            return result;
        }
        public bool DeleteCategory(string id)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                var employer = new Category() { CategoryID = id };
                db.Category.Attach(employer);
                db.Category.Remove(employer);
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
        public bool SaveApplication(Application application, IList<Picture> pictures, string cids)
        {
            bool result;
            using (var db = new appstoreEntities())
            {
                var old = db.Application.Include(i => i.Category)
                    .SingleOrDefault(o => o.ApplicationID == application.ApplicationID);
                var categories = db.Category.Where(o => cids.Contains(o.CategoryID)).ToList();
                if (old == null)
                {
                    application.CreateTime = DateTime.Now;
                    application.UpdateTime = DateTime.Now;
                    db.Category.AddRange(categories);
                    db.Application.Add(application);
                }
                else
                {
                    DbEntityEntry<Application> entry = db.Entry(old);
                    entry.CurrentValues.SetValues(application);
                    //var oldCategoryIds = new HashSet<string>(old.Category.Select(o => o.CategoryID));
                    //移除cids中没有的
                    foreach (Category category in old.Category)
                    {
                        if (!cids.Contains(category.CategoryID))
                        {
                            old.Category.Remove(category);
                        }
                    }
                    //添加cids中有的
                    foreach (var category in categories)
                    {
                        if (old.Category.All(o => o.CategoryID != category.CategoryID))
                        {
                            old.Category.Add(category);
                        }
                    }

                    //db.Application.Attach(application);
                    //db.Entry(application).State = EntityState.Modified;
                }

                var oldPics = db.Picture.Where(o => o.ApplicationID == application.ApplicationID);
                db.Picture.RemoveRange(oldPics);
                if (pictures != null)
                {
                    db.Picture.AddRange(pictures);
                }

                result = db.SaveChanges() > 0;
            }
            return result;
        }

        public bool SaveAppLication(string id, int seq)
        {
            bool result = false;
            using (var db = new appstoreEntities())
            {
                var app = db.Application.FirstOrDefault(o => o.ApplicationID == id);
                if (app != null)
                {
                    app.Seq = seq;
                    result = db.SaveChanges() > 0;
                }
            }
            return result;
        }

        public PagedList<Application> SearchApplication(string keyword, int index, int count)
        {
            using (var db = new appstoreEntities())
            {
                var qry = db.Application.Where(m => m.IsValid == true).AsQueryable();
                if (!string.IsNullOrWhiteSpace(keyword))
                    qry = qry.Where(a => a.ApplicationName.Contains(keyword));

                PagedList<Application> model = qry.ToPagedList(index, count);

                return model;
            }
        }
    }
}
