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
    public partial class MitigationActionSearch : System.Web.UI.Page
    {
        List<string> mitigationActions = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindInitialData();
        }

        private void BindInitialData()
        {
            // Bind users to Grid.
            MitigationActionsDA mtda = new MitigationActionsDA();
            mitigationActions = mtda.GetAllMitigationActions();

            DataTable table = new DataTable();
            table.Columns.Add("Action", typeof(string));

            foreach (string item in mitigationActions)
            {
                table.Rows.Add(item);
            }
           
            MItigationAction_Grid.DataSource = table;
            MItigationAction_Grid.DataBind();
        }
    }
}