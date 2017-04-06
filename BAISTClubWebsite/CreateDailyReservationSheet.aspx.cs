using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class CreateDailyReservationSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Today_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            if (handler.AddDailyReservationSheet(DateTime.Now))
                Message.Text = "Members can now make reservations for Today.";
            else
                Message.Text = "There was an error creating the sheet for today.";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
            if (handler.AddDailyReservationSheet(DateTime.Parse(Day.Text)))
                Message.Text = "Members can now make reservations on the day you selected";
            else
                Message.Text = "There was an error creating the sheet for today.";

        }
    }
}