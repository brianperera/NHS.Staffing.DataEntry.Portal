using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IWardDA
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public interface IMitigationActionsDA
    {
        List<string> GetAllMitigationActions();
        bool AddMitigationAction(string action);
        bool UpdateMitigationAction(string action, string action2);
        bool DeleteMitigationAction(string action);
    }
}