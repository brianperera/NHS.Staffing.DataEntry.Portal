<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Nhs.Staffing.DataEntry.Portal.Dashboard" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="main">
        <div class="pageHeader">
            <h2>
                Operational Daily Level
            </h2>
        </div>
        <div class="section">
            <div class="subSections">
                <div class="formTitleFields">Week Commencing</div>
                <div>
                    <asp:DropDownList ID="WeekCommencing_DropDownList" runat="server" CssClass="defaultDropDown">
                    </asp:DropDownList>
                    <asp:Button ID="Refresh_Button" runat="server" Text="Refresh" CssClass="submitButton"/>
                </div>
            </div>
            <div class="subSections">
                <table class="dashBoard">
                    <thead>
                        <!--Table headings-->
                        <tr class="grayBackground">
                            <th>Day</th>
                            <th>Date</th>
                            <th>Shift</th>
                            <th>Beds</th>
                            <th colspan="2">Optimum staffing</th>
                            <th colspan="2">Today Trust</th>
                            <th colspan="2">Today Bank</th>
                            <th colspan="2">Today Non Trust</th>
                            <th colspan="2">Was the ward at optimum staffing?</th>
                            <th>Safe?</th>
                            <th>Mitigation action if UNSAFE</th>
                            <th>Mitigation action if SAFE</th>
                        </tr>
                        <!--Table headings-->
                        <tr class="boldText">
                            <th>&nbsp</th>
                            <th>&nbsp</th>
                            <th>&nbsp</th>
                            <th>&nbsp</th>
                            <th>RN</th>
                            <th>HCA</th>
                            <th>RN</th>
                            <th>HCA</th>
                            <th>RN</th>
                            <th>HCA</th>
                            <th>RN</th>
                            <th>HCA</th>
                            <th>RN</th>
                            <th>HCA</th>
                            <th>&nbsp</th>
                            <th>&nbsp</th>
                            <th>&nbsp</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Early shift data row-->
                        <tr>
                            <td>Mon</td>
                            <td>10-Feb</td>
                            <td>Early</td>
                            <td>14</td>
                            <td class="aquaBackground">3</td>
                            <td class="aquaBackground">2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td class="redBackground">No</td>
                            <td class="redBackground">No</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>                        
                        </tr>
                        <!--Late shift data row-->
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>Late</td>
                            <td>14</td>
                            <td class="aquaBackground">2</td>
                            <td class="aquaBackground">2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td class="redBackground">No</td>
                            <td class="redBackground">No</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>                        
                        </tr>
                        <!--Night shift data row-->
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>Night</td>
                            <td>14</td>
                            <td class="aquaBackground">2</td>
                            <td class="aquaBackground">1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td class="redBackground">No</td>
                            <td class="redBackground">No</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>                        
                        </tr>
                        <!--Day total data row - Needs to loop for 5 days of the week-->
                        <tr class="grayBackground">
                            <td>Mon Total</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>7</td>
                            <td>5</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>No</td>
                            <td>No</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>                        
                        </tr>
                        <!--Summary data row-->
                        <tr class="darkGrayBackground">
                            <td colspan="2">Week Commencing</td>
                            <td>2/10/2014</td>
                            <td>Total</td>
                            <td>48</td>
                            <td>33</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>No</td>
                            <td>No</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>                        
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
