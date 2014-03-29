using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Globalization;
using System.Configuration;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class StaffingDataSearch : System.Web.UI.Page
    {
        IList<Ward> currentWards = null;
        StaffingDataDA staffingDataDA = new StaffingDataDA();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDataGrid();
            }

            MessageLabel.Visible = false;
        }

        private void PopulateDataGrid()
        {
            // Bind users to Grid.

            List<StaffingData> staffingData = staffingDataDA.GetAllStaffing();

            //Populate the ward name
            foreach (var item in staffingData)
            {
                item.WardName = staffingDataDA.GetWardNameByWardCode(item.WardCode);
            }

            // Select rows which has WardName, ignore the rest
            List<StaffingData> staffingDataToDisplay = staffingData.Where(data => data.WardName != string.Empty).ToList();

            if (null != staffingDataToDisplay)
            {
                StaffingData_Grid.DataSource = staffingDataToDisplay;
                StaffingData_Grid.DataBind();

                BindWardNames(staffingDataToDisplay);
                BindShifts(staffingDataToDisplay);
                BindDays();

                InsertDropdownDefaultValue();
            }
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

        private void ClearFields()
        {

        }

        protected void StaffingData_Grid_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            FilterDataGrid();
        }

        private void BindWardNames(IList<StaffingData> staffingData)
        {
            List<string> wardNames = staffingData.Select(data => data.WardName).Distinct().ToList();

            if (null != wardNames)
            {
                WardName_DropDownList.DataSource = wardNames;
                WardName_DropDownList.DataBind();
            }
        }

        private void BindShifts(IList<StaffingData> staffingData)
        {
            List<string> shifts = staffingData.Select(data => data.Shift).Distinct().ToList();

            if (null != shifts)
            {
                Shift_DropDownList.DataSource = shifts;
                Shift_DropDownList.DataBind();
            }
        }

        private void BindDays()
        {
            List<string> daysOfWeek = new List<string>();
            daysOfWeek.Add(DayOfWeek.Monday.ToString());
            daysOfWeek.Add(DayOfWeek.Tuesday.ToString());
            daysOfWeek.Add(DayOfWeek.Wednesday.ToString());
            daysOfWeek.Add(DayOfWeek.Thursday.ToString());
            daysOfWeek.Add(DayOfWeek.Friday.ToString());
            daysOfWeek.Add(DayOfWeek.Saturday.ToString());
            daysOfWeek.Add(DayOfWeek.Sunday.ToString());

            Day_DropDownList.DataSource = daysOfWeek;
            Day_DropDownList.DataBind();
        }

        private void InsertDropdownDefaultValue()
        {
            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["DropDownAllText"]))
            {
                ListItem defaultItem = new ListItem(ConfigurationManager.AppSettings["DropDownAllText"]);

                WardName_DropDownList.Items.Insert(0, defaultItem);
                Shift_DropDownList.Items.Insert(0, defaultItem);
                Day_DropDownList.Items.Insert(0, defaultItem);
            }
        }

        private void FilterDataGrid()
        {
            // Bind users to Grid.

            List<StaffingData> staffingData = staffingDataDA.GetAllStaffing();

            //Populate the ward name
            foreach (var item in staffingData)
            {
                item.WardName = staffingDataDA.GetWardNameByWardCode(item.WardCode);
            }

            // Select rows which has WardName, ignore the rest
            List<StaffingData> staffingDataToDisplay = staffingData.Where(data => data.WardName != string.Empty).ToList();

            // Filter data
            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["DropDownAllText"]))
            {
                // Filter by Ward Name
                if (!WardName_DropDownList.SelectedValue.Equals(ConfigurationManager.AppSettings["DropDownAllText"]))
                {
                    staffingDataToDisplay = staffingDataToDisplay.Where(data
                                            => data.WardName.Equals(WardName_DropDownList.SelectedValue)).ToList();
                }

                // FIlter by Shift
                if (!Shift_DropDownList.SelectedValue.Equals(ConfigurationManager.AppSettings["DropDownAllText"]))
                {
                    staffingDataToDisplay = staffingDataToDisplay.Where(data
                                            => data.Shift.Equals(Shift_DropDownList.SelectedValue)).ToList();
                }

                // Filter by Day
                if (!Day_DropDownList.SelectedValue.Equals(ConfigurationManager.AppSettings["DropDownAllText"]))
                {
                    staffingDataToDisplay = staffingDataToDisplay.Where(data
                                            => data.StaffingDate.Equals(Day_DropDownList.SelectedValue)).ToList();
                }
            }


            if (null != staffingDataToDisplay)
            {
                StaffingData_Grid.DataSource = staffingDataToDisplay;
                StaffingData_Grid.DataBind();
            }
        }

        protected void StaffingData_Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            StaffingData_Grid.PageIndex = e.NewPageIndex;
            FilterDataGrid();
        }

    }
}