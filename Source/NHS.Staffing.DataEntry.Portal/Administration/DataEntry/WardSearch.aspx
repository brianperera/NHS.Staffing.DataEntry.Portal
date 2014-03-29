<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="WardSearch.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.WardSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Wards
            </h2>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            <div>
                <div class="grid_24 error_msg">
                    <asp:Label ID="MessageLabel" runat="server" />
                </div>
                <div class="filterContainer">
                    <ul class="formSection">
                        <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                            <asp:TextBox runat="server" ID="wardNameTextbox"></asp:TextBox>
                        </span></li>
                        <li><span class="formTitleFields">Ward Code</span> <span class="formFieldControl">
                            <asp:TextBox runat="server" ID="wardCodeTextbox"></asp:TextBox>
                        </span></li>
                        <li>
                            <asp:Button CssClass="submitButton" Text="Search" runat="server" 
                                ID="SubmitButton" onclick="SubmitButton_Click" />
                            <span></span></li>
                    </ul>
                </div>
            </div>
            <div class="gridtitle">
                <h3>
                    Current Ward Data</h3>
            </div>
            <div class="subSections regularTable">
                <asp:GridView ID="WardData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CssClass="grid" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True"
                    PageSize="50">
                    <Columns>
                        <asp:HyperLinkField HeaderText="Ward Name" DataTextField="WardName" DataNavigateUrlFormatString="WardLookUpDataEntry.aspx?action=update&id={0}"
                            DataNavigateUrlFields="WardCode" />
                        <asp:BoundField DataField="WardCode" HeaderText="Ward Code" />
                        <asp:BoundField DataField="Division" HeaderText="Division" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle CssClass="altrow" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
