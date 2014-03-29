<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="StaffingDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.StaffingDataEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Staffing Data
            </h2>
        </div>
        <div class="pagedata">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="grid_24 error_msg">
                            <asp:Label ID="MessageLabel" runat="server" />
                        </div>
                        <ul class="formSection">
                            <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                                <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown"
                                    AutoPostBack="True" OnSelectedIndexChanged="WardName_DropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </span></li>
                            <li><span class="formTitleFields">Shift</span> <span class="formFieldControl">
                                <asp:DropDownList ID="Shift_DropDownList" runat="server" CssClass="defaultDropDown"
                                    AutoPostBack="True" OnSelectedIndexChanged="Shift_DropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </span></li>
                            <li><span class="formTitleFields">Day</span> <span class="formFieldControl">
                                <asp:DropDownList ID="Day_DropDownList" runat="server" CssClass="defaultDropDown"
                                    AutoPostBack="True" OnSelectedIndexChanged="Day_DropDownList_SelectedIndexChanged">
                                    <asp:ListItem>Monday</asp:ListItem>
                                    <asp:ListItem>Tuesday</asp:ListItem>
                                    <asp:ListItem>Wednesday</asp:ListItem>
                                    <asp:ListItem>Thursday</asp:ListItem>
                                    <asp:ListItem>Friday</asp:ListItem>
                                    <asp:ListItem>Saturday</asp:ListItem>
                                    <asp:ListItem>Sunday</asp:ListItem>
                                </asp:DropDownList>
                            </span></li>
                        </ul>
                        <ul class="formSection">
                            <li><span class="formTitleFields">Date Range</span> <span class="formFieldControl">
                                <asp:DropDownList ID="DatePeriodRange_DropDownList" runat="server" CssClass="defaultDropDown"
                                    AutoPostBack="True" OnSelectedIndexChanged="DatePeriodRange_DropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </span></li>
                            <li><span class="formTitleFields">Beds</span> <span class="formFieldControl">
                                <asp:TextBox ID="Beds_TextBox" runat="server" ViewStateMode="Enabled" onkeypress="return isNumberKey(event)"></asp:TextBox>
                            </span></li>
                        </ul>
                        <ul class="formSection shortTextBox">
                            <li><span class="formTitleFields">&nbsp</span> <span class="formTitleFieldsCenterText shortSpan">
                                RN</span> <span class="formTitleFieldsWithoutFloat shortSpan">HCA</span> </li>
                            <li><span class="formTitleFields">Optimum Staffing</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_OptimumStaffing_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_OptimumStaffing_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Safe Staffing</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_SafeStaffing_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_SafeStaffing_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span></li>
                        </ul>
                        <asp:Label runat="server" ID="StaffingDataEntryFound_HiddenField" CssClass="hideRow" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div>
                    <span>
                        <asp:Button CssClass="submitButton" Text="Submit" runat="server" ID="SubmitButton"
                            OnClick="SubmitButton_Click" />
                    </span><span>
                        <asp:Button CssClass="deleteButton" Text="Delete" runat="server"
                            ID="DeleteButton" OnClick="DeleteButton_Click" Visible="false" />
                    </span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
