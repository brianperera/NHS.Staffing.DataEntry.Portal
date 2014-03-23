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

            MessageLabel.Visible = false;
        }

        private void BindInitialData()
        {
            // Bind users to Grid.
            StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();

            //01/01/0001 00:00:00
            List<StaffingDateRange> staffingDateRanges = staffingDateRangeDA.GetAllStaffingDateRanges();

            PeriodData_Grid.DataSource = staffingDateRanges;
            PeriodData_Grid.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
            StaffingDateRange record = new StaffingDateRange();

            DateTime startDate;
            DateTime.TryParse(PeriodStartDate_TextBox.Text, out startDate);
            record.StartDate = startDate;

            DateTime endDate;
            DateTime.TryParse(PeriodEndDate_TextBox.Text, out endDate);
            record.EndDate = endDate;

            staffingDateRangeDA.AddStaffingDateRange(record);
            BindInitialData();
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

                if (cellText != null && cellText.Text.ToString() == "01/01/0001 00:00:00")
                {
                    cellText.Text = Constants.EndDateNotSpecified;
                }
            }
        }

        protected void DeleteButton_Click1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(PeriodIndex_TextBox.Text))
            {
                StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
                StaffingDateRange record = new StaffingDateRange();
                record.Index = int.Parse(PeriodIndex_TextBox.Text);

                bool executionStatus = staffingDateRangeDA.DeleteStaffingdateRange(record);
                DisplayMessage(executionStatus);
                BindInitialData();
            }
            else            
                DisplayMessage(false, "Specify the Period Index");

        }
    }
}