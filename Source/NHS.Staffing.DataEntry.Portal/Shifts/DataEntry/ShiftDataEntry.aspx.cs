﻿using System;
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

        private void SetEntryAreaBckground()
        {
            if(RN_PlannedNumber_TextBox.Text == "" || RN_PlannedNumber_TextBox.Text == "0")
                RN_PlannedNumber_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_PlannedNumber_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (HCA_PlannedNumber_TextBox.Text == "" || HCA_PlannedNumber_TextBox.Text == "0")
                HCA_PlannedNumber_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_PlannedNumber_TextBox.BackColor = System.Drawing.Color.LightBlue;    


            if (HCA_TodayNonTrust_TextBox.Text == "" || HCA_TodayNonTrust_TextBox.Text == "0")
                HCA_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (RN_TodayNonTrust_TextBox.Text == "" || RN_TodayNonTrust_TextBox.Text == "0")
                RN_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (HCA_TodayBank_TextBox.Text == "" || HCA_TodayBank_TextBox.Text == "0")
                HCA_TodayBank_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_TodayBank_TextBox.BackColor = System.Drawing.Color.LightBlue;
                


            if (RN_TodayBank_TextBox.Text == "" || RN_TodayBank_TextBox.Text == "0")
                RN_TodayBank_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_TodayBank_TextBox.BackColor = System.Drawing.Color.LightBlue;    


            if (HCA_TodayTrust_TextBox.Text == "" || HCA_TodayTrust_TextBox.Text == "0")
                HCA_TodayTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_TodayTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (RN_TodayTrust_TextBox.Text == "" || RN_TodayTrust_TextBox.Text == "0")
                RN_TodayTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_TodayTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (Overrride_HCA_TodayNonTrust_TextBox.Text == "" || Overrride_HCA_TodayNonTrust_TextBox.Text == "0")
                Overrride_HCA_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                Overrride_HCA_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (Overrride_RN_TodayNonTrust_TextBox.Text == "" || Overrride_RN_TodayNonTrust_TextBox.Text == "0")
                Overrride_RN_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                Overrride_RN_TodayNonTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;
                
            if (Overrride_HCA_TodayBank_TextBox.Text == "" || Overrride_HCA_TodayBank_TextBox.Text == "0")
                Overrride_HCA_TodayBank_TextBox.BackColor = System.Drawing.Color.White;    
            else
                Overrride_HCA_TodayBank_TextBox.BackColor = System.Drawing.Color.LightBlue;    
            


            if (Overrride_RN_TodayBank_TextBox.Text == "" || Overrride_RN_TodayBank_TextBox.Text == "0")
                Overrride_RN_TodayBank_TextBox.BackColor = System.Drawing.Color.White;
            else
                Overrride_RN_TodayBank_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (Overrride_HCA_TodayTrust_TextBox.Text == "" || Overrride_HCA_TodayTrust_TextBox.Text == "0")
                Overrride_HCA_TodayTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                Overrride_HCA_TodayTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;    


            if (Overrride_RN_TodayTrust_TextBox.Text == "" || Overrride_RN_TodayTrust_TextBox.Text == "0")
                Overrride_RN_TodayTrust_TextBox.BackColor = System.Drawing.Color.White;
            else
                Overrride_RN_TodayTrust_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (RN_OptimumStaffing_TextBox.Text == "" || RN_OptimumStaffing_TextBox.Text == "0")
                RN_OptimumStaffing_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_OptimumStaffing_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (HCA_OptimumStaffing_TextBox.Text == "" || HCA_OptimumStaffing_TextBox.Text == "0")
                HCA_OptimumStaffing_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_OptimumStaffing_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (RN_SafeStaffing_TextBox.Text == "" || RN_SafeStaffing_TextBox.Text == "0")
                RN_SafeStaffing_TextBox.BackColor = System.Drawing.Color.White;
            else
                RN_SafeStaffing_TextBox.BackColor = System.Drawing.Color.LightBlue;


            if (HCA_SafeStaffing_TextBox.Text == "" || HCA_SafeStaffing_TextBox.Text == "0")
                HCA_SafeStaffing_TextBox.BackColor = System.Drawing.Color.White;
            else
                HCA_SafeStaffing_TextBox.BackColor = System.Drawing.Color.LightBlue;
        }

        protected void EntryArea_TextBox_TextChanged(object sender, EventArgs e)
        {
            SetEntryAreaBckground();
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

            if (IsStaffWarningRequired(false))
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
            int todayTrustRN;
            int todayBankRN;
            int todayNonTrustRN;
            int minimumSafeStaffingRN;
            int minimumSafeStaffingHCA;
            bool isSafe = false;

            int.TryParse(HCA_SafeStaffing_TextBox.Text, out minimumSafeStaffingHCA);
            int.TryParse(RN_SafeStaffing_TextBox.Text, out minimumSafeStaffingRN);

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

            return (isSafe && ((todayNonTrustHCA + todayBankHCA + todayTrustHCA < minimumSafeStaffingHCA) || (todayNonTrustRN + todayBankRN + todayTrustRN < minimumSafeStaffingRN)));
        }

        protected void StaffingWarnningButton_Click(object sender, EventArgs e)
        {
            ResetConfirmationMessage();
            SubmitStaffingData();
        }

        
        protected void StaffingOverrideWarnningButton_Click(object sender, EventArgs e)
        {
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


            //Planned Number RN
            record.PlannedNumberRN = RN_PlannedNumber_TextBox.Text;

            //Planned Number HCA
            record.PlannedNumberHCA = HCA_PlannedNumber_TextBox.Text;

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
                    //record.IsSafe = true;
                    record.IsSafeAfterMitigation = true;
                    safeDropdown.Text = "Yes";
                }
                else
                {
                    //record.IsSafe = false;
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

            //Safe
            record.SafeMitigation = string.Empty;

            //Unsafe
            record.UnSafeMitigation = (UnSafeMitigation_DropDownList.SelectedIndex > 0)
                                        ? UnSafeMitigation_DropDownList.SelectedValue
                                        : string.Empty;

            record.DataEntryBy = Membership.GetUser().UserName + " : " + DateTime.Now.ToString();

            record.Comments = Comments_TextBox.Text;

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
            RN_PlannedNumber_TextBox.Text = string.Empty;
            HCA_PlannedNumber_TextBox.Text = string.Empty;
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
            //PlannedNumberRN
            RN_PlannedNumber_TextBox.Text = record.PlannedNumberRN;
            //PlannedNumberHCA
            HCA_PlannedNumber_TextBox.Text = record.PlannedNumberHCA;
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
            //Comments
            Comments_TextBox.Text = record.Comments;

            if (record.IsSafeAfterMitigation == null)
            {
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
            }

            //Check if the ward is unsafe and display the staffing adjustment panel
            if (record.IsSafeAfterMitigation == true)
            {
                safeDropdown.SelectedIndex = 0;
                mitigationPanel.Visible = false;
                Overrride_safeDropdown.SelectedIndex = 1;
            }
            else if (record.IsSafeAfterMitigation == false)
            {
                safeDropdown.SelectedIndex = 1;
                mitigationPanel.Visible = true;

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
                List<int> currentDatePeriodIndexs = new List<int>();

                //foreach (StaffingDateRange item in staffingDateRange)
                //{
                //    if (IsCurrentDateInSpecifiedDatePeriod(currentDate, item.StartDate, item.EndDate))
                //    {
                //        currentDatePeriodIndex = item.Index;
                //        break;
                //    }
                //}

                //Support for multiple periods
                foreach (StaffingDateRange item in staffingDateRange)
                {
                    if (IsCurrentDateInSpecifiedDatePeriod(currentDate, item.StartDate, item.EndDate))
                    {
                        currentDatePeriodIndexs.Add(item.Index);
                    }
                }

                foreach (StaffingData item in allStaffing)
                {
                    foreach (int period in currentDatePeriodIndexs)
                    {
                        if (item.StaffingDateRangeIndex == period && wardCode.Equals(item.WardCode) && shiftName.Equals(item.Shift) && item.StaffingDate == currentDate.ToString("dddd"))
                        {
                            staffingDataRecord = item;
                            break;
                        }   
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

            SetEntryAreaBckground();
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
            if (IsStaffWarningRequired(true))
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