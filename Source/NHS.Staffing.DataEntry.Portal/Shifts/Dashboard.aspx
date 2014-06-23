<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Operational Daily Level
            </h2>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
        </asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="section">
                    <div class="subSections">
                        <ul class="formSection noBottonBorders noPadding">
                            <li style="float: left"><span class="shortFormTitleFieldsWithoutFloat">Week Commencing</span>
                                <span class="formFieldControl">
                                    <asp:TextBox ID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled"
                                        AutoPostBack="True"></asp:TextBox>
                                    <asp:CalendarExtender Animated="true" Format="dd/MM/yyyy" ID="PeriodStartDate_CalendarExtender"
                                        TargetControlID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled" />
                                </span></li>
                            <li><span class="shortFormTitleFieldsWithoutFloat">Ward Name</span> <span class="formFieldControl">
                                <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </span></li>
                        </ul>
                        <div class="clear">
                        </div>
                        <div id="Div1" class="subSections" runat="server">
                            <asp:Repeater ID="cdcatalog" runat="server" OnItemDataBound="cdcatalog_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="dashBoard">
                                        <!--Table headings-->
                                        <tr class="grayBackground">
                                            <th>
                                                Day
                                            </th>
                                            <th>
                                                Date
                                            </th>
                                            <th>
                                                Shift
                                            </th>
                                            <th>
                                                Beds
                                            </th>
                                            <th colspan="2">
                                                Optimum staffing
                                            </th>
                                            <th colspan="2">
                                                Minimum Safe Staffing
                                            </th>
                                            <th colspan="2">
                                                Today Trust
                                            </th>
                                            <th colspan="2">
                                                Today Bank
                                            </th>
                                            <th colspan="2">
                                                Today Non Trust
                                            </th>
                                            <th colspan="2">
                                                Was the ward at minimum safe staffing?
                                            </th>
                                            <th>
                                                Safe?
                                            </th>
                                            <th class="tableColumnLargeWidth">
                                                Mitigation action if UNSAFE
                                            </th>
                                        </tr>
                                        <!--Table headings-->
                                        <tr class="boldText">
                                            <th>
                                                &nbsp
                                            </th>
                                            <th>
                                                &nbsp
                                            </th>
                                            <th>
                                                &nbsp
                                            </th>
                                            <th>
                                                &nbsp
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                RN
                                            </th>
                                            <th>
                                                HCA
                                            </th>
                                            <th>
                                                &nbsp
                                            </th>
                                            <th>
                                                &nbsp
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("IsDaySummary").ToString() == "True" ? "<tr class='grayBackground hideRow'>" : ""%>
                                    <%# Eval("IsWeekSummary").ToString() == "True" ? "<tr class='darkGrayBackground hideRow'>" : ""%>
                                    <%# GetRowSummaryHtml(Eval("IsDaySummary").ToString(), Eval("IsWeekSummary").ToString())%>
                                    <%# GetColumnSummaryHtml(Eval("IsDaySummary").ToString(), Eval("IsWeekSummary").ToString(), Eval("Day").ToString(), Eval("DisplayDate").ToString(), Eval("Shift"), Eval("Beds").ToString())%>
                                    <td class="aquaBackground">
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).OptimumStaffingRN%>
                                    </td>
                                    <td class="aquaBackground">
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).OptimumStaffingHCA%>
                                    </td>
                                    <td class="aquaBackground">
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).SafeStaffingRN%>
                                    </td>
                                    <td class="aquaBackground">
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).SafeStaffingHCA%>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayTrustRN %>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayTrustHCA %>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayBankRN %>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayBankHCA %>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayNonTrustRN %>
                                    </td>
                                    <td>
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).TodayNonTrustHCA %>
                                    </td>
                                    <td runat="server" id="minSafeStaffingRN">
                                        <%# GetOptimumStaffingSummary(Eval("TodayTrustRN"), Eval("TodayBankRN"), Eval("TodayNonTrustRN"), Eval("SafeStaffingRN"))%>
                                    </td>
                                    <td runat="server" id="minSafeStaffingHCA">
                                        <%# GetOptimumStaffingSummary(Eval("TodayTrustHCA"), Eval("TodayBankHCA"), Eval("TodayNonTrustHCA"), Eval("SafeStaffingHCA"))%>
                                    </td>
                                    <td>
                                        <%# 
                Eval("IsSafe").ToString() == "True" ? "Yes" : "No"
                                        %>
                                    </td>
                                    <td class="tableColumnLargeWidth leftAlign">
                                        <%# ((Nhs.Staffing.DataEntry.ShiftRecord)Container.DataItem).UnSafeMitigation%>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
