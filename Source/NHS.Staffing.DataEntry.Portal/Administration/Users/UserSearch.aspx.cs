using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nhs.Staffing.DataEntry.Portal.Utility;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class UserSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind users to Grid.
                Users_ListBox.DataSource = Membership.GetAllUsers();
                Users_ListBox.DataBind();
            }
        }
    }
}