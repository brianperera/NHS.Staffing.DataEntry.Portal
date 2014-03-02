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
    public partial class UserAccount : System.Web.UI.Page
    {
        public string ActionType 
        {
            get
            {
                string actionType = Constants.Create;

                if (Request.QueryString["action"] != null)
                    actionType = Request.QueryString["action"];

                return actionType;
            }
        }

        public string UserName
        {
            get
            {
                string username = string.Empty;

                if (Request.QueryString["username"] != null)
                    username = Request.QueryString["username"];

                return username;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the roles
                DropDownListRoles.DataSource = Roles.GetAllRoles();
                DropDownListRoles.DataBind();

                if (ActionType == Constants.Update)
                {
                    UpdateAccountPageHeader.Visible = true;
                    SubmitAccountDetails.Text = "Update Account";
                    DeleteAccount.Visible = true;

                    if (!string.IsNullOrEmpty(UserName))
                    {
                        MembershipUser currentUser = Membership.GetUser(UserName);                        
                        UsernameTextbox.Text = currentUser.UserName;
                        EmailTextbox.Text = currentUser.Email;
                        DropDownListRoles.SelectedValue = Roles.GetRolesForUser(UserName).FirstOrDefault();
                    }
                }
                else
                {
                    CreateAccountPageHeader.Visible = true;
                    SubmitAccountDetails.Text = "Create Account";
                }   
            }
        }

        public void SubmitAccountDetails_OnClick(object sender, EventArgs args)
        {
            if (ActionType == Constants.Update)
            {
                UpdateUserAccount();
            }
            else
            {
                CreateUserAccount();
            }
        }

        private void UpdateUserAccount()
        {
            throw new NotImplementedException();
        }

        private void CreateUserAccount()
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

                    // Assign the role to the user
                    if (!string.IsNullOrEmpty(DropDownListRoles.SelectedValue))
                        Roles.AddUserToRole(newUser.UserName, DropDownListRoles.SelectedValue);
                }
            }
            catch
            {
                Msg.Text = "An exception occurred creating the user.";
            }
        }

        protected void DeleteAccount_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(UserName))
            {
                Membership.DeleteUser(UserName);
                Response.Redirect("/ManageUsers.aspx");
            }
        }
}
}