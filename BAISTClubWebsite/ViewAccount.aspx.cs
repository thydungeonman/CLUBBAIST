using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

namespace ClubBAIST.BAISTClubWebsite.UI
{
    public partial class ViewAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BAISTClubCodeHandler Handler = new BAISTClubCodeHandler();
            Balance.Text = "Your current balance is " + Handler.ViewBalance((int)Session["MemberNumber"])+ " dollars.";

            Handler.ViewTransactions((int)Session["MemberNumber"], TransactionTable);
        }
    }
}