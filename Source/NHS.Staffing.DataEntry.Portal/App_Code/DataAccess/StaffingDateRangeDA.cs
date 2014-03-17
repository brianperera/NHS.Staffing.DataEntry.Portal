using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhs.Staffing.DataEntry;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for StaffingDateRangeDA
/// </summary>
public class StaffingDateRangeDA : DataAccessBase
{
    public List<StaffingDateRange> GetAllStaffingDateRanges()
    {
        List<StaffingDateRange> data = new List<StaffingDateRange>();

        using (SqlConnection con = GetConnection())
        {
            con.Open();

            SqlCommand command = new SqlCommand("GetAllWards", con);
            command.CommandType = CommandType.StoredProcedure;

            var results = command.ExecuteReader();

            if (results.HasRows)
            {
                StaffingDateRange staffingDateRange;
                int tempInt;
                DateTime date;

                while (results.Read())
                {
                    staffingDateRange = new StaffingDateRange();

                    if (int.TryParse(results["StaffingDateIndex"].ToString(), out tempInt))
                        staffingDateRange.Index = tempInt;
                    if (DateTime.TryParse(results["StartDate"].ToString(), out date))
                        staffingDateRange.StartDate = date;
                    if (DateTime.TryParse(results["EndDate"].ToString(), out date))
                        staffingDateRange.EndDate = date;


                    data.Add(staffingDateRange);
                }
            }
        }

        return data;
    }

    public void AddStaffingDateRange(StaffingDateRange record)
    {
        AddOrUpdateStaffingDateRange(record, "InsertStaffingDateRange");
    }

    public void UpdateStaffingDateRange(StaffingDateRange record)
    {
        AddOrUpdateStaffingDateRange(record, "UpdateStaffingDateRange");
    }

    public void AddOrUpdateStaffingDateRange(StaffingDateRange record, string sp)
    {
        using (SqlConnection con = GetConnection())
        {
            con.Open();

            SqlCommand command = new SqlCommand(sp, con);
            command.CommandType = CommandType.StoredProcedure;

            SqlParameter StartDate = GetParameter("@StartDate", SqlDbType.Date, record.StartDate);
            SqlParameter EndDate = GetParameter("@EndDate", SqlDbType.Date, record.EndDate);

            if (record.Index > 0)
            {
                //Update
                SqlParameter Index = GetParameter("@StaffingDateIndex", SqlDbType.Int, record.Index);
                command.Parameters.Add(Index);
            }

            command.Parameters.Add(StartDate);
            command.Parameters.Add(EndDate);

            var results = command.ExecuteNonQuery();
        }
    }

    public void DeleteWard(StaffingDateRange record)
    {
        using (SqlConnection con = GetConnection())
        {
            con.Open();

            SqlCommand command = new SqlCommand("DeletStaffingDateRangeByIndex", con);
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter Index = GetParameter("@StaffingDateIndex", SqlDbType.Int, record.Index);
            command.Parameters.Add(Index);

            var results = command.ExecuteNonQuery();
        }
    }

	public StaffingDateRangeDA()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}