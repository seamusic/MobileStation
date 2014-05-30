using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace AppStore.Common
{
    public static class IQueryableExtension
    {
        private static MethodInfo orderbyInfo = null;
        private static MethodInfo orderbyDecInfo = null;

        public static IQueryable<T> OrderBy<T>(this IQueryable<T> query, string property) where T : class
        {
            Type entityType = typeof(T);
            Type entityPropertyType = entityType.GetProperty(property).PropertyType;

            var orderPara = Expression.Parameter(entityType, "o");
            var orderExpr = Expression.Lambda(Expression.Property(orderPara, property), orderPara);

            if (orderbyInfo == null)
            {
                //因為呼叫OrderBy需要知道型別，不知道的情況下無法直接呼叫，所以用反射的方式呼叫
                //泛型的GetMethod很難，所以用GetMethods在用Linq取出Method，找到後快取。
                orderbyInfo = typeof(Queryable).GetMethods().Single(x => x.Name == "OrderBy" && x.GetParameters().Length == 2);
            }

            //因為是泛型Mehtod要呼叫MakeGenericMethod決定泛型型別
            return orderbyInfo.MakeGenericMethod(new Type[] { entityType, entityPropertyType }).Invoke(null, new object[] { query, orderExpr }) as IQueryable<T>;
        }

        public static IQueryable<T> OrderByDescending<T>(this IQueryable<T> query, string property)
        {
            Type entityType = typeof(T);
            Type entityPropertyType = entityType.GetProperty(property).PropertyType;

            var orderPara = Expression.Parameter(entityType, "o");
            var orderExpr = Expression.Lambda(Expression.Property(orderPara, property), orderPara);

            if (orderbyDecInfo == null)
            {
                orderbyDecInfo = typeof(Queryable).GetMethods().Single(x => x.Name == "OrderByDescending" && x.GetParameters().Length == 2);
            }

            return orderbyDecInfo.MakeGenericMethod(new Type[] { entityType, entityPropertyType }).Invoke(null, new object[] { query, orderExpr }) as IQueryable<T>;
        }
    }
}
