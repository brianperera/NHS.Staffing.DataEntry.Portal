using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShiftRecord
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class ShiftRecord
    {
        public bool ShiftRecordExists { get; set; }

        private string wardCode;
        public string WardCode 
        {
            get { return wardCode; }
            set 
            {
                if (wardCode != value)
                {
                    wardCode = value;

                    foreach (var item in DataRepository.Instance.AllWards)
                    {
                        if (item.WardCode == wardCode)
                            wardName = item.WardName;
                    }
                }
            }
        }

        private DateTime date;
        public DateTime Date 
        {
            get { return date; }
            set
            {
                if (date != value)
                {
                    date = value;

                    if (date != null)
                    {
                        displayDate = date.ToString("dd - MMM");
                        day = date.ToString("ddd");
                    }
                    else
                    {
                        displayDate = string.Empty;
                        day = string.Empty;
                    }
                }
            }
        }

        private int shiftID;
        public int ShiftID 
        {
            get { return shiftID; }
            set
            {
                if (shiftID != value)
                {
                    shiftID = value;

                    foreach (var item in DataRepository.Instance.AllShiftTypes)
                    {
                        if (shiftID == item.ShiftID)
                            shift = item.Name;
                    }
                }
            }
        }

        public int Beds { get; set; }
        public int OptimumStaffingRN { get; set; }
        public int OptimumStaffingHCA { get; set; }
        public string PlannedNumberRN { get; set; }
        public string PlannedNumberHCA { get; set; }
        public int SafeStaffingRN { get; set; }
        public int SafeStaffingHCA { get; set; }
        public string TodayTrustRN { get; set; }
        public string TodayTrustHCA { get; set; }
        public string TodayBankRN { get; set; }
        public string TodayBankHCA { get; set; }
        public string TodayNonTrustRN { get; set; }
        public string TodayNonTrustHCA { get; set; }
        public string DataEntryBy { get; set; }
        public bool IsSafe { get; set; }
        public bool? IsSafeAfterMitigation { get; set; }
        public string UnSafeMitigation { get; set; }
        public string SafeMitigation { get; set; }

        private string wardName;
        public string WardName
        {
            get { return wardName; }
        }

        private string displayDate;
        public string DisplayDate
        {
            get 
            {
                //if (shiftID == 1)
                //    return displayDate;
                //else
                //    return string.Empty;

                return displayDate;
            }
        }

        private string shift;
        public string Shift
        {
            get 
            {
                return shift;
            }
        }

        private string day;
        public string Day
        {
            set { day = value; }
            get 
            {
                //if (shiftID == 1)
                //    return day; 
                //else
                //    return string.Empty;
                return day; 
            }
        }

        public bool IsDaySummary { get; set; }
        public bool IsWeekSummary { get; set; }
    }
}