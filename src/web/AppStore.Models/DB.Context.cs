﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class appstoreEntities : DbContext
    {
        public appstoreEntities()
            : base("name=appstoreEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Application> Application { get; set; }
        public DbSet<ApplicationEvaluate> ApplicationEvaluate { get; set; }
        public DbSet<ApplicationTag> ApplicationTag { get; set; }
        public DbSet<AppType> AppType { get; set; }
        public DbSet<AppUser> AppUser { get; set; }
        public DbSet<Brand> Brand { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<Driver> Driver { get; set; }
        public DbSet<Mobile> Mobile { get; set; }
        public DbSet<MobileApp> MobileApp { get; set; }
        public DbSet<MobileApplication> MobileApplication { get; set; }
        public DbSet<MobileClient> MobileClient { get; set; }
        public DbSet<PCApp> PCApp { get; set; }
        public DbSet<PCClient> PCClient { get; set; }
        public DbSet<PCInstallLog> PCInstallLog { get; set; }
        public DbSet<PhoneModel> PhoneModel { get; set; }
        public DbSet<Picture> Picture { get; set; }
        public DbSet<Role> Role { get; set; }
        public DbSet<RoleUser> RoleUser { get; set; }
        public DbSet<RunLog> RunLog { get; set; }
        public DbSet<Statistics> Statistics { get; set; }
        public DbSet<Tag> Tag { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<UserMobile> UserMobile { get; set; }
        public DbSet<UserProfile> UserProfile { get; set; }
        public DbSet<webpages_Membership> webpages_Membership { get; set; }
        public DbSet<webpages_OAuthMembership> webpages_OAuthMembership { get; set; }
        public DbSet<webpages_Roles> webpages_Roles { get; set; }
    }
}