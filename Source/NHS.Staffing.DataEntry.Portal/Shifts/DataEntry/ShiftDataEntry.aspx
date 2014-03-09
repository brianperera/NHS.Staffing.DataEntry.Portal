<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ShiftDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.ShiftDataEntry" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Shift Data
            </h2>
        </div>
        <div class="pagedata">
            <ul class="formSection">
                <li>
                    <div class="formTitleFields">
                        Ward Code</div>
                    <div>
                        <asp:DropDownList ID="WardCode_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Ward Name</div>
                    <div>
                        <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Date</div>
                    <div>
                        <asp:TextBox ID="Date_TextBox" runat="server" Height="23px" Width="85px" 
                            ViewStateMode="Enabled"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="Date_TextBox" 
                            runat="server" ViewStateMode="Enabled" />
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Day</div>
                    <div>
                        <asp:DropDownList ID="Day_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Shift</div>
                    <div>
                        <asp:DropDownList ID="Shift_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Beds</div>
                    <div>
                        <asp:TextBox ID="Beds_TextBox" onkeypress="return isNumberKey(event)" runat="server" Height="20px" Width="80px"></asp:TextBox>
                    </div>
                </li>
            </ul>
            <ul class="formSection">
                <li>
                    <div class="formTitleFields">
                        &nbsp</div>
                    <div class="formTitleFields">
                        RN</div>
                    <div>
                        HCA</div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Optimum Staffing</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_OptimumStaffing_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_OptimumStaffing_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Safe Staffing</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_SafeStaffing_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_SafeStaffing_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Trust</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Bank</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Non Trust</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                    </div>
                </li>
            </ul>
            <ul class="formSection">
                <li>
                    <div class="longFormTitleFields">
                        Safe? - Matron or bleep holder to complete</div>
                    <div>
                        <asp:CheckBox ID="Safe_CheckBox" runat="server" />
                    </div>
                </li>
                <li>
                    <div class="longFormTitleFields">
                        Mitigation action if UNSAFE - Matron or bleep holder to complete</div>
                    <div>
                        <asp:DropDownList ID="SafeMitigation_DropDownList" runat="server" 
                            CssClass="defaultDropDown" Height="29px" Width="170px">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="longFormTitleFields">
                        Mitigation action if SAFE - Matron or bleep holder to complete</div>
                    <div>
                        <asp:DropDownList ID="UnSafeMitigation_DropDownList" runat="server" 
                            CssClass="defaultDropDown" Height="17px" Width="172px">
                        </asp:DropDownList>
                    </div>
                </li>
                 <li>
                    <div>
                        <asp:Button Text="Submit" runat="server" ID="SubmitButton" 
                            onclick="SubmitButton_Click"/>
                    </div>
                </li>
            </ul>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </div>
</asp:Content>
