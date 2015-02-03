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
    public partial class WardLookUpDataEntry : System.Web.UI.Page
    {
        IList<Ward> currentWards = null;

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
            if (!IsPostBack)
            {
                BindInitialData();

                if (ActionType == Constants.Update && !string.IsNullOrEmpty(ID))
                {
                    WardDataEntryFound_HiddenField.Text = "true";
                }
                else
                {
                    WardDataEntryFound_HiddenField.Text = "false";
                }
            }

            MessageLabel.Visible = false;
        }

        private void BindInitialData()
        {
            // Bind users to Grid.
            WardDA wda = new WardDA();
            currentWards = wda.GetAllWard();

            foreach (Ward ward in currentWards)
            {
                if (ward.WardCode.Equals(ID))
                {
                    WardCode_TextBox.Text = ward.WardCode;
                    WardName_TextBox.Text = ward.WardName;
                    Devision_TextBox.Text = ward.Division;

                    WardDataEntryFound_HiddenField.Text = "true";
                    break;
                }
                else
                {
                    WardDataEntryFound_HiddenField.Text = "false";
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            WardDA wardDA = new WardDA();
            Ward wardRecord = new Ward();
            bool executionStatus = false;

            if (WardDataEntryFound_HiddenField.Text.Equals("true"))
            {
                // Update
                wardRecord.WardCode = WardCode_TextBox.Text;
                wardRecord.WardName = WardName_TextBox.Text;
                wardRecord.Division = Devision_TextBox.Text;

                executionStatus = wardDA.UpdateWard(wardRecord);
            }
            else
            {
                // Add
                wardRecord.WardCode = WardCode_TextBox.Text;
                wardRecord.WardName = WardName_TextBox.Text;
                wardRecord.Division = Devision_TextBox.Text;

                executionStatus = wardDA.AddWard(wardRecord);
            }

            if (executionStatus)
                DataRepository.Instance.RefreshWardData();


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

        protected void WardCode_TextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void WardName_TextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Refresh_Button_Click(object sender, EventArgs e)
        {
            //Dummy method
        }

        protected void Delete_Button_Click(object sender, EventArgs e)
        {

            WardDA wardDA = new WardDA();
            Ward wardRecord = new Ward();
            bool executionStatus = false;

            // Update
            wardRecord.WardCode = WardCode_TextBox.Text;
            wardRecord.WardName = WardName_TextBox.Text;
            wardRecord.Division = Devision_TextBox.Text;

            executionStatus = wardDA.DeleteWard(wardRecord);

            DisplayMessage(executionStatus, "Record Deleted");
        }
    }
}