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
    public partial class MitigationActionDataEntry : System.Web.UI.Page
    {
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
                if (ActionType == Constants.Update && !string.IsNullOrEmpty(ID))
                {
                    WardDataEntryFound_HiddenField.Text = "true";

                    MitigationActionsDA mtda = new MitigationActionsDA();

                    //Update fields
                    ActionName_TextBox.Text = ID;
                }
                else
                {
                    WardDataEntryFound_HiddenField.Text = "false";
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            bool executionStatus = false;

            MitigationActionsDA mtda = new MitigationActionsDA();

            if (WardDataEntryFound_HiddenField.Text.Equals("true"))
            {
                // Update
                executionStatus = mtda.UpdateMitigationAction(ID, ActionName_TextBox.Text);
            }
            else
            {
                // Add
                executionStatus = mtda.AddMitigationAction(ActionName_TextBox.Text);
            }

            if (executionStatus)
                DataRepository.Instance.ReloadMitigationActions();

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
    }
}