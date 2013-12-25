using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppStore.Manage.Models
{
    public class BreadcrumbModels
    {
    }
    public class BreadcrumbSet
    {
        public BreadcrumbSet()
        {
            PrevList = new List<BreadcrumbLink>();
            Current = new BreadcrumbLink();
        }
        public List<BreadcrumbLink> PrevList { get; set; }
        public BreadcrumbLink Current { get; set; }
    }
    public class BreadcrumbLink
    {
        public string Text { get; set; }
        public string Url { get; set; }
    }
}