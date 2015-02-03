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
    public IList<StaffingData> AllStaffing;
    //public List<string> SafeMitigations;
    public List<string> UnSafeMitigations;
    public List<StaffingDateRange> AllStaffingDateRanges;

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

        StaffingDataDA stda = new StaffingDataDA();
        AllStaffing = stda.GetAllStaffing();

        StaffingDateRangeDA stfda = new StaffingDateRangeDA();
        AllStaffingDateRanges = stfda.GetAllStaffingDateRanges();

        //string safeMitigations = WebConfigurationManager.AppSettings["SafeMitigationActions"];
        //this.SafeMitigations = new List<string>();
        //this.SafeMitigations.AddRange(safeMitigations.Split('|'));

        MitigationActionsDA mtada = new MitigationActionsDA();
        this.UnSafeMitigations = mtada.GetAllMitigationActions();
    }

    public void RefreshMitigationActions()
    {
        MitigationActionsDA mtada = new MitigationActionsDA();
        this.UnSafeMitigations = mtada.GetAllMitigationActions();
    }

    public void RefreshStaffingData()
    {
        StaffingDataDA stda = new StaffingDataDA();
        AllStaffing = stda.GetAllStaffing();
    }

    public void RefreshPeriodData()
    {
        StaffingDateRangeDA stfda = new StaffingDateRangeDA();
        AllStaffingDateRanges = stfda.GetAllStaffingDateRanges();
    }

    public void RefreshWardData()
    {
        WardDA wda = new WardDA();
        AllWards = wda.GetAllWard();
    }
}