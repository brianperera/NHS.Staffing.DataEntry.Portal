using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PeriodStartDate_TextBox.Attributes.Add("readonly", "readonly");

                WardName_DropDownList.DataSource = DataRepository.Instance.AllWards;
                WardName_DropDownList.DataTextField = "WardName";
                WardName_DropDownList.DataValueField = "WardCode";
                WardName_DropDownList.DataBind();
            }

            LoadData();
        }

        private void LoadData()
        {
            Dictionary<DateTime, ShiftRecord> records = new Dictionary<DateTime, ShiftRecord>();
            List<ShiftRecord> modifiedList = new List<ShiftRecord>();
            ShiftRecordDA sda = new ShiftRecordDA();

            DateTime SelectedDateTime = DateTime.Now;

            if (!string.IsNullOrEmpty(PeriodStartDate_TextBox.Text))
            {
                SelectedDateTime = DateTime.Parse(PeriodStartDate_TextBox.Text);
            }

            SelectedDateTime = Utility.DateTimeHelper.FirstDateInWeek(SelectedDateTime);
            PeriodStartDate_TextBox.Text = SelectedDateTime.ToShortDateString();

            var shiftRecords = sda.GetShiftRecordsForDate(SelectedDateTime, SelectedDateTime.AddDays(7));
            string selectedWard = WardName_DropDownList.SelectedItem.Text;

            List<DateTime> currentDateTimes = new List<DateTime>();
            currentDateTimes.Clear();

            //shiftRecords.

            foreach (var item in shiftRecords)
            {
                if (item.WardName.Equals(selectedWard))
                {
                    modifiedList.Add(new ShiftRecord
                    {
                        Beds = item.Beds,
                        DataEntryBy = item.DataEntryBy,
                        Date = currentDateTimes.Contains(item.Date) ? new DateTime() : item.Date,
                        Day = currentDateTimes.Contains(item.Date) ? string.Empty : item.Day,
                        IsDaySummary = item.IsDaySummary,
                        IsSafe = item.IsSafe,
                        IsSafeAfterMitigation = item.IsSafeAfterMitigation,
                        IsWeekSummary = item.IsWeekSummary,
                        OptimumStaffingHCA = item.OptimumStaffingHCA,
                        OptimumStaffingRN = item.OptimumStaffingRN,
                        PlannedNumberRN = item.PlannedNumberRN,
                        PlannedNumberHCA = item.PlannedNumberHCA,
                        SafeMitigation = item.SafeMitigation,
                        SafeStaffingHCA = item.SafeStaffingHCA,
                        SafeStaffingRN = item.SafeStaffingRN,
                        ShiftID = item.ShiftID,
                        ShiftRecordExists = item.ShiftRecordExists,
                        TodayBankHCA = item.TodayBankHCA,
                        TodayBankRN = item.TodayBankRN,
                        TodayNonTrustHCA = item.TodayNonTrustHCA,
                        TodayNonTrustRN = item.TodayNonTrustRN,
                        TodayTrustHCA = item.TodayTrustHCA,
                        TodayTrustRN = item.TodayTrustRN,
                        UnSafeMitigation = item.UnSafeMitigation,
                        WardCode = item.WardCode,
                    });

                    currentDateTimes.Add(item.Date);

                    //currentDateTimes.Add(item.Date);

                    //if (records.ContainsKey(item.Date))
                    //{
                    //}
                    //else
                    //{
                    //    records.Add(item.Date, item);

                    //    //if (modifiedList.Count > 1)
                    //    //{
                    //    //    modifiedList.Add(daySummary);
                    //    //    AddData(weekSummary, daySummary);
                    //    //}

                    //    daySummary = new ShiftRecord();
                    //    daySummary.IsDaySummary = true;
                    //}

                    //AddData(daySummary, item);
                    //modifiedList.Add(item);

                }
            }

            //if (modifiedList.Count > 1)
            //{
            //    modifiedList.Add(daySummary);
            //    AddData(weekSummary, daySummary);
            //    modifiedList.Add(weekSummary);
            //}

            this.cdcatalog.DataSource = modifiedList;
            this.cdcatalog.DataBind();
        }

        private void AddData(ShiftRecord summaryRecord, ShiftRecord dataRecord)
        {
            summaryRecord.OptimumStaffingRN += dataRecord.OptimumStaffingRN;
            summaryRecord.OptimumStaffingHCA += dataRecord.OptimumStaffingHCA;
            summaryRecord.TodayTrustRN += dataRecord.TodayTrustRN;
            summaryRecord.TodayTrustHCA += dataRecord.TodayTrustHCA;
            summaryRecord.TodayBankRN += dataRecord.TodayBankRN;
            summaryRecord.TodayBankHCA += dataRecord.TodayBankHCA;
            summaryRecord.TodayNonTrustRN += dataRecord.TodayNonTrustRN;
            summaryRecord.TodayNonTrustHCA += dataRecord.TodayNonTrustHCA;
        }

        protected string GetColumnSummaryHtml(object IsDaySummary, object IsWeekSummary, object day, object displayDate, object shift, object beds)
        {
            if (day == null && displayDate == null && shift == null && beds == null)
            {
                return string.Empty;
            }
            else if (string.Equals(IsDaySummary, "True"))
            {
                return "<td class='grayBackground' colspan='4'></td>";
            }
            else if (string.Equals(IsWeekSummary, "True"))
            {
                return "<td class='darkGrayBackground' colspan='4'></td>";
            }
            else
            {
                return string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", day, displayDate, shift == null ? string.Empty : shift.ToString(), beds);
            }
        }

        protected string GetRowSummaryHtml(string IsDaySummary, string IsWeekSummary)
        {
            if (string.Equals(IsDaySummary, "True"))
            {
                return "<tr class='grayBackground hideRow'>";
            }
            else if (string.Equals(IsWeekSummary, "True"))
            {
                return "<tr class='darkGrayBackground hideRow'>";
            }
            else
            {
                return string.Format("<tr>");
            }
        }

        protected string GetOptimumStaffingSummary(object todayTrustString, object todayBankString, object todayNonTrustString, object optimumStaffingString)
        {
            int todayTrust;
            int todayBank;
            int todayNonTrust;
            int optimumStaffing;

            int.TryParse(todayTrustString.ToString(), out todayTrust);
            int.TryParse(todayBankString.ToString(), out todayBank);
            int.TryParse(todayNonTrustString.ToString(), out todayNonTrust);
            int.TryParse(optimumStaffingString.ToString(), out optimumStaffing); 

            return (todayTrust + todayBank + todayNonTrust >= optimumStaffing) ? "Yes" : "No";
        }

        protected void cdcatalog_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlTableCell minSafeStaffingRNText = e.Item.FindControl("minSafeStaffingRN") as HtmlTableCell;

                string minSafeStaffingBackgroundClass = string.Empty;

                // If yes, green else red 
                // at minimum safe staffing? RN
                if (null != minSafeStaffingRNText)
                {
                    minSafeStaffingBackgroundClass = (minSafeStaffingRNText.InnerText.ToUpperInvariant().Contains("YES")) 
                                                        ? "greenBackgroundDashboard" 
                                                        : "redBackgroundDashboard";
                    minSafeStaffingRNText.Attributes.Add("class", minSafeStaffingBackgroundClass);                   
                }

                // at minimum safe staffing? HCA
                HtmlTableCell minSafeStaffingHCAText = e.Item.FindControl("minSafeStaffingHCA") as HtmlTableCell;

                if (null != minSafeStaffingHCAText)
                {
                    minSafeStaffingBackgroundClass = (minSafeStaffingHCAText.InnerText.ToUpperInvariant().Contains("YES")) 
                                                        ? "greenBackgroundDashboard" 
                                                        : "redBackgroundDashboard";
                    minSafeStaffingHCAText.Attributes.Add("class", minSafeStaffingBackgroundClass); 
                }
            }
        }
}
}