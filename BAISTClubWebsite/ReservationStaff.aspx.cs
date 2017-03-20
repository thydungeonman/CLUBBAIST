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
                Convert.ToInt32(NumberOfCarts.Text), PhoneNumber.Text, int.Parse(MemberNumber.Text)))
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
    }
}