﻿<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="StaffingDataSearch.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.StaffingDataSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="main">
        <div class="pageHeader">
            <h2>
                Staffing Data
            </h2>
        </div>
        <div>
            <div>
                <div class="grid_24 error_msg">
                    <asp:Label ID="MessageLabel" runat="server" />
                </div>
                <div class="filterContainer">
                    <ul class="formSection">
                        <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                            <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown">
                            </asp:DropDownList>
                        </span></li>
                        <li><span class="formTitleFields">Shift</span> <span class="formFieldControl">
                            <asp:DropDownList ID="Shift_DropDownList" runat="server" CssClass="defaultDropDown">
                            </asp:DropDownList>
                        </span></li>
                        <li><span class="formTitleFields">Day</span> <span class="formFieldControl">
                            <asp:DropDownList ID="Day_DropDownList" runat="server" CssClass="defaultDropDown">
                            </asp:DropDownList>
                        </span></li>
                        <li>
                            <asp:Button CssClass="submitButton" Text="Search" runat="server" ID="SubmitButton"
                                OnClick="SubmitButton_Click" />
                            <span></span></li>
                    </ul>
                </div>
            </div>
            <div class="clear">
            </div>
            <div class="gridtitle">
                <h3>
                    Current Staffing Data</h3>
            </div>
            <div class="subSections regularTable">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="StaffingData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                            CssClass="grid" AllowPaging="True" AllowSorting="True" OnRowDataBound="StaffingData_Grid_RowDataBound"
                            OnPageIndexChanging="StaffingData_Grid_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="PeriodStartDate" HeaderText="Period Start Date" DataFormatString="<%$ AppSettings:DateTimeFormat %>" />
                                <asp:BoundField DataField="PeriodEndDate" HeaderText="Period End Date" DataFormatString="<%$ AppSettings:DateTimeFormat %>" />
                                <asp:BoundField DataField="WardCode" HeaderText="Ward Code" />
                                <asp:BoundField DataField="WardName" HeaderText="Ward Name" />
                                <asp:BoundField DataField="Shift" HeaderText="Shift" />
                                <asp:BoundField DataField="StaffingDate" HeaderText="Day" />
                                <asp:BoundField DataField="Beds" HeaderText="Beds" />
                                <asp:BoundField DataField="OptimumRN" HeaderText="Optimum Staffing RN" />
                                <asp:BoundField DataField="OptimumHCA" HeaderText="Optimum Staffing HCA" />
                                <asp:BoundField DataField="SafeRN" HeaderText="Minimum Safe Staffing RN" />
                                <asp:BoundField DataField="SafeHCA" HeaderText="Minimum Safe Staffing HCA" />
                                <asp:HyperLinkField HeaderText="Edit" Text="Edit" DataNavigateUrlFormatString="StaffingDataEntry.aspx?action=update&WardCode={0}&Shift={1}&StaffingDate={2}&StaffingDateRangeIndex={3}"
                                    DataNavigateUrlFields="WardCode,Shift,StaffingDate,StaffingDateRangeIndex" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" CssClass="gridPagerStyle" />
                            <RowStyle ForeColor="#000066" />
                            <AlternatingRowStyle CssClass="altrow" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
