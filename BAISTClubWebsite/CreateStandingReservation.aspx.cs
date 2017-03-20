using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{ 
    public partial class CreateStandingReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool)Session["IsShareholder"])
            {
                Response.Redirect("~/CreateReservation.aspx");
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            DateTime Start = DateTime.Parse(StartDate.Text);
            DateTime End = DateTime.Parse(EndDate.Text);
            DateTime Time = DateTime.Parse(TeeTime.Text);

            bool confirmation = handler.CreateStandingReservation(Start, End, Time, DayOfWeek.Text, int.Parse(Session["MemberNumber"].ToString()), int.Parse(MemberNumber1.Text), int.Parse(MemberNumber2.Text),
                 int.Parse(MemberNumber3.Text), Session["MemberName"].ToString(), MemberName1.Text, MemberName2.Text, MemberName3.Text);
            Message.Text = confirmation.ToString();
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            Message.Text = Handler.CancelStandingReservation(int.Parse(Session["MemberNumber"].ToString()), DateTime.Now.Year).ToString();
        }
    }
}