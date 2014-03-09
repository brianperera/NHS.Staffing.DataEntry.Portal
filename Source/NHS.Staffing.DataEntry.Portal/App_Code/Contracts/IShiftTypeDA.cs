using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IShiftTypeDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public interface IShiftTypeDA
    {
        IList<ShiftType> GetAllShiftType();
        void AddShiftType(ShiftType record);
        void UpdateShiftType(ShiftType record);
        void DeleteShiftType(ShiftType record);
    }
}