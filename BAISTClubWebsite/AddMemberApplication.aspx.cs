using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;


namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class AddMemberApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            BAISTClubCodeHandler handler = new BAISTClubCodeHandler();

            
           
                Application NewApplication = new Application(LastName.Text, FirstName.Text, Address.Text, PostalCode.Text, Phone.Text,
                AltPhone.Text, Email.Text, DateTime.Parse(DateofBirth.Text), Occupation.Text, CompanyName.Text, CompanyAddress.Text,
                CompanyPostalCode.Text, CompanyPhone.Text, DateTime.Parse(SubmitDate.Text), char.Parse(Sexlist.SelectedValue),
                Share.Checked, ShareholderName1.Text, ShareholderName2.Text, DateTime.Parse(ShareholderDate1.Text), DateTime.Parse(ShareholderDate2.Text),Password.Text);
            bool confirmation = handler.AddApplication(NewApplication);
            if (confirmation)
            {
                Message.Text = "Application successfully submitted";
            }
            else
            {
                Message.Text = "It seems there was a problem with the application.";
            }
        }
    }
}