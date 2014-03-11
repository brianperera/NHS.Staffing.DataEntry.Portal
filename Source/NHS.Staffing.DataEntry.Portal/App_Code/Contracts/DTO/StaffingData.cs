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

    public DateTime StaffingDate { get; set; }
    public int SafeRN { get; set; }
    public int SafeHCA { get; set; }
    public int OptimumRN { get; set; }
    public int OptimumHCA { get; set; }
}