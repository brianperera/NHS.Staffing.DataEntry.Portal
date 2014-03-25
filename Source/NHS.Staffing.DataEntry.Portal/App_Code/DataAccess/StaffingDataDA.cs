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

        public List<StaffingData> GetAllStaffing()
        {
            List<StaffingData> allWards = new List<StaffingData>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllStaffing", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    StaffingData ward;
                    StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
                    List<StaffingDateRange> staffingDateRanges = staffingDateRangeDA.GetAllStaffingDateRanges();

                    int tempInt;

                    while (results.Read())
                    {
                        ward = new StaffingData();
                        ward.WardCode = results["Ward Code"].ToString();
                        ward.StaffingDate = results["Day"].ToString();
                        ward.Shift = results["Shift"].ToString();

                        int.TryParse(results["Beds"].ToString(), out tempInt);
                        ward.Beds = tempInt;

                        if (int.TryParse(results["Safe Staffing RN"].ToString(), out tempInt))
                            ward.SafeRN = tempInt;
                        if (int.TryParse(results["Safe Staffing HCA"].ToString(), out tempInt))
                            ward.SafeHCA = tempInt;
                        if (int.TryParse(results["Optimum Staffing RN"].ToString(), out tempInt))
                             ward.OptimumRN = tempInt;
                        if (int.TryParse(results["Optimum Staffing HCA"].ToString(), out tempInt))
                             ward.OptimumHCA = tempInt;
                        if (int.TryParse(results["StaffingDateIndex"].ToString(), out tempInt))
                        {
                            ward.StaffingDateRangeIndex = tempInt;

                            var staffingDateRange = (from p in staffingDateRanges
                                           where p.Index == tempInt
                                           select p).SingleOrDefault();

                            if (staffingDateRange != null)
                            {
                                ward.PeriodStartDate = staffingDateRange.StartDate;
                                ward.PeriodEndDate = staffingDateRange.EndDate;
                            }
                        }

                        allWards.Add(ward);
                    }
                }
            }

            return allWards;
        }

        public bool AddStaffingData(StaffingData record)
        {
            return AddOrUpdateStaffingData(record, "InsertStaffing");
        }

        public bool UpdateStaffingData(StaffingData record)
        {
            return AddOrUpdateStaffingData(record, "UpdateStaffing");
        }

        public bool AddOrUpdateStaffingData(StaffingData record, string sp)
        {
            bool isSuccess = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(sp, con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter WardCode = GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode);
                SqlParameter Shift = GetParameter("@Shift", SqlDbType.VarChar, record.Shift);
                SqlParameter StaffingDate = GetParameter("@Day", SqlDbType.VarChar, record.StaffingDate);
                SqlParameter Beds = GetParameter("@Beds", SqlDbType.Int, record.Beds);
                SqlParameter OptimumHCA = GetParameter("@OptimumStaffingHCA", SqlDbType.Int, record.OptimumHCA);
                SqlParameter OptimumRN = GetParameter("@OptimumStaffingRN", SqlDbType.Int, record.OptimumRN);
                SqlParameter SafeHCA = GetParameter("@SafeStaffingHCA", SqlDbType.Int, record.SafeHCA);
                SqlParameter SafeRN = GetParameter("@SafeStaffingRN", SqlDbType.Int, record.SafeRN);
                SqlParameter StaffingDateRangeIndex = GetParameter("@StaffingDateIndex", SqlDbType.Int, record.StaffingDateRangeIndex);

                command.Parameters.Add(WardCode);
                command.Parameters.Add(Shift);
                command.Parameters.Add(StaffingDate);
                command.Parameters.Add(Beds);
                command.Parameters.Add(OptimumHCA);
                command.Parameters.Add(OptimumRN);
                command.Parameters.Add(SafeHCA);
                command.Parameters.Add(SafeRN);
                command.Parameters.Add(StaffingDateRangeIndex);

                var results = command.ExecuteNonQuery();

                if (results > 0)
                    isSuccess = true;
            }

            return isSuccess;
        }

        public bool DeleteStaffingData(StaffingData record)
        {
            bool isSuccessful = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("DeleteStaffing", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter WardCode = GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode);
                SqlParameter Shift = GetParameter("@Shift", SqlDbType.VarChar, record.Shift);
                SqlParameter Day = GetParameter("@Day", SqlDbType.VarChar, record.StaffingDate);
                SqlParameter StaffingDateIndex = GetParameter("@StaffingDateIndex", SqlDbType.Int, record.StaffingDateRangeIndex);

                command.Parameters.Add(WardCode);
                command.Parameters.Add(Shift);
                command.Parameters.Add(Day);
                command.Parameters.Add(StaffingDateIndex);

                var results = command.ExecuteNonQuery();

                if (results > 0)
                    isSuccessful = true;

                return isSuccessful;
            }
        }

        #region Bulk insert : Currently not used
        //public void InsertStaffing(DateTime startDate, DateTime endDate, int safeRN, int safeHCA, int optimumRN, int optimumHCA)
        //{
        //    DataTable dataTable = GetDataTable();
        //    DataRow row;
        //    DateTime tempDate = startDate;

        //    while (tempDate <= endDate)
        //    {
        //        row = dataTable.NewRow();

        //        row["StaffingDate"] = tempDate;
        //        row["OptimumRN"] = safeRN;
        //        row["OptimumHCA"] = safeHCA;
        //        row["SafeRN"] = optimumRN;
        //        row["SafeHCA"] = optimumHCA;

        //        tempDate.AddDays(1);
        //        dataTable.Rows.Add(row);
        //    }


        //    using (SqlConnection dbConnection = GetConnection())
        //    {
        //        dbConnection.Open();
        //        using (SqlBulkCopy s = new SqlBulkCopy(dbConnection))
        //        {
        //            s.DestinationTableName = dataTable.TableName;

        //            foreach (var column in dataTable.Columns)
        //                s.ColumnMappings.Add(column.ToString(), column.ToString());

        //            s.WriteToServer(dataTable);
        //        }
        //    }
        //}

        //private DataTable GetDataTable()
        //{
        //    DataTable staffingData = new DataTable("StaffingData");

        //    // Create Column 1: StaffingDate
        //    DataColumn dateColumn = new DataColumn();
        //    dateColumn.DataType = Type.GetType("System.DateTime");
        //    dateColumn.ColumnName = "StaffingDate";

        //    // Create Column 2: OptimumRN
        //    DataColumn optimumRN = new DataColumn();
        //    optimumRN.DataType = Type.GetType("System.Int32");
        //    optimumRN.ColumnName = "OptimumRN";

        //    // Create Column 2: OptimumHCA
        //    DataColumn optimumHCA = new DataColumn();
        //    optimumHCA.DataType = Type.GetType("System.Int32");
        //    optimumHCA.ColumnName = "OptimumHCA";

        //    // Create Column 3: SafeRN
        //    DataColumn safeRN = new DataColumn();
        //    safeRN.DataType = Type.GetType("System.Int32");
        //    safeRN.ColumnName = "SafeRN";

        //    // Create Column 3: SafeHCA
        //    DataColumn safeHCA = new DataColumn();
        //    safeHCA.DataType = Type.GetType("System.Int32");
        //    safeHCA.ColumnName = "SafeHCA";

        //    staffingData.Columns.Add(dateColumn);
        //    staffingData.Columns.Add(optimumRN);
        //    staffingData.Columns.Add(optimumHCA);
        //    staffingData.Columns.Add(safeRN);
        //    staffingData.Columns.Add(safeHCA);

        //    return staffingData;
        //}
        #endregion
    }
}