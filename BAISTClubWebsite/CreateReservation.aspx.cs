using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class CreateReservation : System.Web.UI.Page
    {

        protected void ViewTeeTime_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            List<TeeTime> Times = handler.ViewTeeTimes(DateTime.Parse(ViewTeeTimeBox.Text));
            
            for (int i = 0; i < Times.Count; i++)
            {
                TableRow Row = new TableRow();
                Row.Height = 10;
                TableCell Cell = new TableCell();

                //Cell.Text = Times[i].Date.ToShortDateString();
                //Row.Cells.Add(Cell);

                Cell = new TableCell();

                if (i % 2 == 0)
                    Row.BackColor = System.Drawing.Color.LightGray;
                if (Times[i].MemberName1 != "EMPTY")
                {
                    Row.Font.Bold = true;
                }

                Cell.Text = Times[i].Time.ToShortTimeString();
                Row.Cells.Add(Cell);
                Cell = new TableCell();
                Cell.Text = Times[i].MemberName1;
                Row.Cells.Add(Cell);
                Cell = new TableCell();
                Cell.Text = Times[i].MemberName2;
                Row.Cells.Add(Cell);
                Cell = new TableCell();
                Cell.Text = Times[i].MemberName3;
                Row.Cells.Add(Cell);
                Cell = new TableCell();
                Cell.Text = Times[i].MemberName4;
                Row.Cells.Add(Cell);

                TeeTimesTable.Rows.Add(Row);
            }
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

            if (RequestHandler.ReserveTeeTime(DateT, DateT, NumberOfPlayers.SelectedIndex + 1, Session["MemberName"].ToString(),MemberName2.Text,MemberName3.Text,MemberName4.Text,
                Convert.ToInt32(NumberOfCarts.Text), PhoneNumber.Text, Convert.ToInt32(Session["MemberNumber"])))
                Message.Text = "Reservation was successfuly made.";
            else
                Message.Text = "Reservation could not be made.";
        }

        private void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int num = 0;
                BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
                try
                {
                    num = int.Parse(Session["MemberNumber"].ToString());
                }
                catch (Exception)
                {
                    Message.Text = "You shouldn't be here right now.";
                }
                
                handler.DisplayReservations(num, ReservationList);
            }
        }


        protected void Cancel_Click(object sender, EventArgs e)
        {
            DateTime res = DateTime.Parse(ReservationList.SelectedItem.Value);
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            Message.Text = handler.CancelReservation(res, res, int.Parse(Session["MemberNumber"].ToString())).ToString();
        }

        protected void NumberOfPlayers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (NumberOfPlayers.SelectedIndex == 0)
            {
                MemberName2.Enabled = false;
                MemberName3.Enabled = false;
                MemberName4.Enabled = false;
                MemberName2.Text = "";
                MemberName3.Text = "";
                MemberName4.Text = "";
            }
            else if (NumberOfPlayers.SelectedIndex == 1)
            {
                MemberName2.Enabled = true;
                MemberName3.Enabled = false;
                MemberName4.Enabled = false;
                MemberName3.Text = "";
                MemberName4.Text = "";
            }
            else if (NumberOfPlayers.SelectedIndex == 2)
            {
                MemberName2.Enabled = true;
                MemberName3.Enabled = true;
                MemberName4.Enabled = false;
                MemberName4.Text = "";
            }
            else
            {
                MemberName2.Enabled = true;
                MemberName3.Enabled = true;
                MemberName4.Enabled = true;
            }
        }
    }
}