<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="StaffingPeriodDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.StaffingPeriodDataEntry" %>

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
                    <div>
                        <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
                    </div>
                    <div class="gridtitle">
                        <h3>
                            Current Staffing Periods</h3>
                    </div>
                    <div class="subSections regularTable periodGrid">
                        <asp:GridView ID="PeriodData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                            CssClass="grid" AllowPaging="True" AllowSorting="True" 
                            EnableSortingAndPagingCallbacks="True" 
                            onrowdatabound="PeriodData_Grid_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Index" HeaderText="Index" />
                                <asp:BoundField DataField="StartDate" HeaderText="Start Period" />
                                <asp:BoundField DataField="EndDate" HeaderText="End Period" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </div>
                </div>
                <div class="pagedata">
                    <div>
                        <div class="grid_24 error_msg">
                            <asp:Label ID="MessageLabel" runat="server" />
                        </div>
                        <ul class="formSection">
                            <li><span class="formTitleFields">Period Index (For Delete)</span> <span class="formFieldControl">
                                <asp:TextBox ID="PeriodIndex_TextBox" onkeypress="return isNumberKey(event)" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Start Period</span> <span class="formFieldControl">
                                <asp:TextBox ID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                <asp:CalendarExtender ID="PeriodStartDate_CalendarExtender" TargetControlID="PeriodStartDate_TextBox"
                                    runat="server" ViewStateMode="Enabled" Format="dd/MM/yyyy" />
                            </span></li>
                            <li><span class="formTitleFields">End Period</span> <span class="formFieldControl">
                                <asp:TextBox ID="PeriodEndDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                <asp:CalendarExtender ID="PeriodEndDate_CalendarExtender" TargetControlID="PeriodEndDate_TextBox"
                                    runat="server" ViewStateMode="Enabled" Format="dd/MM/yyyy" />
                            </span></li>
                        </ul>
                    </div>
                        <div>
                            <li><span>
                                <asp:Button CssClass="submitButton" Text="Submit" runat="server" ID="SubmitButton"
                                    OnClick="SubmitButton_Click" />
                            </span>
                            <span>
                                <asp:Button CssClass="deleteButton" Text="Delete" runat="server" 
                                    ID="DeleteButton" onclick="DeleteButton_Click1"/>
                            </span>
                            </li>
                        </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
