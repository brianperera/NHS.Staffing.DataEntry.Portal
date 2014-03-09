﻿using System;
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
                if (shiftID == 1)
                    return displayDate;
                else
                    return string.Empty;
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
                if (shiftID == 1)
                    return day; 
                else
                    return string.Empty;
            }
        }

        public bool IsDaySummary { get; set; }
        public bool IsWeekSummary { get; set; }
    }
}