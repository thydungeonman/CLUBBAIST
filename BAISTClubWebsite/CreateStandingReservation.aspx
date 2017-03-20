<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateStandingReservation.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.CreateStandingReservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    MemberName: <asp:TextBox ID="MemberName1" runat="server"></asp:TextBox>
    MemberNumber: <asp:TextBox ID="MemberNumber1" runat="server"></asp:TextBox><br />
    MemberName: <asp:TextBox ID="MemberName2" runat="server"></asp:TextBox>
    MemberNumber: <asp:TextBox ID="MemberNumber2" runat="server"></asp:TextBox><br />
    MemberName: <asp:TextBox ID="MemberName3" runat="server"></asp:TextBox>
    MemberNumber: <asp:TextBox ID="MemberNumber3" runat="server"></asp:TextBox>
    <br />
    <br />
    Requested Day of Week: <asp:TextBox ID="DayOfWeek" runat="server"></asp:TextBox>
    Requested Tee Time: <asp:TextBox ID="TeeTime" runat="server"></asp:TextBox>
    <br />
    <br />
    Requested Start Date: <asp:TextBox ID="StartDate" runat="server"></asp:TextBox><br />
    Requested End Date: <asp:TextBox ID="EndDate" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Submit" OnClick="Submit_Click" runat="server" Text="Submit" />
    <br />
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>


    <asp:Button ID="Cancel" OnClick="Cancel_Click" runat="server" Text="Cancel Standing Reservation" />

</asp:Content>

