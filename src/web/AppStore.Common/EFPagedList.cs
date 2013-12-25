using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Webdiyer.WebControls.Mvc;

namespace AppStore.Common
{
    public class EFPagedList<T> :IPagedList<T>
    {
        public EFPagedList(IEnumerable<T> currentPageItems,int pageIndex, int pageSize, int totalItemCount)
        {
            CurrentPageIndex = pageIndex;
            PageSize = pageSize;
            TotalItemCount = totalItemCount;
            PagedItems = currentPageItems.ToList();
        }


        public EFPagedList(IEnumerable<T> allItems, int pageIndex, int pageSize)
        {
            CurrentPageIndex = pageIndex;
            PageSize = pageSize;
            var items = allItems as IList<T> ?? allItems.ToList();
            TotalItemCount = items.Count();
            int startIndex = (pageIndex - 1)*pageSize;
            PagedItems = items.Skip(startIndex).Take(pageSize).ToList();
        }

        public List<T> PagedItems { get; set; } 

        public int CurrentPageIndex { get; set; }

        public int PageSize { get; set; }

        public int TotalItemCount { get; set; }

        public IEnumerator<T> GetEnumerator()
        {
            return PagedItems.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}
