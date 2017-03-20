using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class ReviewApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            List<Application> Applications = Handler.GetApplications();
            foreach (Application item in Applications)
            {

                TableRow Row = new TableRow();
                TableCell Cell = new TableCell();
                Cell.Text = item.ApplicationID.ToString();
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.LastName;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.FirstName;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Address;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.PostalCode;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Phone;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.AltPhone;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Email;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.BirthDate.ToShortDateString();
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Occupation;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.CompanyName;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.CompanyAddress;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.CompanyPostalCode;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.CompanyPhone;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.SubmitDate.ToShortDateString();
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Sex.ToString();
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.WantsShare ? "Yes" : "No";
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Waitlisted ? "Yes" : "No";
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.Onhold ? "Yes" : "No";
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.ShareholderName1;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.ShareholderDate1.ToShortDateString();
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.ShareholderName2;
                Row.Cells.Add(Cell);

                Cell = new TableCell();
                Cell.Text = item.ShareholderDate2.ToShortDateString();
                Row.Cells.Add(Cell);

                ApplicationsTable.Rows.Add(Row);

            }

        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            if(Handler.AcceptApplication(int.Parse(ApplicationID.Text)))
                Message.Text = "Application was accepted successfully.";
            else
                Message.Text = "Application could not be accepted.";
        }

        protected void Deny_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            if (Handler.DenyApplication(int.Parse(ApplicationID.Text)))
                Message.Text = "Application was denied successfully.";
            else
                Message.Text = "Application could not be denied.";
        }

        protected void Waitlist_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            if(Handler.WaitlistApplication(int.Parse(ApplicationID.Text)))
                Message.Text = "Application was waitlisted successfully.";
            else
                Message.Text = "Application could not be waitlisted.";
        }

        protected void OnHold_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            if(Handler.HoldApplication(int.Parse(ApplicationID.Text)))
                Message.Text = "Application was put on hold successfully.";
            else
                Message.Text = "Application could not be put on hold.";
        }
    }
}