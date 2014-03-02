<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="sections">
            <div class="pageHeader">
                <h2>
                    Create a New Account
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
                                    ControlToValidate="PasswordConfirmTextbox" ForeColor="red" Display="Static" ErrorMessage="Required" />
                                <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server" ControlToValidate="PasswordConfirmTextbox"
                                    ForeColor="red" Display="Static" ControlToCompare="PasswordTextBox" ErrorMessage="Confirm password must match password." />
                            </td>
                        </tr>
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
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="CreateUserButton" Text="Create User" OnClick="CreateUser_OnClick"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
