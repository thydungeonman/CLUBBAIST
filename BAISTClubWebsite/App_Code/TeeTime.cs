using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TeeTime
/// </summary>
public class TeeTime
{
    public DateTime Date { get; set; }
    public DateTime Time { get; set; }
    public string MemberName1  { get; set; }
    public string MemberName2 { get; set; }
    public string MemberName3 { get; set; }
    public string MemberName4 { get; set; }

    public TeeTime(DateTime date, DateTime time, string membername1, string membername2, string membername3,string membername4)
    {
        Date = date;
        Time = time;
        MemberName1 = membername1;
        MemberName2 = membername2;
        MemberName3 = membername3;
        MemberName4 = membername4;
    }
}