﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DataAccessBase
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class DataAccessBase
    {
        string ConnectionString;

        public DataAccessBase()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["NHSDB"].ConnectionString;
        }

        internal SqlConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        internal SqlParameter GetParameter(string parameterName, SqlDbType sqlDbType,object value)
        {
            SqlParameter parameter = new SqlParameter();

            parameter.Direction = ParameterDirection.Input;
            parameter.ParameterName = parameterName;
            parameter.SqlDbType = sqlDbType;
            parameter.Value = value;

            return parameter;
        }
    }
}