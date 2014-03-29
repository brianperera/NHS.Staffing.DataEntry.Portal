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
            PopulateDataGrid();

            if (!IsPostBack)
            {

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
            List<StaffingData> staffingDataToDisplay = staffingData.Where(data => data.WardName != string.Empty).ToList(); ;

            if (null != staffingDataToDisplay)
            {
                StaffingData_Grid.DataSource = staffingDataToDisplay;
                StaffingData_Grid.DataBind();
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
    }
}