<%@ Page Title="Manage Roles" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ManageUsers.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.ManageUsers" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="sections">
            <div class="pageHeader">
                <h2>
                    Manage Users
                </h2>
            </div>
            <div>
                <div class="subSections">
                    <asp:ListBox ID="ListBoxUsers" Width="100" runat="server" Rows="8" />
                </div>
                <div class="subSections">
                    <span>
                        <asp:Button CssClass="submitButton" Text="Update" 
                        ID="ButtonUpdateAccount" runat="server" onclick="ButtonUpdateAccount_Click" />
                    </span>
                </div>
            </div>
        </div>
        <div class="sections">
            <div class="pageHeader">
                <h2>
                    Manage Roles
                </h2>
            </div>
            <div>
                <div class="subSections">
                    <div>
                        <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
                    </div>
                    <p>Role name:</p><asp:TextBox ID="RoleTextBox" runat="server" />
                    <asp:Button CssClass="submitButton" Text="Create Role" ID="CreateRoleButton" runat="server" OnClick="CreateRole_OnClick" />                
                </div>
                <div class="subSections">
                    <asp:ListBox ID="RolesListBox" Width="100" runat="server" Rows="8" />               
                </div>
                <div class="subSections">
                    <asp:Button CssClass="submitButton" Text="Delete Role" ID="DeleteRoleButton" runat="server" OnClick="DeleteRole_OnClick" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
