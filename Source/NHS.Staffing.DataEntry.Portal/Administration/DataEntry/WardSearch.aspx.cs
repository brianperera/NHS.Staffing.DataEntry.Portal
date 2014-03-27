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
    public partial class WardSearch : System.Web.UI.Page
    {
        IList<Ward> currentWards = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindInitialData();
        }

        private void BindInitialData()
        {
            // Bind users to Grid.
            WardDA wda = new WardDA();
            currentWards = wda.GetAllWard();
            WardData_Grid.DataSource = currentWards;
            WardData_Grid.DataBind();
        }
    }
}