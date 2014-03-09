using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IWardDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public interface IWardDA
    {
        IList<Ward> GetAllWard();
        void AddWard(Ward record);
        void UpdateWard(Ward record);
        void DeleteWard(Ward record);
    }
}