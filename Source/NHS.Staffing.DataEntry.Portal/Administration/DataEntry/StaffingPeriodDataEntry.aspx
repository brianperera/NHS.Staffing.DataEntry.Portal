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
                <div class="pagedata">
                    <div>
                        <div class="grid_24 error_msg">
                            <asp:Label ID="MessageLabel" runat="server" />
                        </div>
                        <ul class="formSection">
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
                        </span></li>
                    </div>
                    <asp:Label runat="server" ID="PeriodEntryFound_HiddenField" CssClass="hideRow" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
