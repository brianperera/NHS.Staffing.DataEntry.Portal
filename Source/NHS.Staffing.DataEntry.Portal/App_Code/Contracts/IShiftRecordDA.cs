using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IShiftRecordDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public interface IShiftRecordDA
    {
        IList<ShiftRecord> GetShiftRecordsForDate(DateTime startDate, DateTime endDate);
        bool AddShiftRecord(ShiftRecord record);
        bool UpdateShiftRecord(ShiftRecord record);
        bool DeleteShiftRecord(ShiftRecord record);
    }
}