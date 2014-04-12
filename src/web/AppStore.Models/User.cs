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
    
    public partial class User
    {
        public User()
        {
            this.UserRole = new HashSet<UserRole>();
        }
    
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string LoginId { get; set; }
        public string Password { get; set; }
        public Nullable<System.DateTime> RegTime { get; set; }
        public Nullable<System.DateTime> LastLoginTime { get; set; }
        public Nullable<int> ErrorCount { get; set; }
        public Nullable<bool> IsValid { get; set; }
        public Nullable<System.DateTime> UpdateTime { get; set; }
        public string Mobile { get; set; }
        public string Telephone { get; set; }
    
        public virtual ICollection<UserRole> UserRole { get; set; }
    }
}
