using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class ShiftDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Date_TextBox.Attributes.Add("readonly", "readonly");

                BindInitialData();
            }
        }

        private void BindInitialData()
        {
            ShiftDataEntryFound_HiddenField.Value = "false";

            WardName_DropDownList.DataSource = DataRepository.Instance.AllWards;
            WardName_DropDownList.DataTextField = "WardName";
            WardName_DropDownList.DataValueField = "WardCode";
            WardName_DropDownList.DataBind();

            Shift_DropDownList.DataSource = DataRepository.Instance.AllShiftTypes;
            Shift_DropDownList.DataTextField = "Name";
            Shift_DropDownList.DataValueField = "ShiftID";
            Shift_DropDownList.DataBind();

            UnSafeMitigation_DropDownList.DataSource = DataRepository.Instance.UnSafeMitigations;
            UnSafeMitigation_DropDownList.DataBind();

            SafeMitigation_DropDownList.DataSource = DataRepository.Instance.SafeMitigations;
            SafeMitigation_DropDownList.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            bool executionStatus = false;

            // Validate before submit
            if (string.IsNullOrEmpty(Date_TextBox.Text))
            {
                DisplayMessage(executionStatus, "Date is Empty");
                Clear();

                return;
            }

            ShiftRecord currentRecord = GetShiftRecord();
            ShiftRecordDA sda = new ShiftRecordDA();

            string shiftDataEntryFound = ShiftDataEntryFound_HiddenField.Value;

            if (shiftDataEntryFound.Equals("true"))
            {
                executionStatus = sda.UpdateShiftRecord(currentRecord);
            }
            else
            {
                executionStatus = sda.AddShiftRecord(currentRecord);
            }

            DisplayMessage(executionStatus);
            Clear();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }

        private void DisplayMessage(bool executionStatus, string message)
        {
            MessageLabel.Text = message;
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }

        private ShiftRecord GetShiftRecord()
        {
            ShiftRecord record = new ShiftRecord();

            //WardCode
            record.WardCode = WardName_DropDownList.SelectedItem.Value;

            //ShiftID
            int shiftID;
            int.TryParse(Shift_DropDownList.SelectedItem.Value, out shiftID);
            record.ShiftID = shiftID;

            //Date
            DateTime date;
            DateTime.TryParse(Date_TextBox.Text, out date);
            record.Date = date;

            //Beds
            int beds;
            int.TryParse(Beds_TextBox.Text, out beds);
            record.Beds = beds;

            //OptimumStaffingRN
            int osrn;
            int.TryParse(RN_OptimumStaffing_TextBox.Text, out osrn);
            record.OptimumStaffingRN = osrn;

            //OptimumStaffingHCA
            int oshca;
            int.TryParse(HCA_OptimumStaffing_TextBox.Text, out oshca);
            record.OptimumStaffingHCA = oshca;

            //SafeStaffingRN
            int ssrn;
            int.TryParse(RN_SafeStaffing_TextBox.Text, out ssrn);
            record.SafeStaffingRN = ssrn;

            //SafeStaffingHCA
            int sshca;
            int.TryParse(HCA_SafeStaffing_TextBox.Text, out sshca);
            record.SafeStaffingHCA = sshca;

            //TodayTrustRN
            int ttrn;
            int.TryParse(RN_TodayTrust_TextBox.Text, out ttrn);
            record.TodayTrustRN = ttrn;

            //TodayTrustHCA
            int tthca;
            int.TryParse(HCA_TodayTrust_TextBox.Text, out tthca);
            record.TodayTrustHCA = tthca;

            //TodayBankRN
            int tbrn;
            int.TryParse(RN_TodayBank_TextBox.Text, out tbrn);
            record.TodayBankRN = tbrn;

            //TodayBankHCA
            int tbhca;
            int.TryParse(HCA_TodayBank_TextBox.Text, out tbhca);
            record.TodayBankHCA = tbhca;

            //TodayNonTrustRN
            int tntrn;
            int.TryParse(RN_TodayNonTrust_TextBox.Text, out tntrn);
            record.TodayNonTrustRN = tntrn;

            //TodayNonTrustHCA
            int tnthca;
            int.TryParse(HCA_TodayNonTrust_TextBox.Text, out tnthca);
            record.TodayNonTrustHCA = tnthca;

            //Safe
            record.IsSafe = this.Safe_CheckBox.Checked;

            //Safe
            record.SafeMitigation = SafeMitigation_DropDownList.SelectedValue;

            record.UnSafeMitigation = UnSafeMitigation_DropDownList.SelectedValue;

            record.DataEntryBy = Membership.GetUser().UserName + " : " + DateTime.Now.ToString();

            return record;
        }

        private void Clear()
        {
            if (WardName_DropDownList.Items.Count > 0)
                WardName_DropDownList.SelectedIndex = 0;

            if (Shift_DropDownList.Items.Count > 0)
                Shift_DropDownList.SelectedIndex = 0;

            if (UnSafeMitigation_DropDownList.Items.Count > 0)
                UnSafeMitigation_DropDownList.SelectedIndex = 0;

            if (SafeMitigation_DropDownList.Items.Count > 0)
                SafeMitigation_DropDownList.SelectedIndex = 0;

            Safe_CheckBox.Checked = false;

            Beds_TextBox.Text = string.Empty;

            RN_OptimumStaffing_TextBox.Text = string.Empty;
            HCA_OptimumStaffing_TextBox.Text = string.Empty;
            RN_SafeStaffing_TextBox.Text = string.Empty;
            HCA_SafeStaffing_TextBox.Text = string.Empty;
            RN_TodayTrust_TextBox.Text = string.Empty;
            HCA_TodayTrust_TextBox.Text = string.Empty;
            RN_TodayBank_TextBox.Text = string.Empty;
            HCA_TodayBank_TextBox.Text = string.Empty;
            RN_TodayNonTrust_TextBox.Text = string.Empty;
            HCA_TodayNonTrust_TextBox.Text = string.Empty;
        }

        protected void WardName_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        protected void Date_TextBox_TextChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        protected void Shift_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataForUpdate();
        }

        private void LoadDataForUpdate()
        {

            string wardCode = WardName_DropDownList.SelectedItem.Value;
            DateTime date;
            ShiftRecordDA sda;

            //ShiftID
            int shiftID = -1;
            int.TryParse(Shift_DropDownList.SelectedItem.Value, out shiftID);
            DateTime.TryParse(Date_TextBox.Text, out date);

            if (string.IsNullOrWhiteSpace(wardCode) || shiftID < 0 || date == null)
                return;

            sda = new ShiftRecordDA();
            ShiftRecord record = sda.GetShiftRecord(date, wardCode, shiftID);

            if (record.ShiftRecordExists)
                ShiftDataEntryFound_HiddenField.Value = "true";
            else
                ShiftDataEntryFound_HiddenField.Value = "false";

            //Beds   
            Beds_TextBox.Text = record.Beds.ToString();
            //OptimumStaffingRN
            RN_OptimumStaffing_TextBox.Text = record.OptimumStaffingRN.ToString();
            //OptimumStaffingHCA
            HCA_OptimumStaffing_TextBox.Text = record.OptimumStaffingHCA.ToString();
            //SafeStaffingRN
            RN_SafeStaffing_TextBox.Text = record.SafeStaffingRN.ToString();
            //SafeStaffingHCA
            HCA_SafeStaffing_TextBox.Text = record.SafeStaffingHCA.ToString();
            //TodayTrustRN
            RN_TodayTrust_TextBox.Text = record.TodayTrustRN.ToString();
            //TodayTrustHCA
            HCA_TodayTrust_TextBox.Text = record.TodayTrustHCA.ToString();
            //TodayBankRN
            RN_TodayBank_TextBox.Text = record.TodayBankRN.ToString();
            //TodayBankHCA
            HCA_TodayBank_TextBox.Text = record.TodayBankHCA.ToString();
            //TodayNonTrustRN
            RN_TodayNonTrust_TextBox.Text = record.TodayNonTrustRN.ToString();
            //TodayNonTrustHCA
            HCA_TodayNonTrust_TextBox.Text = record.TodayNonTrustHCA.ToString();
            //Safe
            Safe_CheckBox.Checked = record.IsSafe;
            //SafeMitigation
            SafeMitigation_DropDownList.SelectedValue = record.SafeMitigation;
            //UnSafeMitigation
            UnSafeMitigation_DropDownList.SelectedValue = record.UnSafeMitigation;

            string shiftDataEntryFound = ShiftDataEntryFound_HiddenField.Value;

            if (shiftDataEntryFound.Equals("false"))
            {
                //Shift Name
                string shiftName = Shift_DropDownList.SelectedItem.Text;
                
                //ShiftRecord record = sda.GetShiftRecord(date, wardCode, shiftID);
                StaffingData staffingDataRwcord = new StaffingData();
                IList<StaffingData> allStaffing = DataRepository.Instance.AllStaffing;

                foreach (StaffingData item in allStaffing)
                {
                    if (wardCode.Equals(item.WardCode) && shiftName.Equals(item.Shift) && item.StaffingDate == date.ToString("dddd"))
                    {
                        staffingDataRwcord = item;
                        break;
                    }
                }

                //Beds   
                Beds_TextBox.Text = staffingDataRwcord.Beds.ToString();
                //OptimumStaffingRN
                RN_OptimumStaffing_TextBox.Text = staffingDataRwcord.OptimumRN.ToString();
                //OptimumStaffingHCA
                HCA_OptimumStaffing_TextBox.Text = staffingDataRwcord.OptimumHCA.ToString();
                //SafeStaffingRN
                RN_SafeStaffing_TextBox.Text = staffingDataRwcord.SafeRN.ToString();
                //SafeStaffingHCA
                HCA_SafeStaffing_TextBox.Text = staffingDataRwcord.SafeHCA.ToString();            
            }

        }
    }
}