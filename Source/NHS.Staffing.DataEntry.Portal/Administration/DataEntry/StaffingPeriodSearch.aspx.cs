using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class StaffingPeriodSearch : System.Web.UI.Page
    {
        // Bind users to Grid.
        StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindInitialData();

            MessageLabel.Visible = false;
        }

        private void BindInitialData()
        {
            PeriodData_Grid.DataSource = StaffingDateRanges;
            PeriodData_Grid.DataBind();
        }

        private void ClearFields()
        {

        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Visible = true;
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }

        private void DisplayMessage(bool executionStatus, string message)
        {
            MessageLabel.Visible = true;
            MessageLabel.Text = message;
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }

        protected void PeriodData_Grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
            {
                var cellText = e.Row.Cells[2];

                if (cellText != null && cellText.Text.ToString() == string.Format(ConfigurationManager.AppSettings["DateTimeFormat"], DateTime.MinValue))
                {
                    cellText.Text = Constants.EndDateNotSpecified;
                }
            }
        }        

        public List<StaffingDateRange> StaffingDateRanges
        {
            get
            {
                return staffingDateRangeDA.GetAllStaffingDateRanges();
            }
        }

        
    }
}