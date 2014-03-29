<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="StaffingDataSearch.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.StaffingDataSearch" %>

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
        <div>
            <div>
                <div class="grid_24 error_msg">
                    <asp:Label ID="MessageLabel" runat="server" />
                </div>
                <div class="gridtitle">
                    <h3>
                        TODO: Filter goes here</h3>
                </div>
            </div>
            <div class="gridtitle">
                <h3>
                    Current Staffing Data</h3>
            </div>
            <div class="subSections regularTable">
                <asp:GridView ID="StaffingData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CssClass="grid" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True"
                    OnRowDataBound="StaffingData_Grid_RowDataBound">
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
                        <asp:BoundField DataField="SafeRN" HeaderText="Safe Staffing RN" />
                        <asp:BoundField DataField="SafeHCA" HeaderText="Safe Staffing HCA" />
                        <asp:HyperLinkField HeaderText="Edit" Text="Edit"
                        DataNavigateUrlFormatString="StaffingDataEntry.aspx?action=update&WardCode={0}&Shift={1}&StaffingDate={2}&StaffingDateRangeIndex={3}" DataNavigateUrlFields="WardCode,Shift,StaffingDate,StaffingDateRangeIndex" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <AlternatingRowStyle CssClass="altrow" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
