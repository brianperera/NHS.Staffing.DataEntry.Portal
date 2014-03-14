using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhs.Staffing.DataEntry;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for ShiftRecordDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class ShiftRecordDA : DataAccessBase ,IShiftRecordDA
    {
        public IList<ShiftRecord> GetShiftRecordsForDate(DateTime startDate, DateTime endDate)
        {
            List<ShiftRecord> shifts = new List<ShiftRecord>();
            ShiftRecord shift;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetShiftDetailByDate", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter sDate = GetParameter("@StartDate", SqlDbType.Date, startDate); 
                SqlParameter eDate = GetParameter("@EndDate", SqlDbType.Date, endDate); 

                command.Parameters.Add(sDate);
                command.Parameters.Add(eDate);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    int tempInt;
                    DateTime tempDate;
                    bool tempBool;

                    while (results.Read())
                    {
                        shift = new ShiftRecord();

                        shift.WardCode = results["WardCode"].ToString();

                        DateTime.TryParse(results["ShiftDate"].ToString(), out tempDate);
                        shift.Date = tempDate;

                        int.TryParse(results["ShiftID"].ToString(), out tempInt);
                        shift.ShiftID = tempInt;

                        int.TryParse(results["Beds"].ToString(), out tempInt);
                        shift.Beds = tempInt;

                        int.TryParse(results["OptimumStaffingRN"].ToString(), out tempInt);
                        shift.OptimumStaffingRN = tempInt;
                        int.TryParse(results["OptimumStaffingHCA"].ToString(), out tempInt);
                        shift.OptimumStaffingHCA = tempInt;
                        int.TryParse(results["SafeStaffingRN"].ToString(), out tempInt);
                        shift.SafeStaffingRN = tempInt;
                        int.TryParse(results["SafeStaffingHCA"].ToString(), out tempInt);
                        shift.SafeStaffingHCA = tempInt;
                        int.TryParse(results["TodayTrustRN"].ToString(), out tempInt);
                        shift.TodayTrustRN = tempInt;
                        int.TryParse(results["TodayTrustHCA"].ToString(), out tempInt);
                        shift.TodayTrustHCA = tempInt;
                        int.TryParse(results["TodayBankRN"].ToString(), out tempInt);
                        shift.TodayBankRN = tempInt;
                        int.TryParse(results["TodayBankHCA"].ToString(), out tempInt);
                        shift.TodayBankHCA = tempInt;
                        int.TryParse(results["TodayNonTrustRN"].ToString(), out tempInt);
                        shift.TodayNonTrustRN = tempInt;
                        int.TryParse(results["TodayNonTrustHCA"].ToString(), out tempInt);
                        shift.TodayNonTrustHCA = tempInt;

                        shift.DataEntryBy = results["DataEntryBy"].ToString();

                        bool.TryParse(results["IsSafe"].ToString(), out tempBool);
                        shift.IsSafe = tempBool;

                        shift.UnSafeMitigation = results["UnSafeMitigation"].ToString();
                        shift.SafeMitigation = results["SafeMitigation"].ToString();


                        shifts.Add(shift);
                    }
                }
                else
                    results.Close();
            }

            return shifts;
        }

        public bool AddShiftRecord(ShiftRecord record)
        {
            return AddOrUpdateRecord(record, "InsertShiftDetailRecord");
        }

        public bool UpdateShiftRecord(ShiftRecord record)
        {
            return AddOrUpdateRecord(record, "UpdateShiftDetailRecord");
        }

        private bool AddOrUpdateRecord(ShiftRecord record, string sp)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(sp, con);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode));
                command.Parameters.Add(GetParameter("@ShiftDate", SqlDbType.VarChar, record.Date));
                command.Parameters.Add(GetParameter("@ShiftID", SqlDbType.VarChar, record.ShiftID));
                command.Parameters.Add(GetParameter("@Beds", SqlDbType.VarChar, record.Beds));
                command.Parameters.Add(GetParameter("@OptimumStaffingRN ", SqlDbType.VarChar, record.OptimumStaffingRN));
                command.Parameters.Add(GetParameter("@OptimumStaffingHCA", SqlDbType.VarChar, record.OptimumStaffingHCA));

                command.Parameters.Add(GetParameter("@SafeStaffingRN", SqlDbType.VarChar, record.SafeStaffingRN));
                command.Parameters.Add(GetParameter("@SafeStaffingHCA", SqlDbType.VarChar, record.SafeStaffingHCA));
                command.Parameters.Add(GetParameter("@TodayTrustRN", SqlDbType.VarChar, record.TodayTrustRN));
                command.Parameters.Add(GetParameter("@TodayTrustHCA", SqlDbType.VarChar, record.TodayTrustHCA));
                command.Parameters.Add(GetParameter("@TodayBankRN", SqlDbType.VarChar, record.TodayBankRN));
                command.Parameters.Add(GetParameter("@TodayBankHCA", SqlDbType.VarChar, record.TodayBankHCA));

                command.Parameters.Add(GetParameter("@TodayNonTrustRN", SqlDbType.VarChar, record.TodayNonTrustRN));
                command.Parameters.Add(GetParameter("@TodayNonTrustHCA", SqlDbType.VarChar, record.TodayNonTrustHCA));
                command.Parameters.Add(GetParameter("@DataEntryBy", SqlDbType.VarChar, record.DataEntryBy));
                command.Parameters.Add(GetParameter("@IsSafe", SqlDbType.VarChar, record.IsSafe));
                command.Parameters.Add(GetParameter("@UnSafeMitigation", SqlDbType.VarChar, record.UnSafeMitigation));
                command.Parameters.Add(GetParameter("@SafeMitigation", SqlDbType.VarChar, record.SafeMitigation));

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }

        public bool DeleteShiftRecord(ShiftRecord record)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("DeleteShiftDetailRecord", con);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode));
                command.Parameters.Add(GetParameter("@ShiftDate", SqlDbType.VarChar, record.Date));
                command.Parameters.Add(GetParameter("@ShiftID", SqlDbType.VarChar, record.ShiftID));

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }

        //@ShiftID
        public ShiftRecord GetShiftRecord(DateTime date,string wardCode,int shiftID)
        {
            ShiftRecord shift = new ShiftRecord();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetShiftDetailByCodeDataShiftID", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter ward = GetParameter("@WardCode", SqlDbType.VarChar, wardCode);
                SqlParameter recordDate = GetParameter("@ShiftDate", SqlDbType.Date, date);
                SqlParameter sID = GetParameter("@ShiftID", SqlDbType.VarChar, shiftID);

                command.Parameters.Add(ward);
                command.Parameters.Add(recordDate);
                command.Parameters.Add(sID);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    int tempInt;
                    DateTime tempDate;
                    bool tempBool;

                    while (results.Read())
                    {
                        shift.WardCode = results["WardCode"].ToString();

                        DateTime.TryParse(results["ShiftDate"].ToString(), out tempDate);
                        shift.Date = tempDate;

                        int.TryParse(results["ShiftID"].ToString(), out tempInt);
                        shift.ShiftID = tempInt;

                        int.TryParse(results["Beds"].ToString(), out tempInt);
                        shift.Beds = tempInt;

                        int.TryParse(results["OptimumStaffingRN"].ToString(), out tempInt);
                        shift.OptimumStaffingRN = tempInt;
                        int.TryParse(results["OptimumStaffingHCA"].ToString(), out tempInt);
                        shift.OptimumStaffingHCA = tempInt;
                        int.TryParse(results["SafeStaffingRN"].ToString(), out tempInt);
                        shift.SafeStaffingRN = tempInt;
                        int.TryParse(results["SafeStaffingHCA"].ToString(), out tempInt);
                        shift.SafeStaffingHCA = tempInt;
                        int.TryParse(results["TodayTrustRN"].ToString(), out tempInt);
                        shift.TodayTrustRN = tempInt;
                        int.TryParse(results["TodayTrustHCA"].ToString(), out tempInt);
                        shift.TodayTrustHCA = tempInt;
                        int.TryParse(results["TodayBankRN"].ToString(), out tempInt);
                        shift.TodayBankRN = tempInt;
                        int.TryParse(results["TodayBankHCA"].ToString(), out tempInt);
                        shift.TodayBankHCA = tempInt;
                        int.TryParse(results["TodayNonTrustRN"].ToString(), out tempInt);
                        shift.TodayNonTrustRN = tempInt;
                        int.TryParse(results["TodayNonTrustHCA"].ToString(), out tempInt);
                        shift.TodayNonTrustHCA = tempInt;

                        shift.DataEntryBy = results["DataEntryBy"].ToString();

                        bool.TryParse(results["IsSafe"].ToString(), out tempBool);
                        shift.IsSafe = tempBool;

                        shift.UnSafeMitigation = results["UnSafeMitigation"].ToString();
                        shift.SafeMitigation = results["SafeMitigation"].ToString();
                    }
                }
                else
                    results.Close();
            }

            return shift;
        }
    }
}