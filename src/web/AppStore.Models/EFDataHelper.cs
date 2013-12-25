using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;

namespace AppStore.Common
{
    public class EFDataHelper
    {
        
        public EFDataHelper()
        {
            
        }

        #region get entity table

        public static Int32[] GetPropertyPositions(ObjectQuery query)
        {
            // get private ObjectQueryState ObjectQuery._state; 
            // of actual type internal class 
            //      System.Data.Objects.ELinq.ELinqQueryState 

            Object queryState = GetProperty(query, "QueryState");
            AssertNonNullAndOfType(queryState, "System.Data.Objects.ELinq.ELinqQueryState");

            // get protected ObjectQueryExecutionPlan ObjectQueryState._cachedPlan; 
            // of actual type internal sealed class 
            //      System.Data.Objects.Internal.ObjectQueryExecutionPlan 
            Object plan = GetField(queryState, "_cachedPlan");
            AssertNonNullAndOfType(plan, "System.Data.Objects.Internal.ObjectQueryExecutionPlan");

            // get internal readonly DbCommandDefinition ObjectQueryExecutionPlan.CommandDefinition; 
            // of actual type internal sealed class 
            //      System.Data.EntityClient.EntityCommandDefinition 
            Object commandDefinition = GetField(plan, "CommandDefinition");
            AssertNonNullAndOfType(commandDefinition, "System.Data.EntityClient.EntityCommandDefinition");

            // get private readonly IColumnMapGenerator EntityCommandDefinition._columnMapGenerator; 
            // of actual type private sealed class 
            //      System.Data.EntityClient.EntityCommandDefinition.ConstantColumnMapGenerator 
            Object columnMapGenerator = GetField(commandDefinition, "_columnMapGenerator");
            AssertNonNullAndOfType(columnMapGenerator, "System.Data.EntityClient.EntityCommandDefinition+ConstantColumnMapGenerator");

            // get private readonly ColumnMap ConstantColumnMapGenerator._columnMap; 
            // of actual type internal class 
            //      System.Data.Query.InternalTrees.SimpleCollectionColumnMap 
            Object columnMap = GetField(columnMapGenerator, "_columnMap");
            AssertNonNullAndOfType(columnMap, "System.Data.Query.InternalTrees.SimpleCollectionColumnMap");

            // get internal ColumnMap CollectionColumnMap.Element; 
            // of actual type internal class 
            //      System.Data.Query.InternalTrees.RecordColumnMap 
            Object columnMapElement = GetProperty(columnMap, "Element");
            AssertNonNullAndOfType(columnMapElement, "System.Data.Query.InternalTrees.RecordColumnMap");

            // get internal ColumnMap[] StructuredColumnMap.Properties; 
            // array of internal abstract class 
            //      System.Data.Query.InternalTrees.ColumnMap 
            Array columnMapProperties = GetProperty(columnMapElement, "Properties") as Array;
            AssertNonNullAndOfType(columnMapProperties, "System.Data.Query.InternalTrees.ColumnMap[]");

            Int32 n = columnMapProperties.Length;

            Int32[] propertyPositions = new Int32[n];

            for (Int32 i = 0; i < n; ++i)
            {
                // get value at index i in array 
                // of actual type internal class 
                //      System.Data.Query.InternalTrees.ScalarColumnMap 
                Object column = columnMapProperties.GetValue(i);
                AssertNonNullAndOfType(column, "System.Data.Query.InternalTrees.ScalarColumnMap");

                //string colName = (string)GetProp(column, "Name"); 
                // can be used for more advanced bingings 

                // get internal int ScalarColumnMap.ColumnPos; 
                Object columnPositionOfAProperty = GetProperty(column, "ColumnPos");
                AssertNonNullAndOfType(columnPositionOfAProperty, "System.Int32");

                propertyPositions[i] = (int)columnPositionOfAProperty;

            }

            return propertyPositions;

        }

