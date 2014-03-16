using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for WardDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class WardDA : DataAccessBase
    {
        public WardDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public IList<Ward> GetAllWard()
        {
            List<Ward> allWards = new List<Ward>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllWards", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    Ward ward;
                    int tempInt;

                    while (results.Read())
                    {
                        ward = new Ward();
                        ward.WardCode = results["WardCode"].ToString();
                        ward.WardName = results["WardName"].ToString();

                        int.TryParse(results["Beds"].ToString(), out tempInt);
                        ward.NoOfBeds = tempInt;

                        allWards.Add(ward);
                    }
                }
            }

            return allWards;
        }

        public void AddWard(Ward record)
        {
            AddOrUpdateWard(record, "InsertWard");
        }

        public void UpdateWard(Ward record)
        {
            AddOrUpdateWard(record, "UpdateWard");
        }

        public void AddOrUpdateWard(Ward record,string sp)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(sp, con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter wardCode = GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode);
                SqlParameter name = GetParameter("@WardName", SqlDbType.VarChar, record.WardName);
                SqlParameter beds = GetParameter("@Beds", SqlDbType.Int, record.NoOfBeds);

                command.Parameters.Add(wardCode);
                command.Parameters.Add(name);
                command.Parameters.Add(beds);

                var results = command.ExecuteNonQuery();
            }
        }

        public void DeleteWard(Ward record)
        {
            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("DeleteWard", con);
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter wardCode = GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode);
                command.Parameters.Add(wardCode);

                var results = command.ExecuteNonQuery();
            }
        }
    }
}