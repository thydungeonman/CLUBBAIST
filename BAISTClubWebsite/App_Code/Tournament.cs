using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Tournament
{
    public string Name { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public Tournament(string name, DateTime StartT,DateTime EndT, DateTime StartD, DateTime EndD)
    {
        Name = name;
        StartTime = StartT;
        StartDate = StartD;
        EndTime = EndT;
        EndDate = EndD;
    }
}