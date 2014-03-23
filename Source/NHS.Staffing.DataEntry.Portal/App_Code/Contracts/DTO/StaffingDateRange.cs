using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StaffingDateRange
/// </summary>
public class StaffingDateRange
{
    public int Index { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public string DisplayPeriod { get; set; }
    public string EndDateUnknownText { get; set; }

	public StaffingDateRange()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}