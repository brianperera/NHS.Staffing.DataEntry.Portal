<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.Dashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Operational Daily Level
            </h2>
        </div>
        <div class="section">
            <div class="subSections">
            <h3 style="display:inline">Week Commencing</h3>
                <span class="formTitleFieldsWithoutFloat">
                    <asp:TextBox ID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender Animated="true"  
                    ID="PeriodStartDate_CalendarExtender" TargetControlID="PeriodStartDate_TextBox" runat="server"
                            ViewStateMode="Enabled" />

<%--<asp:CalendarExtender Animated="true"  
                    ID="CalendarExtender1" TargetControlID="PeriodStartDate_TextBox" runat="server"
                            ViewStateMode="Enabled" Format="dd/MM/yyyy" TodaysDateFormat="d MMMM, yyyy" />--%>

                </span>
                <span class="shortFormTitleFieldsWithoutFloat">
                    <asp:Button ID="Refresh_Button" runat="server" Text="Refresh" CssClass="submitButton"/>
                </span>
            </div>
            <div class="clear"></div>
           <div class="subSections" runat="server">
            <asp:Repeater id="cdcatalog" runat="server">

            <HeaderTemplate>
            <table class="dashBoard">
                <!--Table headings-->
                <tr class="grayBackground">
                    <th>Day</th>
                    <th>Date</th>
                    <th>Shift</th>
                    <th>Beds</th>
                    <th colspan="2">Optimum staffing</th>
                    <th colspan="2">Today Trust</th>
                    <th colspan="2">Today Bank</th>
                    <th colspan="2">Today Non Trust</th>
                    <th colspan="2">Was the ward at optimum staffing?</th>
                    <th>Safe?</th>
                    <th>Mitigation action if UNSAFE</th>
                    <th>Mitigation action if SAFE</th>
                </tr>
                <!--Table headings-->
                <tr class="boldText">
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                    <th>RN</th>
                    <th>HCA</th>
                    <th>RN</th>
                    <th>HCA</th>
                    <th>RN</th>
                    <th>HCA</th>
                    <th>RN</th>
                    <th>HCA</th>
                    <th>RN</th>
                    <th>HCA</th>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                    <th>&nbsp</th>
                </tr>
            </HeaderTemplate>

            <ItemTemplate>

            <%# Eval("IsDaySummary").ToString() == "True" ? "<tr class='grayBackground'>" : ""%>
            <%# Eval("IsWeekSummary").ToString() == "True" ? "<tr class='darkGrayBackground'>" : ""%>

            <%# GetRowSummaryHtml(Eval("IsDaySummary").ToString(), Eval("IsWeekSummary").ToString())%>

            <%# GetColumnSummaryHtml(Eval("IsDaySummary").ToString(), Eval("IsWeekSummary").ToString(), Eval("Day").ToString(), Eval("DisplayDate").ToString(), Eval("Shift"), Eval("Beds").ToString())%>

            <td class="aquaBackground"><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).OptimumStaffingRN%> </td>
            <td class="aquaBackground"><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).OptimumStaffingHCA%> </td>

            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayTrustRN%> </td>
            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayTrustHCA%> </td>

            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayBankRN%> </td>
            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayBankHCA%> </td>

            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayNonTrustRN%> </td>
            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayNonTrustHCA%> </td>


            <td class="redBackground"><%# 
                ((int)Eval("TodayTrustRN") + (int)Eval("TodayBankRN") +
                                      (int)Eval("TodayNonTrustRN")) >= ((int)Eval("OptimumStaffingRN")) ? "Yes" : "No"
            %> </td>

            <td class="redBackground"><%# 
                ((int)Eval("TodayTrustHCA") + (int)Eval("TodayBankHCA") +
                                    (int)Eval("TodayNonTrustHCA")) >= ((int)Eval("OptimumStaffingHCA")) ? "Yes" : "No"
            %> </td>

            <td><%# 
                Eval("IsSafe").ToString() == "True" ? "Yes" : "No"
            %> </td>

            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).UnSafeMitigation%> </td>
            <td><%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).SafeMitigation%> </td>
            </tr>
            </ItemTemplate>

            <FooterTemplate>
            </table>
            </FooterTemplate>

            </asp:Repeater>
            </div>
        </div>
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
</asp:Content>
