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
    public class MitigationActionsDA : DataAccessBase, IMitigationActionsDA
    {
        public MitigationActionsDA()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public List<string> GetAllMitigationActions()
        {
            List<string> allMitigationActions = new List<string>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetSafeMitigationActions", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    while (results.Read())
                    {
                        string currentAction = string.Empty;

                        currentAction = results["Action"].ToString();
                        allMitigationActions.Add(currentAction);
                    }
                }
            }

            return allMitigationActions;
        }

        public bool AddMitigationAction(string record)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("InsertSafeMitigationActions", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter action = GetParameter("@Action", SqlDbType.VarChar, record);
                command.Parameters.Add(action);

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }

        public bool UpdateMitigationAction(string oldActionName, string newActionName)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("UpdateSafeMitigationActions", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter actionName1 = GetParameter("@OldAction", SqlDbType.VarChar, oldActionName);
                SqlParameter actionName2 = GetParameter("@Action", SqlDbType.VarChar, newActionName);
                command.Parameters.Add(actionName1);
                command.Parameters.Add(actionName2);

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }

        public bool DeleteMitigationAction(string action)
        {
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("DeleteSafeMitigationAction", con);
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter sqlParameter = GetParameter("@Action", SqlDbType.VarChar, action);
                command.Parameters.Add(sqlParameter);

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }

        public bool AddOrUpdateMitigationAction(string record, string spName)
        { 
            bool isAddedOrUpdatedSuccessfully = false;

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand(spName, con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter action = GetParameter("@Action", SqlDbType.VarChar, record);
                command.Parameters.Add(action);

                var results = command.ExecuteNonQuery();

                if (results > -1)
                    isAddedOrUpdatedSuccessfully = true;
            }

            return isAddedOrUpdatedSuccessfully;
        }
    }
}