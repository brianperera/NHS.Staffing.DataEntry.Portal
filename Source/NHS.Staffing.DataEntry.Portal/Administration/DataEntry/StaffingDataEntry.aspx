﻿<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
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
            <div>
                <div class="grid_24 error_msg">
                    <asp:Label ID="MessageLabel" runat="server" />
                </div>
                <ul class="formSection">
                    <li><span class="formTitleFields">Period Start Date</span> <span class="formFieldControl">
                        <asp:TextBox ID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" ID="PeriodStartDate_CalendarExtender" TargetControlID="PeriodStartDate_TextBox" runat="server"
                            ViewStateMode="Enabled" />
                    </span></li>
                    <li><span class="formTitleFields">Period End Date</span> <span class="formFieldControl">
                        <asp:TextBox ID="PeriodEndDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" ID="PeriodEndDate_CalendarExtender" TargetControlID="PeriodEndDate_TextBox" runat="server"
                            ViewStateMode="Enabled" />
                    </span></li>
                </ul>
                <ul class="formSection">
                    <li><span class="formTitleFields">&nbsp</span> <span class="formTitleFieldsCenterText">
                        RN</span> <span class="formTitleFieldsWithoutFloat">HCA</span> </li>
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
                <div>
                    <li><span>
                        <asp:Button CssClass="submitButton" Text="Submit" runat="server" 
                            ID="SubmitButton" onclick="SubmitButton_Click"/>
                    </span></li>
                </div>
            </div>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
        </div>
</asp:Content>
