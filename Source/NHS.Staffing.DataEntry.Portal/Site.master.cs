using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string ReferenceScript(string scriptFile)
        {
            var filePath = VirtualPathUtility.ToAbsolute("~/Scripts/" + scriptFile);
            return "<script type=\"text/javascript\" src=\"" + filePath + "\"></script>";
        }
    }
}