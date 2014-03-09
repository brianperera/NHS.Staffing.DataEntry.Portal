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
        public int Index { get; set; }
        public string WardCode { get; set; }
        public DateTime Date { get; set; }
        public int ShiftID { get; set; }
        public int Beds { get; set; }
        public int OptimumStaffingRN { get; set; }
        public int OptimumStaffingHCA { get; set; }
        public int SafeStaffingRN { get; set; }
        public int SafeStaffingHCA { get; set; }
        public int TodayTrustRN { get; set; }
        public int TodayTrustHCA { get; set; }
        public int TodayBankRN { get; set; }
        public int TodayBankHCA { get; set; }
        public int TodayNonTrustRN { get; set; }
        public int TodayNonTrustHCA { get; set; }
        public string DataEntryBy { get; set; }
        public bool IsSafe { get; set; }
        public string UnSafeMitigation { get; set; }
        public string SafeMitigation { get; set; }
    }
}