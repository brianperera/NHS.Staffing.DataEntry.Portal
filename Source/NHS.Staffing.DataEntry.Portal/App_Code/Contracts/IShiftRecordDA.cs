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
        void AddShiftRecord(ShiftRecord record);
        void UpdateShiftRecord(ShiftRecord record);
        void DeleteShiftRecord(ShiftRecord record);
    }
}