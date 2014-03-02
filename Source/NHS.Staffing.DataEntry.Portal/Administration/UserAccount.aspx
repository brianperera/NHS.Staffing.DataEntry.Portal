<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="UserAccount.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.UserAccount" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="sections">
            <div class="pageHeader">
                <h2 id="CreateAccountPageHeader" visible="false" runat="server">
                    Create a New Account
                </h2>
                <h2 id="UpdateAccountPageHeader" visible="false" runat="server">
                    Update Account
                </h2>
            </div>
            <div class="sections">
                <div>
                    <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
                </div>
                <div class="accountInfo">
                    <table cellpadding="3" border="0">
                        <tr>
                            <td class="formTitleFields">
                                Username:
                            </td>
                            <td>
                                <asp:TextBox ID="UsernameTextbox" runat="server" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server" ControlToValidate="UserNameTextbox"
                                    ForeColor="red" Display="Static" ErrorMessage="Required" />
                            </td>
                        </tr>
                        <% if (ActionType == Nhs.Staffing.DataEntry.Portal.Constants.Create) %>
                        <% { %>
                        <tr>
                            <td class="formTitleFields">
                                Password:
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordTextbox" runat="server" TextMode="Password" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="PasswordTextbox"
                                    ForeColor="red" Display="Static" ErrorMessage="Required" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitleFields">
                                Confirm Password:
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordConfirmTextbox" runat="server" TextMode="Password" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="PasswordConfirmRequiredValidator" runat="server"
                                    ControlToValidate="PasswordConfirmTextbox" ForeColor="red" Display="Static" ErrorMessage="*" />
                                <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server" ControlToValidate="PasswordConfirmTextbox"
                                    ForeColor="red" Display="Static" ControlToCompare="PasswordTextBox" ErrorMessage="*" />
                            </td>
                        </tr>
                        <% } %>
                        <tr>
                            <td class="formTitleFields">
                                Email:
                            </td>
                            <td>
                                <asp:TextBox ID="EmailTextbox" runat="server" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="EmailTextbox"
                                    ForeColor="red" Display="Static" ErrorMessage="Required" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitleFields">
                                Role:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListRoles" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitleFields">
                                Is Active:
                            </td>
                            <td>
                                <asp:CheckBox ID="IsActive_RadioButton" Checked="true" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div class="subSections">
                                    <asp:Button CssClass="submitButton" ID="SubmitAccountDetails" OnClick="SubmitAccountDetails_OnClick"
                                        runat="server" />
                                    <asp:Button CssClass="submitButton" Text="Delete Account" ID="DeleteAccount" Visible="false"
                                        runat="server" OnClick="DeleteAccount_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
