using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClubBAIST.BAISTClubWebsite.Domain;

public partial class InputScore : System.Web.UI.Page
{
    List<TextBox> boxes;
    const double MENWHITERATING = 69.1;
    const double MENBLUERATING = 70.6;
    const int MENWHITESLOPE = 121;
    const int MENBLUESLOPE = 128;
    const double WOMENREDRATING = 73d;
    const double WOMENWHITERATING = 75.3;
    const int WOMENREDSLOPE = 127;
    const int WOMENWHITESLOPE = 131;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        boxes = new List<TextBox>() { S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18 };
        if (Session["Sex"].ToString() == "M")
            TeeList.Items.Remove("Red");
        else
            TeeList.Items.Remove("Blue");
        TeeList.SelectedValue = "White";
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        int total = int.Parse(Front9Total.Text) + int.Parse(Back9Total.Text);
        Score NewScore = new Score(TeeList.SelectedValue,total);
        foreach (TextBox item in boxes)
        {
            try
            {
                NewScore.scores.Add(int.Parse(item.Text));
            }
            catch (Exception)
            {
                Message.Text = "Your scores are not correct";
            }
        }

        if (NewScore.scores.Count == 18)
            NewScore.HandicapDifferential = Math.Round(((NewScore.Total - float.Parse(Rating.Text)) * 113) / float.Parse(Slope.Text), 1);
        //if (Session["Sex"].ToString() == "M")
        //    if (TeeList.SelectedValue == "White")
        //        NewScore.HandicapDifferential = Math.Round(((NewScore.Total - MENWHITERATING) *  113) / MENWHITESLOPE,1);
        //    else
        //        NewScore.HandicapDifferential = Math.Round(((NewScore.Total - MENBLUERATING) * 113) / MENBLUESLOPE,1);
        //else
        //    if (TeeList.SelectedValue == "Red")
        //        NewScore.HandicapDifferential = Math.Round(((NewScore.Total - WOMENREDRATING) * 113) / WOMENREDSLOPE,1);
        //    else
        //        NewScore.HandicapDifferential = Math.Round(((NewScore.Total - WOMENWHITERATING) * 113) / WOMENWHITESLOPE,1);

        BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
        if (handler.RecordScore((int)Session["MemberNumber"], NewScore))
            Message.Text = "Score was recorded successfully";
        else
            Message.Text = "There seems to be an error in your score.";
        
    }

    protected void CalcTotal_Click(object sender, EventArgs e)
    {

        int fronttotal = 0;
        for (int i = 0; i < 9; i++)
        {
            fronttotal += int.Parse(boxes[i].Text);
        }
        Front9Total.Text = fronttotal.ToString();

        int backtotal = 0;
        for (int i = 9; i < 18; i++)
        {
            backtotal += int.Parse(boxes[i].Text);
        }
        Back9Total.Text = backtotal.ToString();
        foreach (TextBox item in boxes)
        {
            item.ReadOnly = true;
        }
        Submit.Enabled = true;
        Edit.Enabled = true;
        CalcTotal.Enabled = false;
    }



    protected void Factor_Click(object sender, EventArgs e)
    {

        BAISTClubCodeHandler handler = new BAISTClubCodeHandler();
        float factor = handler.GetCurrentHandicap((int)Session["MemberNumber"]);
        HandicapFactorLabel.Text = "Handicap Factor: " + factor;
    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        foreach (TextBox item in boxes)
        {
            item.ReadOnly = false;
        }
        CalcTotal.Enabled = true;
        Submit.Enabled = false;
        Edit.Enabled = false;
    }
}