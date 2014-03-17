using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ward
/// </summary>
namespace Nhs.Staffing.DataEntry
{
    public class Ward
    {
        public string WardCode { get; set; }
        public string WardName { get; set; }
        public int NoOfBeds { get; set; }
        public string Division { get; set; }
    }
}