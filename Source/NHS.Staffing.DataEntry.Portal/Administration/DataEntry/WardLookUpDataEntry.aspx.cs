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

        protected void Page_Load(object sender, EventArgs e)
        {
            BindInitialData();

            if (!IsPostBack)
            {
                WardDataEntryFound_HiddenField.Text = "false";
            }

            MessageLabel.Visible = false;
        }

        private void BindInitialData()
        {
            // Bind users to Grid.
            WardDA wda = new WardDA();
            currentWards = wda.GetAllWard();
            WardData_Grid.DataSource = currentWards;
            WardData_Grid.DataBind();
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
            foreach (Ward ward in currentWards)
            {
                WardDataEntryFound_HiddenField.Text = "false";

                if (ward.WardCode.Equals(WardCode_TextBox.Text))
                {
                    WardCode_TextBox.Text = ward.WardCode;
                    WardName_TextBox.Text = ward.WardName;
                    Devision_TextBox.Text = ward.Division;

                    WardDataEntryFound_HiddenField.Text = "true";
                    Delete_Button.Enabled = true;
                    break;
                }
            }
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