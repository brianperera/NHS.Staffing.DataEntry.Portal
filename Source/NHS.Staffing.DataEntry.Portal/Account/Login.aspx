﻿<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.Account_Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="blueBackGround">
        <div class="main">
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
                <LayoutTemplate>
                    <span class="failureNotification">
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                        ValidationGroup="LoginUserValidationGroup" />
                    <div class="accountInfo">
                        <fieldset class="login">
                            <legend>Operations Data Entry Portal</legend>
                            <span class="loginFields">
                                <div>
                                <span>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                                </span>
                                <span class="floatLeft">
                                    <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>                              
                                </span>
                                <span>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>                                      
                                </span>
                            </div>
                                <div>
                                <span>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </span>
                                <span class="floatLeft">
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                </span>
                                <span>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                    ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                </span>
                            </div>
                                <p>
                                <asp:CheckBox ID="RememberMe" runat="server" />
                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                            </p>
                            </span>
                            <span class="loginIcon">
                                <asp:Image runat="server" ImageUrl="~/Images/lock.png" />
                            </span>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup" />
                        </p>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </div>
    </div>
</asp:Content>
<%--            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>--%>
