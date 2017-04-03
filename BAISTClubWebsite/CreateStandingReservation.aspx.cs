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
            
            string time = "";
            int hours = int.Parse(Hour.SelectedItem.Text);
            int minutes = int.Parse(Minute.SelectedItem.Text);

            if (AMorPM.SelectedItem.Text == "PM" && hours != 12)
                hours += 12;

            
            time = hours.ToString() + ":" + minutes.ToString();
            DateTime RequestedTime = DateTime.Parse(time);

            if (DayOfWeek.Text != "Monday" && DayOfWeek.Text != "Tuesday" && DayOfWeek.Text != "Wednesday" && DayOfWeek.Text != "Thursday" && DayOfWeek.Text != "Friday" && DayOfWeek.Text != "Saturday" && DayOfWeek.Text != "Sunday")
            {
                Message.Text = "Please enter a day of the week.";
                return;
            }
            

            bool confirmation = handler.CreateStandingReservation(Start, End, RequestedTime, DayOfWeek.Text, int.Parse(Session["MemberNumber"].ToString()), int.Parse(MemberNumber1.Text), int.Parse(MemberNumber2.Text),
                 int.Parse(MemberNumber3.Text), Session["MemberName"].ToString(), MemberName1.Text, MemberName2.Text, MemberName3.Text);
            Message.Text = confirmation.ToString();
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            Message.Text = Handler.CancelStandingReservation(int.Parse(Session["MemberNumber"].ToString()), DateTime.Now.Year).ToString();
        }

        protected void AMorPM_SelectedIndexChanged(object sender, EventArgs e)
        {
            Hour.Items.Clear();
            if (Hour.SelectedIndex == 0)
            {
                Hour.Items.Add("6");
                Hour.Items.Add("7");
                Hour.Items.Add("8");
                Hour.Items.Add("9");
                Hour.Items.Add("10");
                Hour.Items.Add("11");
            }
            else
            {
                Hour.Items.Add("12");
                Hour.Items.Add("1");
                Hour.Items.Add("2");
                Hour.Items.Add("3");
                Hour.Items.Add("4");
                Hour.Items.Add("5");
                Hour.Items.Add("6");
                Hour.Items.Add("7");
                Hour.Items.Add("8");
            }
        }
    }
}