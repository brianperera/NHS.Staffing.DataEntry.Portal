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
                        ward.Division = results["Division"].ToString();
                        int.TryParse(results["Beds"].ToString(), out tempInt);
                        ward.NoOfBeds = tempInt;

                        allWards.Add(ward);
                    }
                }
            }

            return allWards;
        }

        public bool AddWard(Ward record)
        {
            return AddOrUpdateWard(record, "InsertWard");
        }

        public bool UpdateWard(Ward record)
        {
            return AddOrUpdateWard(record, "UpdateWard");
        }

        public bool AddOrUpdateWard(Ward record,string sp)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(sp, con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter wardCode = GetParameter("@WardCode", SqlDbType.VarChar, record.WardCode);
                SqlParameter name = GetParameter("@WardName", SqlDbType.VarChar, record.WardName);
                SqlParameter beds = GetParameter("@Beds", SqlDbType.Int, record.NoOfBeds);
                SqlParameter division = GetParameter("@Division", SqlDbType.Int, record.NoOfBeds);

                command.Parameters.Add(wardCode);
                command.Parameters.Add(name);
                command.Parameters.Add(beds);
                command.Parameters.Add(division);

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
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