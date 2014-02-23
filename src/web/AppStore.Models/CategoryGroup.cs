using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppStore.Models
{
    public class CategoryGroup
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IList<Category> Categories { get; set; }
    }
}
