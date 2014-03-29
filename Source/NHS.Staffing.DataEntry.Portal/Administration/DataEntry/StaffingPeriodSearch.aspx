<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="StaffingPeriodSearch.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.StaffingPeriodSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Staffing Period Data Entry
            </h2>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
        </asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                        Current Staffing Periods</h3>
                </div>
                <div class="subSections regularTable periodGrid">
                    <asp:GridView ID="PeriodData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                        CssClass="grid" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True"
                        OnRowDataBound="PeriodData_Grid_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Index" HeaderText="Index" />
                            <asp:BoundField DataField="StartDate" HeaderText="Start Period" DataFormatString="<%$ AppSettings:DateTimeFormat %>" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Period" DataFormatString="<%$ AppSettings:DateTimeFormat %>" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
