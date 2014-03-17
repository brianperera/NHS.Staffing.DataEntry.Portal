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
        <div>
            <div>
                <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
            </div>
            <div class="gridtitle">
                <h3>
                    Current Staffing Data</h3>
            </div>
            <div class="subSections regularTable">
                <asp:GridView ID="StaffingData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CssClass="grid" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                    <Columns>
                        <asp:BoundField DataField="StartDate" HeaderText="Period Start Date" />
                        <asp:BoundField DataField="EndDate" HeaderText="Period End Date" />
                        <asp:BoundField DataField="Beds" HeaderText="Beds" />
                        <asp:BoundField DataField="OptimumStaffingRN" HeaderText="OptimumStaffingRN" />
                        <asp:BoundField DataField="OptimumStaffingHCA" HeaderText="OptimumStaffingHCA" />
                        <asp:BoundField DataField="SafeStaffingRN" HeaderText="SafeStaffingRN" />
                        <asp:BoundField DataField="SafeStaffingHCA" HeaderText="SafeStaffingHCA" />
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
                    <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                        <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown"
                             AutoPostBack="True">
                        </asp:DropDownList>
                    </span></li>
                    <li><span class="formTitleFields">Shift</span> <span class="formFieldControl">
                        <asp:DropDownList ID="Shift_DropDownList" runat="server" CssClass="defaultDropDown"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </span></li>
                    <li><span class="formTitleFields">Day</span> <span class="formFieldControl">
                        <asp:DropDownList ID="Day_DropDownList" runat="server" CssClass="defaultDropDown"
                            AutoPostBack="True">
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
                    <li><span class="formTitleFields">Period Start Date</span> <span class="formFieldControl">
                        <asp:TextBox ID="PeriodStartDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender ID="PeriodStartDate_CalendarExtender" TargetControlID="PeriodStartDate_TextBox"
                            runat="server" ViewStateMode="Enabled" Format="dd/MM/yyyy" />
                    </span></li>
                    <li><span class="formTitleFields">Period End Date</span> <span class="formFieldControl">
                        <asp:TextBox ID="PeriodEndDate_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender ID="PeriodEndDate_CalendarExtender" TargetControlID="PeriodEndDate_TextBox"
                            runat="server" ViewStateMode="Enabled" Format="dd/MM/yyyy" />
                    </span></li>
                    <li><span class="formTitleFields">Beds</span> <span class="formFieldControl">
                        <asp:TextBox ID="Beds_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
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
                        <asp:Button CssClass="submitButton" Text="Submit" runat="server" ID="SubmitButton"
                            OnClick="SubmitButton_Click" />
                    </span></li>
                </div>
            </div>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
        </div>
    </div>
</asp:Content>
