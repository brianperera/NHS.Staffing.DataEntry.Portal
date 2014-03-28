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
    public partial class StaffingDataEntry : System.Web.UI.Page
    {
        IList<Ward> currentWards = null;
        StaffingDataDA staffingDataDA = new StaffingDataDA();

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateDataGrid();

            if (!IsPostBack)
            {
                StaffingDataEntryFound_HiddenField.Text = "false";

                BindInitialData();

                LoadDataForUpdate();
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

            StaffingData_Grid.DataSource = staffingData;
            StaffingData_Grid.DataBind();
        }

        private void BindInitialData()
        {
            StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
            List<StaffingDateRange> staffingDates = staffingDateRangeDA.GetAllStaffingDateRanges();

            currentWards = DataRepository.Instance.AllWards;
            WardName_DropDownList.DataSource = currentWards;
            WardName_DropDownList.DataTextField = "WardName";
            WardName_DropDownList.DataValueField = "WardCode";
            WardName_DropDownList.DataBind();

            //Modify the date range text
            foreach (StaffingDateRange staffingDate in staffingDates)
            {
                string startDate = staffingDate.StartDate.ToShortDateString();
                string endDate = staffingDate.EndDate.ToShortDateString();

                if (endDate == "01/01/0001")
                    endDate = Constants.EndDateNotSpecified;

                staffingDate.DisplayPeriod = string.Format("{0} to {1}", startDate, endDate);
            }

            DatePeriodRange_DropDownList.DataSource = staffingDates;
            DatePeriodRange_DropDownList.DataTextField = "DisplayPeriod";
            DatePeriodRange_DropDownList.DataValueField = "Index";
            DatePeriodRange_DropDownList.DataBind();

            Shift_DropDownList.DataSource = DataRepository.Instance.AllShiftTypes;
            Shift_DropDownList.DataTextField = "Name";
            Shift_DropDownList.DataValueField = "ShiftID";
            Shift_DropDownList.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            bool executionStatus = false;
            StaffingData staffingData = new StaffingData();

            staffingData.WardCode = WardName_DropDownList.SelectedItem.Value;
            staffingData.Shift = Shift_DropDownList.SelectedItem.Text;
            staffingData.StaffingDate = Day_DropDownList.SelectedItem.Text;

            //Shift ID
            int shid;
            int.TryParse(Shift_DropDownList.SelectedItem.Value, out shid);
            staffingData.ShiftID = shid;

            //Staffing date range index
            int sdri;
            int.TryParse(DatePeriodRange_DropDownList.SelectedItem.Value, out sdri);
            staffingData.StaffingDateRangeIndex = sdri;

            //Beds
            int beds;
            int.TryParse(Beds_TextBox.Text, out beds);
            staffingData.Beds = beds;

            //RN Optimum Staffing
            int rnos;
            int.TryParse(RN_OptimumStaffing_TextBox.Text, out rnos);
            staffingData.OptimumRN = rnos;

            //HCA Optimum Staffing
            int hcaos;
            int.TryParse(HCA_OptimumStaffing_TextBox.Text, out hcaos);
            staffingData.OptimumHCA = hcaos;

            //RN Safe Staffing
            int rnss;
            int.TryParse(RN_SafeStaffing_TextBox.Text, out rnss);
            staffingData.SafeRN = rnss;

            //HCA Safe Staffing
            int hcass;
            int.TryParse(HCA_SafeStaffing_TextBox.Text, out hcass);
            staffingData.SafeHCA = hcass;

            if (StaffingDataEntryFound_HiddenField.Text.Equals("true"))
            {
                //update
                executionStatus = staffingDataDA.UpdateStaffingData(staffingData);
                PopulateDataGrid();
            }
            else
            {
                //add
                executionStatus = staffingDataDA.AddStaffingData(staffingData);
                PopulateDataGrid();
            }

            DisplayMessage(executionStatus);
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

        protected void WardName_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        protected void Shift_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        protected void Day_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        protected void DatePeriodRange_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        private void LoadDataForUpdate()
        {
            List<StaffingData> staffingData = new List<StaffingData>();

            staffingData = staffingDataDA.GetAllStaffing();

            //Staffing date range index
            int sdri;
            int.TryParse(DatePeriodRange_DropDownList.SelectedItem.Value, out sdri);

            foreach (var staffingDataItem in staffingData)
            {
                if (staffingDataItem.WardCode == WardName_DropDownList.SelectedItem.Value &&
                    staffingDataItem.Shift == Shift_DropDownList.SelectedItem.Text &&
                    staffingDataItem.StaffingDate == Day_DropDownList.SelectedItem.Text &&
                    staffingDataItem.StaffingDateRangeIndex == sdri)
                {
                    //populate the data for update
                    Beds_TextBox.Text = staffingDataItem.Beds.ToString(CultureInfo.InstalledUICulture);
                    RN_OptimumStaffing_TextBox.Text = staffingDataItem.OptimumRN.ToString(CultureInfo.InstalledUICulture);
                    HCA_OptimumStaffing_TextBox.Text = staffingDataItem.OptimumHCA.ToString(CultureInfo.InstalledUICulture);
                    RN_SafeStaffing_TextBox.Text = staffingDataItem.SafeRN.ToString(CultureInfo.InstalledUICulture);
                    HCA_SafeStaffing_TextBox.Text = staffingDataItem.SafeHCA.ToString(CultureInfo.InstalledUICulture);

                    StaffingDataEntryFound_HiddenField.Text = "true";
                    DeleteButton.Enabled = true;
                    break;
                }
                else
                {
                    ClearFields();
                }
            }
        }

        private void ClearFields()
        {
            //populate the data for update
            Beds_TextBox.Text = string.Empty;
            RN_OptimumStaffing_TextBox.Text = string.Empty;
            HCA_OptimumStaffing_TextBox.Text = string.Empty;
            RN_SafeStaffing_TextBox.Text = string.Empty;
            HCA_SafeStaffing_TextBox.Text = string.Empty;

            StaffingDataEntryFound_HiddenField.Text = "false";
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            StaffingData staffingData = new StaffingData();
            staffingData.WardCode = WardName_DropDownList.SelectedItem.Value;
            staffingData.Shift = Shift_DropDownList.SelectedItem.Text;
            staffingData.StaffingDate = Day_DropDownList.SelectedItem.Value;

            int staffingPeriodIndex = 0;
            int.TryParse(DatePeriodRange_DropDownList.SelectedItem.Value, out staffingPeriodIndex);

            if (staffingPeriodIndex > 0)
            {
                staffingData.StaffingDateRangeIndex = staffingPeriodIndex;

                if (staffingDataDA.DeleteStaffingData(staffingData))
                {
                    DisplayMessage(true, "Record Deleted");
                    PopulateDataGrid();
                    ClearFields();
                }
                else
                {
                    DisplayMessage(false, "Record Not Deleted");
                }
            }
            else
            {
                DisplayMessage(false, "Staffing index is invalid");
            }
        }
    }
}