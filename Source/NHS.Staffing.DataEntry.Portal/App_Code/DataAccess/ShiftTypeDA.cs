using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for ShiftTypeDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class ShiftTypeDA : DataAccessBase, IShiftTypeDA
    {
        public ShiftTypeDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public IList<ShiftType> GetAllShiftType()
        {
            List<ShiftType> allShiftTypes = new List<ShiftType>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllShiftTypes", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    ShiftType shiftType;
                    int tempInt;

                    while (results.Read())
                    {
                        shiftType = new ShiftType();

                        shiftType.Name = results["Name"].ToString();

                        int.TryParse(results["ShiftID"].ToString(), out tempInt);
                        shiftType.ShiftID = tempInt;

                        allShiftTypes.Add(shiftType);
                    }
                }
            }

            return allShiftTypes;
        }

        public void AddShiftType(ShiftType record)
        {
            AddOrUpdateShiftType(record, "InsertShiftTypes");
        }

        public void UpdateShiftType(ShiftType record)
        {
            AddOrUpdateShiftType(record, "UpdateShiftType");
        }

        public void AddOrUpdateShiftType(ShiftType record, string sp)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(sp, con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter shiftID = GetParameter("@ShiftID", SqlDbType.Int, record.ShiftID);
                SqlParameter name = GetParameter("@Name", SqlDbType.VarChar, record.Name);

                command.Parameters.Add(shiftID);
                command.Parameters.Add(name);

                var results = command.ExecuteNonQuery();
            }
        }

        public void DeleteShiftType(ShiftType record)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("DeleteShiftType", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter shiftID = GetParameter("@ShiftID", SqlDbType.Int, record.ShiftID);

                command.Parameters.Add(shiftID);

                var results = command.ExecuteNonQuery();
            }
        }
    }
}