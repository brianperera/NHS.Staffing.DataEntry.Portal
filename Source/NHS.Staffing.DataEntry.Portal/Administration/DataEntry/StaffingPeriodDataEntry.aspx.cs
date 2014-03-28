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
    public partial class StaffingPeriodDataEntry : System.Web.UI.Page
    {
        // Bind users to Grid.
        StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();

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
            PeriodData_Grid.DataSource = StaffingDateRanges;
            PeriodData_Grid.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            StaffingDateRange record = new StaffingDateRange();

            DateTime startDate;
            DateTime.TryParse(PeriodStartDate_TextBox.Text, out startDate);
            record.StartDate = startDate;

            DateTime endDate;
            DateTime.TryParse(PeriodEndDate_TextBox.Text, out endDate);
            record.EndDate = endDate;

            if (PeriodEntryFound_HiddenField.Text == "true")
            {
                //update
                int currentPeriodIndex = 0;
                int.TryParse(PeriodIndex_TextBox.Text, out currentPeriodIndex);

                if (currentPeriodIndex > 0)
                {
                    record.Index = currentPeriodIndex;
                    staffingDateRangeDA.UpdateStaffingDateRange(record);
                }
            }
            else
            {
                //add
                staffingDateRangeDA.AddStaffingDateRange(record);
            }

            ClearFields();
            
            BindInitialData();
        }

        private void ClearFields()
        {
            PeriodIndex_TextBox.Text = string.Empty;
            PeriodStartDate_TextBox.Text = string.Empty;
            PeriodEndDate_TextBox.Text = string.Empty;
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

        protected void DeleteButton_Click1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(PeriodIndex_TextBox.Text))
            {
                StaffingDateRange record = new StaffingDateRange();
                record.Index = int.Parse(PeriodIndex_TextBox.Text);

                bool executionStatus = staffingDateRangeDA.DeleteStaffingdateRange(record);
                DisplayMessage(executionStatus);
                ClearFields();
                BindInitialData();
            }
            else
                DisplayMessage(false, "Specify the Period Index");

        }

        protected void PeriodIndex_TextBox_TextChanged(object sender, EventArgs e)
        {

            int currentPeriodIndex = 0;

            int.TryParse(PeriodIndex_TextBox.Text, out currentPeriodIndex);

            if (currentPeriodIndex > 0)
            {
                var currentPeriodDataitem = (from p in StaffingDateRanges
                                             where p.Index == currentPeriodIndex
                                             select p).SingleOrDefault();

                PeriodStartDate_TextBox.Text = currentPeriodDataitem.StartDate.ToShortDateString();
                PeriodEndDate_TextBox.Text = currentPeriodDataitem.EndDate.ToShortDateString();
                DeleteButton.Enabled = true;
                PeriodEntryFound_HiddenField.Text = "true";
            }
            else
            {
                PeriodStartDate_TextBox.Text = string.Empty;
                PeriodEndDate_TextBox.Text = string.Empty;
                PeriodEntryFound_HiddenField.Text = "false";
            }
        }

        public List<StaffingDateRange> StaffingDateRanges
        {
            get
            {
                return staffingDateRangeDA.GetAllStaffingDateRanges();
            }
        }

        protected void EndDateUnknownCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (EndDateUnknownCheckBox.Checked)
            {
                PeriodEndDate_TextBox.Text = string.Empty;
            }
        }
    }
}