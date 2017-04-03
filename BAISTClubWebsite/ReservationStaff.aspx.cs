using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class ReservationStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            DateTime res = DateTime.Parse(ReservationList.SelectedItem.Value);
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            Message.Text = handler.CancelReservation(res, res, int.Parse(CancelNumber.Text)).ToString();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            int hours = int.Parse(Hour.SelectedItem.Text);
            int minutes = int.Parse(Minute.SelectedItem.Text);

            if (AMorPM.SelectedItem.Text == "PM" && hours != 12)
                hours += 12;

            string datetime = Date.Text;
            datetime += " " + hours.ToString() + ":" + minutes.ToString();

            DateTime DateT = DateTime.Parse(datetime);

            BAISTClubCodeHandler RequestHandler = new BAISTClubCodeHandler();

            if (RequestHandler.ReserveTeeTime(DateT, DateT, NumberOfPlayers.SelectedIndex + 1, MemberName1.Text, MemberName2.Text, MemberName3.Text, MemberName4.Text,
                Convert.ToInt32(NumberOfCarts.Text), PhoneNumber.Text, int.Parse(MemberNumber.Text),"Gold"))
                Message.Text = "Reservation was successfuly made.";
            else
                Message.Text = "Reservation could not be made.";
        }

        protected void NumberOfPlayers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (NumberOfPlayers.SelectedIndex == 0)
            {
                MemberName1.Enabled = true;
                MemberName2.Enabled = false;
                MemberName3.Enabled = false;
                MemberName4.Enabled = false;
                MemberName2.Text = "";
                MemberName3.Text = "";
                MemberName4.Text = "";
            }
            else if (NumberOfPlayers.SelectedIndex == 1)
            {
                MemberName1.Enabled = true;
                MemberName2.Enabled = true;
                MemberName3.Enabled = false;
                MemberName4.Enabled = false;
                MemberName3.Text = "";
                MemberName4.Text = "";
            }
            else if (NumberOfPlayers.SelectedIndex == 2)
            {
                MemberName1.Enabled = true;
                MemberName2.Enabled = true;
                MemberName3.Enabled = true;
                MemberName4.Enabled = false;
                MemberName4.Text = "";
            }
            else
            {
                MemberName1.Enabled = true;
                MemberName2.Enabled = true;
                MemberName3.Enabled = true;
                MemberName4.Enabled = true;
            }
        }

        protected void Load_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            handler.DisplayReservations(int.Parse(CancelNumber.Text), ReservationList);
        }

        protected void ReservationSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ReservationSelect.SelectedValue == "Member Reservation")
            {
                ReservationTable.Visible = true;
                TournamentTable.Visible = false;
            }
            else if (ReservationSelect.SelectedValue == "Tournament Reservation")
            {
                ReservationTable.Visible = false;
                TournamentTable.Visible = true;
            }
        }

        protected void TournamentSubmit_Click(object sender, EventArgs e)
        {
            int hours = int.Parse(TSHour.SelectedItem.Text);
            int minutes = int.Parse(TSMinute.SelectedItem.Text);

            if (TSAMPM.SelectedItem.Text == "PM" && hours != 12)
                hours += 12;

            string startdate = TSDate.Text;
            startdate += " " + hours.ToString() + ":" + minutes.ToString();

            DateTime TournamentStartDate = DateTime.Parse(startdate);

            hours = int.Parse(TEHour.SelectedItem.Text);
            minutes = int.Parse(TEMinute.SelectedItem.Text);

            if (TEAMPM.SelectedItem.Text == "PM" && hours != 12)
                hours += 12;

            string enddate = TEDate.Text;
            enddate += " " + hours.ToString() + ":" + minutes.ToString();

            DateTime TournamentEndDate = DateTime.Parse(enddate);
            
            Tournament NewTournament = new Tournament(Name.Text, TournamentStartDate, TournamentEndDate, TournamentStartDate, TournamentEndDate);
            BAISTClubCodeHandler RequestHandler = new BAISTClubCodeHandler();
            RequestHandler.AddTournament(NewTournament);
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

        protected void TSAMorPM_SelectedIndexChanged(object sender, EventArgs e)
        {
            TSHour.Items.Clear();
            if (TSHour.SelectedIndex == 0)
            {
                TSHour.Items.Add("6");
                TSHour.Items.Add("7");
                TSHour.Items.Add("8");
                TSHour.Items.Add("9");
                TSHour.Items.Add("10");
                TSHour.Items.Add("11");
            }
            else
            {
                TSHour.Items.Add("12");
                TSHour.Items.Add("1");
                TSHour.Items.Add("2");
                TSHour.Items.Add("3");
                TSHour.Items.Add("4");
                TSHour.Items.Add("5");
                TSHour.Items.Add("6");
                TSHour.Items.Add("7");
                TSHour.Items.Add("8");
            }
        }

        protected void TEAMorPM_SelectedIndexChanged(object sender, EventArgs e)
        {
            TEHour.Items.Clear();
            if (TEHour.SelectedIndex == 0)
            {
                TEHour.Items.Add("6");
                TEHour.Items.Add("7");
                TEHour.Items.Add("8");
                TEHour.Items.Add("9");
                TEHour.Items.Add("10");
                TEHour.Items.Add("11");
            }
            else
            {
                TEHour.Items.Add("12");
                TEHour.Items.Add("1");
                TEHour.Items.Add("2");
                TEHour.Items.Add("3");
                TEHour.Items.Add("4");
                TEHour.Items.Add("5");
                TEHour.Items.Add("6");
                TEHour.Items.Add("7");
                TEHour.Items.Add("8");
            }
        }
    }
}