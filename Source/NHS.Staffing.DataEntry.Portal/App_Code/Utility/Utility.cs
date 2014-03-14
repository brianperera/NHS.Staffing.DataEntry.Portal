using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utility
/// </summary>
namespace Nhs.Staffing.DataEntry.Portal.Utility
{
    public static class DateTimeHelper
    {
        public static DateTime FirstDateInWeek(this DateTime dt)
        {
            while (dt.DayOfWeek != System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat.FirstDayOfWeek)
                dt = dt.AddDays(-1);
            return dt;
        }

    }
}