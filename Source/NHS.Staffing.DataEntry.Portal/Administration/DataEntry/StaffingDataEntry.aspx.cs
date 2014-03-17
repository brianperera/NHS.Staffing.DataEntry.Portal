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
    public partial class StaffingDataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: Adding dummy values
            DataTable userTable = new DataTable();
            userTable.Columns.Add("StartDate", typeof(DateTime));
            userTable.Columns.Add("EndDate", typeof(DateTime));
            userTable.Columns.Add("Beds", typeof(int));
            userTable.Columns.Add("OptimumStaffingRN", typeof(int));
            userTable.Columns.Add("OptimumStaffingHCA", typeof(int));
            userTable.Columns.Add("SafeStaffingRN", typeof(int));
            userTable.Columns.Add("SafeStaffingHCA", typeof(int));

            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(7).ToShortDateString(), 10, 1, 1, 1, 1);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(6).ToShortDateString(), 20, 2, 1, 1, 1);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(5).ToShortDateString(), 30, 1, 3, 1, 1);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);
            userTable.Rows.Add(DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(4).ToShortDateString(), 40, 5, 1, 1, 2);

            // Bind users to Grid.
            StaffingData_Grid.DataSource = userTable;
            StaffingData_Grid.DataBind();


            if (!IsPostBack)
            {
                PeriodStartDate_TextBox.Attributes.Add("readonly", "readonly");
                PeriodEndDate_TextBox.Attributes.Add("readonly", "readonly");

                BindInitialData();
            }
        }

        private void BindInitialData()
        {
            WardName_DropDownList.DataSource = DataRepository.Instance.AllWards;
            WardName_DropDownList.DataTextField = "WardName";
            WardName_DropDownList.DataValueField = "WardCode";
            WardName_DropDownList.DataBind();

            Shift_DropDownList.DataSource = DataRepository.Instance.AllShiftTypes;
            Shift_DropDownList.DataTextField = "Name";
            Shift_DropDownList.DataValueField = "ShiftID";
            Shift_DropDownList.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            
        }

        private void DisplayMessage(bool executionStatus)
        {
            MessageLabel.Text = executionStatus == true ? "Record Updated Successfully" : "Record Not Updated";
            MessageLabel.CssClass = executionStatus == true ? "alert-success" : "alert-danger";
        }
    }
}