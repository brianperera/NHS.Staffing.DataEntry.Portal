using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class Configuration : System.Web.UI.Page
    {
        string[] rolesArray;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind roles to List.
                rolesArray = Roles.GetAllRoles();
                RolesListBox.DataSource = rolesArray;
                RolesListBox.DataBind();
            }
        }

        public void CreateRole_OnClick(object sender, EventArgs args)
        {
            string createRole = RoleTextBox.Text;

            try
            {
                if (Roles.RoleExists(createRole))
                {
                    Msg.Text = "Role '" + Server.HtmlEncode(createRole) + "' already exists. Please specify a different role name.";
                    return;
                }

                Roles.CreateRole(createRole);

                Msg.Text = "Role '" + Server.HtmlEncode(createRole) + "' created.";

                // Re-bind roles to GridView.

                rolesArray = Roles.GetAllRoles();
                RolesListBox.DataSource = rolesArray;
                RolesListBox.DataBind();
            }
            catch (Exception e)
            {
                Msg.Text = "Role '" + Server.HtmlEncode(createRole) + "' <u>not</u> created.";
                Response.Write(e.ToString());
            }

        }

        public void DeleteRole_OnClick(object sender, EventArgs args)
        {
            string delRole = "";

            try
            {
                delRole = RolesListBox.SelectedItem.Value;

                Roles.DeleteRole(delRole);

                Msg.Text = "Role '" + Server.HtmlEncode(delRole) + "' deleted.";


                // Re-bind roles to ListBox.

                rolesArray = Roles.GetAllRoles();
                RolesListBox.DataSource = rolesArray;
                RolesListBox.DataBind();
            }
            catch
            {
                Msg.Text = "Role '" + Server.HtmlEncode(delRole) + "' <u>not</u> deleted.";
            }

        }
    }
}