        static object GetProperty(object obj, string propName)
        {
            PropertyInfo prop = obj.GetType().GetProperty(propName, BindingFlags.NonPublic | BindingFlags.Instance);
            if (prop == null) throw EFChangedException();
            return prop.GetValue(obj, new object[0]);

        }

        static object GetField(object obj, string fieldName)
        {
            FieldInfo field = obj.GetType().GetField(fieldName, BindingFlags.NonPublic | BindingFlags.Instance);
            if (field == null) throw EFChangedException();
            return field.GetValue(obj);

        }

        static void AssertNonNullAndOfType(object obj, string fullName)
        {
            if (obj == null) throw EFChangedException();
            string typeFullName = obj.GetType().FullName;
            if (typeFullName != fullName) throw EFChangedException();

        }

        static InvalidOperationException EFChangedException()
        {
            return new InvalidOperationException("Entity Framework internals has changed, please review and fix reflection code");

        }

        public static DataTable EntityToDatatable(IQueryable query)
        {
            SqlConnection sqlConnection = null;
            SqlCommand sqlCommand = null;
            SqlDataAdapter sqlDataAdapter = null;
            DataTable dataTable = null;

            try
            {
                ObjectQuery objectQuery = (query as ObjectQuery);

                ObjectContext objectContext = objectQuery.Context;

                EntityConnection entityConnection = (objectContext.Connection as EntityConnection);

                sqlConnection = new SqlConnection(entityConnection.StoreConnection.ConnectionString);

                sqlCommand = new SqlCommand(objectQuery.ToTraceString(), sqlConnection);

                foreach (var parameter in objectQuery.Parameters)
                {
                    sqlCommand.Parameters.AddWithValue(parameter.Name, parameter.Value);

                }

                sqlDataAdapter = new SqlDataAdapter(sqlCommand);

                dataTable = new DataTable();

                sqlDataAdapter.Fill(dataTable);

                // Get the mapping between the object property position and 
                // the SQL statment column position.
                Int32[] propertyPositions = objectQuery.GetPropertyPositions();

                // Create a column name to column position (ordinal) lookup.
                Dictionary<String, Int32> mapColumnNameToColumnPosition = new Dictionary<string, int>();

                // Populate the lookup.
                for (Int32 i = 0; i < propertyPositions.Length; ++i)
                {
                    mapColumnNameToColumnPosition.Add(dataTable.Columns[propertyPositions[i]].ColumnName, i);

                }

                // Get the object's property information.
                PropertyInfo[] pi = query.GetType().GetGenericArguments()[0].GetProperties();

                // Iterate through the lookup and change the position of the datatable columns.
                // The order of the datatable columns will now correspond to the order of the object
                // properties.
                foreach (var map in mapColumnNameToColumnPosition)
                {
                    // Change the column position.
                    dataTable.Columns[map.Key].SetOrdinal(map.Value);

                    // Change the column name.
                    dataTable.Columns[map.Key].ColumnName = pi[map.Value].Name;

                }

                return dataTable;

            }
            catch (Exception ex)
            {
                // Something went wrong and we're going to raise an exception...we
                // might as well dispose of the datatable if it exists because it's
                // not going to be used.
                if (dataTable != null) dataTable.Dispose();

                throw new Exception("IQueryable to DataTable conversion error.", ex);

            }
            finally
            {
                // Do some cleanup on objects that are no longer needed.

                if (sqlDataAdapter != null) sqlDataAdapter.Dispose();

                if (sqlCommand != null) sqlCommand.Dispose();

                if (sqlConnection != null) sqlConnection.Dispose();

            }

        }

        #endregion
        
        public static DataTable ExecuteStoreQuery(string commandText, params Object[] parameters)
        {
            DataTable retVal = new DataTable();
            //retVal = context.ExecuteStoreQuery<DataTable>(commandText, parameters).FirstOrDefault();
            return retVal;
        }
    }
}
