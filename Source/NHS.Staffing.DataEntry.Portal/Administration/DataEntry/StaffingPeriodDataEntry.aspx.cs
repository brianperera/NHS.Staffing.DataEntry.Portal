﻿using System;
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

        public string ActionType
        {
            get
            {
                string actionType = Constants.Create;

                if (Request.QueryString["action"] != null)
                    actionType = Request.QueryString["action"];

                return actionType;
            }
        }

        public string ID
        {
            get
            {
                string id = string.Empty;

                if (Request.QueryString["id"] != null)
                    id = Request.QueryString["id"];

                return id;
            }
        }

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
            bool updateStatus = false;

            if (ActionType == Constants.Update && !string.IsNullOrEmpty(ID))
            {
                //update
                int currentPeriodIndex = 0;
                int.TryParse(ID, out currentPeriodIndex);

                if (currentPeriodIndex > 0)
                {
                    record.Index = currentPeriodIndex;
                    updateStatus = staffingDateRangeDA.UpdateStaffingDateRange(record);
                }
            }
            else
            {
                //add
                updateStatus = staffingDateRangeDA.AddStaffingDateRange(record);
            }

            DisplayMessage(updateStatus);
            ClearFields();
        }

        private void ClearFields()
        {
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

        public List<StaffingDateRange> StaffingDateRanges
        {
            get
            {
                return staffingDateRangeDA.GetAllStaffingDateRanges();
            }
        }
    }
}