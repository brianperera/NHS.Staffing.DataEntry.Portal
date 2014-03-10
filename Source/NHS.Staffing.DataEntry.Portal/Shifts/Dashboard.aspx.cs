using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nhs.Staffing.DataEntry.Portal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PeriodStartDate_TextBox.Attributes.Add("readonly", "readonly");
            }

            LoadData();
        }

        private void LoadData()
        {
            Dictionary<DateTime, ShiftRecord> records = new Dictionary<DateTime, ShiftRecord>();
            ShiftRecord daySummary = null;
            ShiftRecord weekSummary = new ShiftRecord();
            weekSummary.IsWeekSummary = true;
            List<ShiftRecord> modifiedList = new List<ShiftRecord>();

            ShiftRecordDA sda = new ShiftRecordDA();
            var shiftRecords = sda.GetShiftRecordsForDate(new DateTime(2014, 01, 01), new DateTime(2014, 01, 03));

            foreach (var item in shiftRecords)
            {

                if (records.ContainsKey(item.Date))
                {
                }
                else
                {
                    records.Add(item.Date, item);

                    if (modifiedList.Count > 1)
                    {
                        modifiedList.Add(daySummary);
                        AddData(weekSummary, daySummary);
                    }

                    daySummary = new ShiftRecord();
                    daySummary.IsDaySummary = true;
                }

                AddData(daySummary, item);
                modifiedList.Add(item);
            }

            if (modifiedList.Count > 1)
            {
                modifiedList.Add(daySummary);
                AddData(weekSummary, daySummary);
                modifiedList.Add(weekSummary);
            }

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

        protected string GetDailySummaryHtml(string day, string displayDate, object shift, string beds)
        {
            if (string.IsNullOrEmpty(day) && string.IsNullOrEmpty(displayDate) && shift == null && string.IsNullOrEmpty(beds))
                return string.Empty;
            else
                return string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", day, displayDate, shift==null?string.Empty:shift.ToString(), beds);
        }
    }
}