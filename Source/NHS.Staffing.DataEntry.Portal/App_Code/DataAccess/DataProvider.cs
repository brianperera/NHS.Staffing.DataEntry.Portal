using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DataProvider
/// </summary>
/// 
namespace Nhs.Staffing.DataEntry.Portal
{
    public class DataProvider
    {
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        private Object readLock = new Object();
        private Object writeLock = new Object();

        public DataProvider()
        {
            sqlConnection.Open();
        }

        public DataSet GetDataSet(string query)
        {
            SqlDataAdapter da = new SqlDataAdapter(query, sqlConnection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            return ds;
        }

        public void InsertValue(string query)
        {
            lock (writeLock)
            {
                SqlDataAdapter da = new SqlDataAdapter(query, sqlConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
        }

        public string[] FillDropDown(string query1, string query2)
        {
            int no_of_records = this.GetInt(query1);
            string[] arr = new string[no_of_records];
            int i = 0;

            SqlCommand comm = new SqlCommand(query2, sqlConnection);
            SqlDataReader reader = comm.ExecuteReader();

            while (reader.Read())
            {
                string id = reader.GetString(1);
                arr[i] = id;
                i++;
            }
            reader.Close();
            return arr;
        }

        public SqlDataReader GetDr(string query)
        {

            SqlCommand comm1 = new SqlCommand(query, sqlConnection);
            SqlDataReader reader1 = comm1.ExecuteReader();
            return reader1;
        }

        public int GetInt(string query1)
        {
            int count = 0;

            SqlCommand comm1 = new SqlCommand(query1, sqlConnection);
            SqlDataReader reader1 = comm1.ExecuteReader();

            while (reader1.Read())
            {
                count = reader1.GetInt32(0);
            }

            reader1.Close();
            return count;
        }

        public DateTime GetDate(string query1)
        {
            SqlCommand comm = new SqlCommand(query1, sqlConnection);
            SqlDataReader reader = comm.ExecuteReader();
            DateTime id;
            reader.Read();

            id = reader.GetDateTime(0);

            reader.Close();
            return id;
        }

        public string GetString(string query1)
        {
            lock (readLock)
            {
                SqlCommand comm = new SqlCommand(query1, sqlConnection);
                SqlDataReader reader = comm.ExecuteReader();
                string id;
                reader.Read();

                id = reader.GetString(0);

                reader.Close();
                return id;
            }
        }

        public double GetDouble(string query1)
        {
            SqlCommand comm = new SqlCommand(query1, sqlConnection);
            SqlDataReader reader = comm.ExecuteReader();
            double id;
            reader.Read();

            id = reader.GetDouble(0);

            reader.Close();
            return id;
        }
    }
}
