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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void CreateUser_OnClick(object sender, EventArgs args)
        {
            // Create new user and retrieve create status result.

            MembershipCreateStatus status;
            string passwordQuestion = "Question";
            string passwordAnswer = "Answer";

            try
            {
                MembershipUser newUser = Membership.CreateUser(UsernameTextbox.Text, PasswordTextbox.Text,
                                                               EmailTextbox.Text, passwordQuestion,
                                                               passwordAnswer, true, out status);
                if (newUser == null)
                {
                    Msg.Text = MembershipHelper.GetErrorMessage(status);
                }
                else
                {
                    Msg.Text = "User created successfully";
                }
            }
            catch
            {
                Msg.Text = "An exception occurred creating the user.";
            }
        }
    }
}