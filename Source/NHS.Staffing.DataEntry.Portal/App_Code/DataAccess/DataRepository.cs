using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhs.Staffing.DataEntry;
using System.Web.Configuration;

/// <summary>
/// Summary description for DataRepository
/// </summary>
public class DataRepository
{
    private static DataRepository instance = null;
    public IList<Ward> AllWards;
    public IList<ShiftType> AllShiftTypes;
    public List<string> SafeMitigations;
    public List<string> UnSafeMitigations;

    public static DataRepository Instance
    {
        get 
        {
            if (instance == null)
                instance = new DataRepository();
            return DataRepository.instance; 
        }
    }

	private DataRepository()
	{
        LoadBasicData();
	}

    private void LoadBasicData()
    {
        ShiftTypeDA sda = new ShiftTypeDA();
        AllShiftTypes = sda.GetAllShiftType();

        WardDA wda = new WardDA();
        AllWards = wda.GetAllWard();

        string safeMitigations = WebConfigurationManager.AppSettings["SafeMitigationActions"];
        this.SafeMitigations = new List<string>();
        this.SafeMitigations.AddRange(safeMitigations.Split('|'));

        string unSafeMitigations = WebConfigurationManager.AppSettings["UnsafeSafeMitigationActions"];
        this.UnSafeMitigations = new List<string>();
        this.UnSafeMitigations.AddRange(unSafeMitigations.Split('|'));
    }

    
}