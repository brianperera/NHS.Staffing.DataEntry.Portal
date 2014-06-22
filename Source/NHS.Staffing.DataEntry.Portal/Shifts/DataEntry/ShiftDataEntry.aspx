<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ShiftDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.ShiftDataEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">    

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Shift Data
            </h2>
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="pagedata">
                    <div>
                        <div class="grid_24 error_msg">
                            <asp:Label ID="MessageLabel" runat="server" />
                        </div>
                        <ul class="formSection">
                            <li><span class="formTitleFields">Ward Name</span> <span class="formFieldControl">
                                <asp:DropDownList ID="WardName_DropDownList" runat="server" CssClass="defaultDropDown"
                                    OnSelectedIndexChanged="WardName_DropDownList_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </span></li>
                            <li><span class="formTitleFields">Date</span> <span class="formFieldControl">
                                <asp:TextBox ID="Date_TextBox" runat="server" ViewStateMode="Enabled" AutoPostBack="True"
                                    OnTextChanged="Date_TextBox_TextChanged"></asp:TextBox>
                                <asp:CalendarExtender Animated="true" Format="dd/MM/yyyy" ID="CalendarExtender1"
                                    TargetControlID="Date_TextBox" runat="server" ViewStateMode="Enabled" />
                            </span></li>
                            <li><span class="formTitleFields">Shift</span> <span class="formFieldControl">
                                <asp:DropDownList ID="Shift_DropDownList" runat="server" CssClass="defaultDropDown"
                                    OnSelectedIndexChanged="Shift_DropDownList_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </span></li>
                            <li><span class="formTitleFields">Beds</span> <span class="formFieldControl">
                                <asp:TextBox ID="Beds_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                            </span></li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                    <div>
                        <ul class="formSection shortTextBox">
                            <li><span class="formTitleFields">&nbsp</span> <span class="formTitleFieldsCenterText shortSpan">
                                RN</span> <span class="formTitleFieldsWithoutFloat shortSpan">HCA</span> </li>
                            <li><span class="formTitleFields">Optimum Staffing</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_OptimumStaffing_TextBox" ReadOnly="true" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_OptimumStaffing_TextBox" ReadOnly="true" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Minimum Safe Staffing</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_SafeStaffing_TextBox" ReadOnly="true" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_SafeStaffing_TextBox" ReadOnly="true" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Today Trust</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Today Bank</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                            </span></li>
                            <li><span class="formTitleFields">Today Non Trust</span> <span class="formFieldControl">
                                <asp:TextBox ID="RN_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span><span class="formFieldControl">
                                <asp:TextBox ID="HCA_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)"
                                    runat="server"></asp:TextBox>
                            </span></li>
                        </ul>
                        <ul class="formSection">
                            <li><span class="formTitleFields">Is the ward currently safe?</span> <span class="formFieldControl">
                                <asp:DropDownList runat="server" ID="safeDropdown" AutoPostBack="True" OnSelectedIndexChanged="safeDropdown_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="No"></asp:ListItem>
                                </asp:DropDownList>
                            </span>
                            </li>
                            <asp:Panel runat="server" ID="mitigationPanel" Visible="false">
                                <li><span>Please select the mitigation action being undertaken</span></li>
                                <li><span class="formTitleFields">Mitigation action</span> <span class="formFieldControl">
                                    <asp:DropDownList ID="UnSafeMitigation_DropDownList" runat="server" CssClass="defaultDropDown">
                                    </asp:DropDownList>
                                </span>
                                </li>
                            </asp:Panel>
                            <li><span>
                                <asp:Button CssClass="submitButton" Text="Submit" runat="server" ID="SubmitButton"
                                    OnClick="SubmitButton_Click" />
                            </span></li>
                        </ul>
                        <asp:HiddenField runat="server" ID="ShiftDataEntryFound_HiddenField" />
                        <input type="hidden" id="pageValid" runat="server" value="false" />
                        <asp:Panel runat="server" ID="unsafeSubmitConfirmationPanel" Visible="false" CssClass="overlay">
                            <ul class="formSection shortTextBox">
                                <li>
                                    <span>
                                        <p>
                                        This shift has been declared as unsafe and is currently trying to mitigate. 
                                        Please log back in before the start of the shift to complete a final safety sign off.
                                        <p>
                                        <p>
                                        Please adjust any staffing figures above if they have changed as a result of the mitigation action.
                                        <p>
                                    </span>
                                </li>    
                            </ul>
                            <asp:Button ID="okButton" runat="server" Text="Ok" OnClick="okButton_Click" CssClass="submitButton" />
                        </asp:Panel>
                        <asp:Panel runat="server" ID="adjustStaffingFiguresPanel" Visible="false" CssClass="overlay">
                            <ul class="formSection shortTextBox">
                                <li><span class="formTitleFields">Is the ward currently safe?</span> <span class="formFieldControl">
                                    <asp:DropDownList runat="server" ID="Overrride_safeDropdown" AutoPostBack="True" OnSelectedIndexChanged="safeDropdown_SelectedIndexChanged">
                                        <asp:ListItem Text="No" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                    </asp:DropDownList>
                                </span>
                                </li>
                                <li>
                                    <span class="formFieldControlHelpText">Please adjust any staffing figures above if they have changed as a result of the mitigation action.</span>
                                </li>
                                <li><span class="formTitleFields">&nbsp</span> <span class="formTitleFieldsCenterText shortSpan">
                                RN</span> <span class="formTitleFieldsWithoutFloat shortSpan">HCA</span> </li>
                                <li><span class="formTitleFields">Today Trust</span> <span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_RN_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                                </span><span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_HCA_TodayTrust_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                                </span></li>
                                <li><span class="formTitleFields">Today Bank</span> <span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_RN_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                                </span><span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_HCA_TodayBank_TextBox" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                                </span></li>
                                <li><span class="formTitleFields">Today Non Trust</span> <span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_RN_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)"
                                        runat="server"></asp:TextBox>
                                </span><span class="formFieldControl">
                                    <asp:TextBox ID="Overrride_HCA_TodayNonTrust_TextBox" onkeypress="return isNumberKey(event)"
                                        runat="server"></asp:TextBox>
                                </span></li>
                            </ul>
                            <asp:Button ID="staffingOverrrideButton" runat="server" Text="Submit" OnClick="staffingOverrrideButton_Click" CssClass="submitButton" />
                            <asp:Button ID="cancelPopupButton" runat="server" Text="Cancel" OnClick="cancelPopupButton_Click" CssClass="submitButton" />
                        </asp:Panel>
                        <asp:Panel runat="server" ID="StaffingWarningPanel" Visible="false" CssClass="smallOverlay">
                            <div style="width:100px; float:left">
                                <asp:Image ID="WarningImage" ImageUrl="~/Images/WarningIcon.jpg" Width="80" Height="80" runat="server" />
                            </div>
                            <div style="margin-top:20px">
                                <span class="formFieldControlHelpText">Staffing level has not met the minimum safe staffing requirements.</span>
                            </div>
                            <div class="clear"></div>
                            <div style="padding-left:80%">
                                <asp:Button ID="StaffingWarnningButton" Visible="false" runat="server" Text="OK" OnClick="StaffingWarnningButton_Click" CssClass="submitButton" />
                                <asp:Button ID="StaffingOverrideWarnningButton" Visible="false" runat="server" Text="OK" OnClick="StaffingOverrideWarnningButton_Click" CssClass="submitButton" />
                            </div>
                        </asp:Panel>
                        <div class="fade" runat="server" id="fade">
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
