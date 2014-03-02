<%@ Page Title="Early Shift" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ShiftDataEntry.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.ShiftDataEntry" %>

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
                        <asp:DropDownList ID="Date_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
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
                        <asp:DropDownList ID="Beds_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
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
                        <asp:TextBox ID="RN_OptimumStaffing_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_OptimumStaffing_TextBox" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Safe Staffing</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_SafeStaffing_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_SafeStaffing_TextBox" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Trust</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayTrust_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayTrust_TextBox" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Bank</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayBank_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayBank_TextBox" runat="server"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <div class="formTitleFields">
                        Today Non Trust</div>
                    <div class="formTitleFields">
                        <asp:TextBox ID="RN_TodayNonTrust_TextBox" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:TextBox ID="HCA_TodayNonTrust_TextBox" runat="server"></asp:TextBox>
                    </div>
                </li>
            </ul>
            <ul class="formSection">
                <li>
                    <div class="longFormTitleFields">
                        Safe? - Matron or bleep holder to complete</div>
                    <div>
                        <asp:DropDownList ID="Safe_DropDownList" runat="server" CssClass="defaultDropDown">
                        </asp:DropDownList>
                    </div>
                    <div>
                </li>
                <li>
                    <div class="longFormTitleFields">
                        Mitigation action if UNSAFE - Matron or bleep holder to complete</div>
                    <div>
                        <asp:ListBox ID="MitigationAction_UNSAFE_ListBox" runat="server" CssClass="defaultListBox"></asp:ListBox>
                    </div>
                </li>
                <li>
                    <div class="longFormTitleFields">
                        Mitigation action if SAFE - Matron or bleep holder to complete</div>
                    <div>
                        <asp:ListBox ID="MitigationAction_SAFE_ListBox" runat="server" CssClass="defaultListBox"></asp:ListBox>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
