using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.Profile;
using FluentData;

namespace AppStore.Common
{
    public static class FluentDataHelper
    {
        private static IDbContext Context()
        {
            IDbProvider dbProvider=new SqlServerProvider();
            return new DbContext().ConnectionStringName("DefaultConnection", dbProvider);
        }
    }
}
