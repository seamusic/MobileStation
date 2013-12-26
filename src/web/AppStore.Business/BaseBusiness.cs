using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentData;

namespace AppStore.Business
{
    public class BaseBusiness
    {
        private IDbContext context;

        protected IDbContext GetContext
        {
            get
            {
                if (context == null)
                {
                    IDbProvider dbProvider = new SqlServerProvider();
                    context = new DbContext().ConnectionStringName("DefaultConnection", dbProvider);
                }
                return context;
            }
        }
    }
}
