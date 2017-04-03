<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStaff.master" AutoEventWireup="true" CodeFile="CreateDailyReservationSheet.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.CreateDailyReservationSheet" %>

<script runat="server">

    protected void SelectedDay_Click(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <asp:Table ID="DailyReservationSheetTable" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Date to create sheet for:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="Day" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Today" runat="server" OnClick="Today_Click" Text="Create Sheet For Today" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="SelectedDay" runat="server" OnClick="SelectedDay_Click" Text="Create Sheet For Selected Day" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    
    
</asp:Content>

