using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

public partial class ViewAccountStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
        Balance.Text = "This member's balance is " + handler.ViewBalance(int.Parse(MemberNumber.Text)).ToString() + " dollars.";

        handler.ViewTransactions(int.Parse(MemberNumber.Text), TransactionTable);
        AddTable.Visible = true;
    }

    protected void Charge_Click(object sender, EventArgs e)
    {
        BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
        handler.AddTransaction(int.Parse(MemberNumber.Text), DateTime.Parse(ActivityDate.Text), Description.Text, double.Parse(Amount.Text));
    }
}