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
            //if (!IsPostBack)
            //{
            //    Date_TextBox.Attributes.Add("readonly", "readonly");
            //}

            //WardCode_DropDownList.DataSource = DataRepository.Instance.AllWards;
            //WardCode_DropDownList.DataTextField = "WardName";
            //WardCode_DropDownList.DataValueField = "WardCode";
            //WardCode_DropDownList.DataBind();

            //Shift_DropDownList.DataSource = DataRepository.Instance.AllShiftTypes;
            //Shift_DropDownList.DataTextField = "Name";
            //Shift_DropDownList.DataValueField = "ShiftID";
            //Shift_DropDownList.DataBind();

            //UnSafeMitigation_DropDownList.DataSource = DataRepository.Instance.UnSafeMitigations;
            //UnSafeMitigation_DropDownList.DataBind();

            //SafeMitigation_DropDownList.DataSource = DataRepository.Instance.SafeMitigations;
            //SafeMitigation_DropDownList.DataBind();

            //ShiftTypeDA sda = new ShiftTypeDA();
            //ShiftType sht = new ShiftType();
            //sht.ShiftID = 4;
            //sht.Name = "SpecialUpdate";
            //sda.DeleteShiftType(sht);

            //Ward wrd = new Ward();
            //wrd.WardCode = "test";
            //wrd.WardName = "test ward update";
            //wrd.NoOfBeds = 20;
            //WardDA wda = new WardDA();
            //wda.DeleteWard(wrd);

            //ShiftRecord rcrd = new ShiftRecord();
            //rcrd.WardCode = "sssss";
            //rcrd.Date = DateTime.Today;
            //rcrd.ShiftID = 1;
            //rcrd.DataEntryBy = "sampath " + DateTime.Now.ToString();
            //ShiftRecordDA sda = new ShiftRecordDA();
            //sda.DeleteShiftRecord(rcrd);
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //ShiftRecord currentRecord = GetShiftRecord();

            //ShiftRecordDA sda = new ShiftRecordDA();
            //sda.AddShiftRecord(currentRecord);
        }

        private ShiftRecord GetShiftRecord()
        {
            ShiftRecord record = new ShiftRecord();

            //WardCode
            record.WardCode = WardCode_DropDownList.SelectedItem.Value;

            //ShiftID
            int wardID;
            int.TryParse(Shift_DropDownList.SelectedItem.Value, out wardID);
            record.ShiftID = wardID;

            //Date
            DateTime date;
            DateTime.TryParse(Date_TextBox.Text,out date);
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

            //record.DataEntryBy = Membership.GetUser().UserName + " : " + DateTime.Now.ToString();

            return record;
        }
    }
}