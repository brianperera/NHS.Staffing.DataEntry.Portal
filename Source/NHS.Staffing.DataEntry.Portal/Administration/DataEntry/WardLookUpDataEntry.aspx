<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="WardLookUpDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.WardLookUpDataEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Ward Data Entry
            </h2>
        </div>
<div>
            <div>
                <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
            </div>
            <div class="gridtitle">
                <h3>
                    Current Ward Data</h3>
            </div>
            <div class="subSections regularTable">
                <asp:GridView ID="WardData_Grid" AutoGenerateColumns="False" runat="server" CellPadding="3"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CssClass="grid" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                    <Columns>
                        <asp:BoundField DataField="WardCode" HeaderText="Ward Code" />
                        <asp:BoundField DataField="WardName" HeaderText="Ward Name" />
                        <%--<asp:BoundField DataField="Devision" HeaderText="Devision" />--%>
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
                    <li><span class="formTitleFields">Ward Code</span> <span class="formFieldControl">
                        <asp:TextBox ID="WardCode_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                    </span></li>
                    <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                        <asp:TextBox ID="WardName_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                    </span></li>
                    <li><span class="formTitleFields">Devision</span> <span class="formFieldControl">
                        <asp:TextBox ID="Devision_TextBox" runat="server" ViewStateMode="Enabled"></asp:TextBox>
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
</asp:Content>
