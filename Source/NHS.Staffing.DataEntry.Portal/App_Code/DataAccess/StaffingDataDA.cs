using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for StaffingDataDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class StaffingDataDA : DataAccessBase
    {
        public StaffingDataDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public void InsertStaffing(DateTime startDate, DateTime endDate, int safeRN, int safeHCA, int optimumRN, int optimumHCA)
        {
            DataTable dataTable = GetDataTable();
            DataRow row;
            DateTime tempDate = startDate;

            while (tempDate <= endDate)
            {
                row = dataTable.NewRow();

                row["StaffingDate"] = tempDate;
                row["OptimumRN"] = safeRN;
                row["OptimumHCA"] = safeHCA;
                row["SafeRN"] = optimumRN;
                row["SafeHCA"] = optimumHCA;

                tempDate.AddDays(1);
                dataTable.Rows.Add(row);
            }


            using (SqlConnection dbConnection = GetConnection())
            {
                dbConnection.Open();
                using (SqlBulkCopy s = new SqlBulkCopy(dbConnection))
                {
                    s.DestinationTableName = dataTable.TableName;

                    foreach (var column in dataTable.Columns)
                        s.ColumnMappings.Add(column.ToString(), column.ToString());

                    s.WriteToServer(dataTable);
                }
            }
        }

        private DataTable GetDataTable()
        {
            DataTable staffingData = new DataTable("StaffingData");

            // Create Column 1: StaffingDate
            DataColumn dateColumn = new DataColumn();
            dateColumn.DataType = Type.GetType("System.DateTime");
            dateColumn.ColumnName = "StaffingDate";

            // Create Column 2: OptimumRN
            DataColumn optimumRN = new DataColumn();
            optimumRN.DataType = Type.GetType("System.Int32");
            optimumRN.ColumnName = "OptimumRN";

            // Create Column 2: OptimumHCA
            DataColumn optimumHCA = new DataColumn();
            optimumHCA.DataType = Type.GetType("System.Int32");
            optimumHCA.ColumnName = "OptimumHCA";

            // Create Column 3: SafeRN
            DataColumn safeRN = new DataColumn();
            safeRN.DataType = Type.GetType("System.Int32");
            safeRN.ColumnName = "SafeRN";

            // Create Column 3: SafeHCA
            DataColumn safeHCA = new DataColumn();
            safeHCA.DataType = Type.GetType("System.Int32");
            safeHCA.ColumnName = "SafeHCA";

            staffingData.Columns.Add(dateColumn);
            staffingData.Columns.Add(optimumRN);
            staffingData.Columns.Add(optimumHCA);
            staffingData.Columns.Add(safeRN);
            staffingData.Columns.Add(safeHCA);

            return staffingData;
        }
    }
}