using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class Account_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("NavigationMenu").Visible = false;
            Master.FindControl("HosName").Visible = false;
            Master.FindControl("NhsName").Visible = false;
        }
    }
}