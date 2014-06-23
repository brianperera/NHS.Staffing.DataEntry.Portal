using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

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

            MessageLabel.Visible = false;
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

            // Inserting the default text to the dropdowns
            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["DropDownDefaultText"]))
            {
                ListItem defaultItem = new ListItem(ConfigurationManager.AppSettings["DropDownDefaultText"]);

                UnSafeMitigation_DropDownList.Items.Insert(0, defaultItem);
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Validate before submit
            if (!IsFormValid())
            {
                ResetConfirmationMessage();
                return;
            }

            if (!IsStaffWarningRequired(false))
            {
                DisplayStaffingWarningDialog(false);
            }
            else
            {
                SubmitStaffingData();
            }
        }

        private bool IsStaffWarningRequired(bool overrrideStaffingData)
        {
            int todayTrustHCA;
            int todayBankHCA;
            int todayNonTrustHCA;
            int optimumStaffingHCA;
            int todayTrustRN;
            int todayBankRN;
            int todayNonTrustRN;
            int optimumStaffingRN;
            bool isSafe = false;

            int.TryParse(HCA_SafeStaffing_TextBox.Text, out optimumStaffingHCA);
            int.TryParse(RN_SafeStaffing_TextBox.Text, out optimumStaffingRN);

            if (overrrideStaffingData)
            {
                int.TryParse(Overrride_HCA_TodayTrust_TextBox.Text, out todayTrustHCA);
                int.TryParse(Overrride_HCA_TodayBank_TextBox.Text, out todayBankHCA);
                int.TryParse(Overrride_HCA_TodayNonTrust_TextBox.Text, out todayNonTrustHCA);

                int.TryParse(Overrride_RN_TodayTrust_TextBox.Text, out todayTrustRN);
                int.TryParse(Overrride_RN_TodayBank_TextBox.Text, out todayBankRN);
                int.TryParse(Overrride_RN_TodayNonTrust_TextBox.Text, out todayNonTrustRN);

                isSafe = Overrride_safeDropdown.SelectedValue.Equals("Yes", StringComparison.OrdinalIgnoreCase);
            }
            else
            {
                int.TryParse(HCA_TodayTrust_TextBox.Text, out todayTrustHCA);
                int.TryParse(HCA_TodayBank_TextBox.Text, out todayBankHCA);
                int.TryParse(HCA_TodayNonTrust_TextBox.Text, out todayNonTrustHCA);

                int.TryParse(RN_TodayTrust_TextBox.Text, out todayTrustRN);
                int.TryParse(RN_TodayBank_TextBox.Text, out todayBankRN);
                int.TryParse(RN_TodayNonTrust_TextBox.Text, out todayNonTrustRN);

                isSafe = safeDropdown.SelectedValue.Equals("Yes", StringComparison.OrdinalIgnoreCase);
            }

            if (isSafe)
                return isSafe;

            //HCA
            return (todayNonTrustHCA + todayBankHCA + todayTrustHCA >= optimumStaffingHCA) && (todayNonTrustRN + todayBankRN + todayTrustRN >= optimumStaffingRN);
        }

        protected void StaffingWarnningButton_Click(object sender, EventArgs e)
        {
            ResetConfirmationMessage();
            SubmitStaffingData();
        }

        //TODO
        protected void StaffingOverrideWarnningButton_Click(object sender, EventArgs e)
        {
            //Brian
            ResetConfirmationMessage();
            ShiftDataUpdate(true);
        }

        private void SubmitStaffingData()
        {
            if (safeDropdown.SelectedValue.Equals("Yes", StringComparison.OrdinalIgnoreCase))
            {
                ShiftDataUpdate(false);
            }
            else
            {
                unsafeSubmitConfirmationPanel.Visible = true;
                unsafeSubmitConfirmationPanel.Attributes.Add("style", "display: block;");
                fade.Attributes.Add("style", "display: block;");
            }
        }

        private void DisplayStaffingWarningDialog(bool overrrideStaffingData)
        {
            ResetConfirmationMessage();

            if (overrrideStaffingData)
            {
                //Show the overrride OK button
                StaffingWarnningButton.Visible = false;
                StaffingOverrideWarnningButton.Visible = true;
            }
            else
            {
                //Show the submit OK button
                StaffingWarnningButton.Visible = true;
                StaffingOverrideWarnningButton.Visible = false;
            }

            StaffingWarningPanel.Visible = true;
            StaffingWarningPanel.Attributes.Add("style", "display: block;");
            fade.Attributes.Add("style", "display: block;");
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            LoadDataForUpdate();
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

        private ShiftRecord GetShiftRecord(bool overrideStaffingData)
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
            record.TodayTrustRN = overrideStaffingData ? Overrride_RN_TodayTrust_TextBox.Text : RN_TodayTrust_TextBox.Text;

            //TodayTrustHCA
            record.TodayTrustHCA = overrideStaffingData ? Overrride_HCA_TodayTrust_TextBox.Text : HCA_TodayTrust_TextBox.Text;

            //TodayBankRN
            record.TodayBankRN = overrideStaffingData ? Overrride_RN_TodayBank_TextBox.Text : RN_TodayBank_TextBox.Text;

            //TodayBankHCA
            record.TodayBankHCA = overrideStaffingData ? Overrride_HCA_TodayBank_TextBox.Text : HCA_TodayBank_TextBox.Text;

            //TodayNonTrustRN
            record.TodayNonTrustRN = overrideStaffingData ? Overrride_RN_TodayNonTrust_TextBox.Text : RN_TodayNonTrust_TextBox.Text;

            //TodayNonTrustHCA
            record.TodayNonTrustHCA = overrideStaffingData ? Overrride_HCA_TodayNonTrust_TextBox.Text : HCA_TodayNonTrust_TextBox.Text;

            //Safe logic
            if (overrideStaffingData)
            {
                if (Overrride_safeDropdown.Text == "Yes")
                {
                    record.IsSafe = true;
                    record.IsSafeAfterMitigation = true;
                    safeDropdown.Text = "Yes";
                }
                else
                {
                    record.IsSafe = false;
                    record.IsSafeAfterMitigation = false;
                    safeDropdown.Text = "No";
                }
            }
            else
            {
                if (safeDropdown.Text == "Yes")
                {
                    record.IsSafe = true;
                    record.IsSafeAfterMitigation = true;
                    Overrride_safeDropdown.Text = "Yes";
                }
                else
                {
                    record.IsSafe = false;
                    record.IsSafeAfterMitigation = false;
                    Overrride_safeDropdown.Text = "No";
                }
            }

            /*
             if ((safeDropdown.Text == "Yes") || Overrride_safeDropdown.Text == "Yes")
             {
                 record.IsSafe = true;
                 record.IsSafeAfterMitigation = true;
                 Overrride_safeDropdown.Text = "Yes";
             }
             else if((safeDropdown.Text == "No" || Overrride_safeDropdown.Text == "No"))
             {
                 record.IsSafe = false;
                 record.IsSafeAfterMitigation = false;
             }
             else
             {
                 record.IsSafeAfterMitigation = null;
             }

             */
            //Safe
            record.SafeMitigation = string.Empty;

            //Unsafe
            record.UnSafeMitigation = (UnSafeMitigation_DropDownList.SelectedIndex > 0)
                                        ? UnSafeMitigation_DropDownList.SelectedValue
                                        : string.Empty;

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

            //if (SafeMitigation_DropDownList.Items.Count > 0)
            //    SafeMitigation_DropDownList.SelectedIndex = 0;

            //Safe_CheckBox.Checked = false;
            safeDropdown.SelectedIndex = 0;

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
            DateTime currentDate;
            ShiftRecordDA sda;

            //ShiftID
            int shiftID = -1;
            int.TryParse(Shift_DropDownList.SelectedItem.Value, out shiftID);
            DateTime.TryParse(Date_TextBox.Text, out currentDate);

            if (string.IsNullOrWhiteSpace(wardCode) || shiftID < 0 || currentDate == null)
                return;

            sda = new ShiftRecordDA();
            ShiftRecord record = sda.GetShiftRecord(currentDate, wardCode, shiftID);

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


            //Fix if defualt value is 0, empty string will be displayed.
            //TodayTrustRN
            RN_TodayTrust_TextBox.Text = record.TodayTrustRN;
            Overrride_RN_TodayTrust_TextBox.Text = record.TodayTrustRN;
            //TodayTrustHCA
            HCA_TodayTrust_TextBox.Text = record.TodayTrustHCA;
            Overrride_HCA_TodayTrust_TextBox.Text = record.TodayTrustHCA;
            //TodayBankRN
            RN_TodayBank_TextBox.Text = record.TodayBankRN;
            Overrride_RN_TodayBank_TextBox.Text = record.TodayBankRN;
            //TodayBankHCA
            HCA_TodayBank_TextBox.Text = record.TodayBankHCA;
            Overrride_HCA_TodayBank_TextBox.Text = record.TodayBankHCA;
            //TodayNonTrustRN
            RN_TodayNonTrust_TextBox.Text = record.TodayNonTrustRN;
            Overrride_RN_TodayNonTrust_TextBox.Text = record.TodayNonTrustRN;
            //TodayNonTrustHCA
            HCA_TodayNonTrust_TextBox.Text = record.TodayNonTrustHCA;
            Overrride_HCA_TodayNonTrust_TextBox.Text = record.TodayNonTrustHCA;

            //Safe
            if (record.IsSafe)
            {
                safeDropdown.SelectedIndex = 0;
                mitigationPanel.Visible = false;
            }
            else
            {
                safeDropdown.SelectedIndex = 1;
                mitigationPanel.Visible = true;
            }

            //Check if the ward is unsafe and display the staffing adjustment panel
            if (record.IsSafeAfterMitigation == true)
            {
                Overrride_safeDropdown.SelectedIndex = 1;
            }
            else if (record.IsSafeAfterMitigation == false)
            {
                adjustStaffingFiguresPanel.Visible = true;
                adjustStaffingFiguresPanel.Attributes.Add("style", "display: block;");
                fade.Attributes.Add("style", "display: block;");

                Overrride_safeDropdown.SelectedIndex = 0;
            }

            //UnSafeMitigation
            if (UnSafeMitigation_DropDownList.Items.FindByValue(record.UnSafeMitigation) != null)
            {
                UnSafeMitigation_DropDownList.SelectedValue = record.UnSafeMitigation;
            }
            else
            {
                UnSafeMitigation_DropDownList.SelectedIndex = 0;
            }


            string shiftDataEntryFound = ShiftDataEntryFound_HiddenField.Value;

            if (shiftDataEntryFound.Equals("false"))
            {
                //Shift Name
                string shiftName = Shift_DropDownList.SelectedItem.Text;

                //ShiftRecord record = sda.GetShiftRecord(date, wardCode, shiftID);
                StaffingData staffingDataRecord = new StaffingData();
                IList<StaffingData> allStaffing = DataRepository.Instance.AllStaffing;

                StaffingDateRangeDA staffingDateRangeDA = new StaffingDateRangeDA();
                List<StaffingDateRange> staffingDateRange = new List<StaffingDateRange>();
                staffingDateRange = staffingDateRangeDA.GetAllStaffingDateRanges();

                // This is the logic that loads the optimum/safe staffing values according to the current date

                int currentDatePeriodIndex = 0;

                foreach (StaffingDateRange item in staffingDateRange)
                {
                    if (IsCurrentDateInSpecifiedDatePeriod(currentDate, item.StartDate, item.EndDate))
                    {
                        currentDatePeriodIndex = item.Index;
                        break;
                    }
                }

                foreach (StaffingData item in allStaffing)
                {
                    if (item.StaffingDateRangeIndex == currentDatePeriodIndex && wardCode.Equals(item.WardCode) && shiftName.Equals(item.Shift) && item.StaffingDate == currentDate.ToString("dddd"))
                    {
                        staffingDataRecord = item;
                        break;
                    }
                }

                //Beds   
                Beds_TextBox.Text = staffingDataRecord.Beds.ToString();
                //OptimumStaffingRN
                RN_OptimumStaffing_TextBox.Text = staffingDataRecord.OptimumRN.ToString();
                //OptimumStaffingHCA
                HCA_OptimumStaffing_TextBox.Text = staffingDataRecord.OptimumHCA.ToString();
                //SafeStaffingRN
                RN_SafeStaffing_TextBox.Text = staffingDataRecord.SafeRN.ToString();
                //SafeStaffingHCA
                HCA_SafeStaffing_TextBox.Text = staffingDataRecord.SafeHCA.ToString();
            }

        }

        private bool IsCurrentDateInSpecifiedDatePeriod(DateTime dateToCheck, DateTime startDate, DateTime endDate)
        {
            // if end date is not specified
            if (endDate.ToShortDateString() == "01/01/0001")
            {
                return dateToCheck >= startDate;
            }
            else
            {
                return dateToCheck >= startDate && dateToCheck <= endDate;
            }
        }

        protected void safeDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            mitigationPanel.Visible = safeDropdown.SelectedItem.Text.Equals("Yes", StringComparison.OrdinalIgnoreCase) ? false : true;
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            ShiftDataUpdate(false);
        }

        protected void staffingOverrrideButton_Click(object sender, EventArgs e)
        {
            //brian
            if (!IsStaffWarningRequired(true))
            {
                DisplayStaffingWarningDialog(true);
            }
            else
            {
                ShiftDataUpdate(true);
            }
        }

        protected void cancelPopupButton_Click(object sender, EventArgs e)
        {
            ResetConfirmationMessage();
        }

        private void ShiftDataUpdate(bool overrideRecord)
        {
            bool executionStatus = false;

            ShiftRecord currentRecord = GetShiftRecord(overrideRecord);

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

            //Update the staffing data again
            LoadDataForUpdate();

            DisplayMessage(executionStatus);

            ResetConfirmationMessage();
        }

        private bool IsFormValid()
        {
            if (string.IsNullOrEmpty(Date_TextBox.Text))
            {
                DisplayMessage(false, "Date is Empty");
                return false;
            }

            if (mitigationPanel.Visible == true && UnSafeMitigation_DropDownList.SelectedIndex == 0)
            {
                DisplayMessage(false, "Please select a mitigation action");
                return false;
            }

            return true;
        }

        private void ResetConfirmationMessage()
        {
            unsafeSubmitConfirmationPanel.Visible = false;
            unsafeSubmitConfirmationPanel.Attributes.Add("style", "display: none;");
            fade.Attributes.Add("style", "display: none;");

            adjustStaffingFiguresPanel.Visible = false;
            adjustStaffingFiguresPanel.Attributes.Add("style", "display: none;");
            fade.Attributes.Add("style", "display: none;");

            StaffingWarningPanel.Visible = false;
            StaffingWarningPanel.Attributes.Add("style", "display: none;");
            fade.Attributes.Add("style", "display: none;");
        }
    }
}