using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class StaffingDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PeriodStartDate_TextBox.Attributes.Add("readonly", "readonly");
                PeriodEndDate_TextBox.Attributes.Add("readonly", "readonly");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            StaffingDataDA sda = new StaffingDataDA();
        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }
    }
}