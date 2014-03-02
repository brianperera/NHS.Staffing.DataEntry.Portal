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
                    UsernameTextbox.Enabled = false;

                    if (!string.IsNullOrEmpty(UserName))
                    {
                        MembershipUser currentUser = Membership.GetUser(UserName);
                        UsernameTextbox.Text = currentUser.UserName;
                        EmailTextbox.Text = currentUser.Email;
                        DropDownListRoles.SelectedValue = Roles.GetRolesForUser(UserName).FirstOrDefault();
                        IsActive_RadioButton.Checked = currentUser.IsApproved;
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
            MembershipUser currentUser = Membership.GetUser(UserName);            
            currentUser.Email = EmailTextbox.Text;

            // remove user from current roles
            // the user will only be assinged 1 role
            Roles.RemoveUserFromRoles(UserName, Roles.GetRolesForUser(UserName));

            // add new role to user
            if (!string.IsNullOrEmpty(DropDownListRoles.SelectedValue))
            {
                Roles.AddUserToRole(UserName, DropDownListRoles.SelectedValue);
            }
            
            currentUser.IsApproved = IsActive_RadioButton.Checked;
            Membership.UpdateUser(currentUser);

            Response.Redirect("UserSearch.aspx");
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
                                                               passwordAnswer, false, out status);
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

                    // Set the is active property
                    newUser.IsApproved = IsActive_RadioButton.Checked;
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
                Response.Redirect("UserSearch.aspx");
            }
        }
    }
}