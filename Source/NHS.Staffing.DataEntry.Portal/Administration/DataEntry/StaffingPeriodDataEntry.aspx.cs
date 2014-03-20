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
            // Bind users to Grid.
            StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
            PeriodData_Grid.DataSource = staffingDateRangeDA.GetAllStaffingDateRanges();
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
        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }
    }
}