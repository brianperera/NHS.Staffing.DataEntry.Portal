using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StaffingData
/// </summary>
public class StaffingData
{
	public StaffingData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string WardCode { get; set; }
    public int Beds { get; set; }
    public int ShiftID { get; set; }
    public string StaffingDate { get; set; }
    public string Shift { get; set; }
    public int SafeRN { get; set; }
    public int SafeHCA { get; set; }
    public int OptimumRN { get; set; }
    public int OptimumHCA { get; set; }
    public int StaffingDateRangeIndex { get; set; }
}