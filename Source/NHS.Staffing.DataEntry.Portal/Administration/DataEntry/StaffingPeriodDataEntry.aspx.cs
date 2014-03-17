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
    public partial class StaffingPeriodDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindInitialData();

            if (!IsPostBack)
            {
                PeriodStartDate_TextBox.Attributes.Add("readonly", "readonly");
                PeriodEndDate_TextBox.Attributes.Add("readonly", "readonly");
            }
        }

        private void BindInitialData()
        {
            //TODO: Adding dummy values
            DataTable userTable = new DataTable();
            userTable.Columns.Add("StartDate", typeof(DateTime));
            userTable.Columns.Add("EndDate", typeof(DateTime));

            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(7));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(6));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(5));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4));

            // Bind users to Grid.
            PeriodData_Grid.DataSource = userTable;
            PeriodData_Grid.DataBind();
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