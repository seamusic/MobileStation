//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Category
    {
        public string CategoryID { get; set; }
        public int AppTypeID { get; set; }
        public string CategoryName { get; set; }
        public string ParentID { get; set; }
        public Nullable<int> Seq { get; set; }
        public string ENName { get; set; }
    }
}
