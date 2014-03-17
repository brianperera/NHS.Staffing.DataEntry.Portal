using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class WardLookUpDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }

            //TODO: Adding dummy values
            DataTable userTable = new DataTable();
            userTable.Columns.Add("WardCode", typeof(string));
            userTable.Columns.Add("Devision", typeof(string));
            userTable.Columns.Add("WardDescription", typeof(string));

            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");
            userTable.Rows.Add("Code1", "Devision1", "WardDescription");

            // Bind users to Grid.
            WardData_Grid.DataSource = userTable;
            WardData_Grid.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            
        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }
    }
}