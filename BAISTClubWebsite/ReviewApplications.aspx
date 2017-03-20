<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReviewApplications.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.ReviewApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <asp:TextBox ID="ApplicationID" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Accept" OnClick="Accept_Click" runat="server" Text="Accept" />
    <asp:Button ID="Deny" OnClick="Deny_Click" runat="server" Text="Deny" />
    <asp:Button ID="Waitlist" OnClick="Waitlist_Click" runat="server" Text="Waitlist" />
    <asp:Button ID="OnHold" OnClick="OnHold_Click" runat="server" Text="Put On Hold" />
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    <asp:Table ID="ApplicationsTable" GridLines ="Both" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>ApplicationID</asp:TableHeaderCell>
            <asp:TableHeaderCell>Last Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>First Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Address</asp:TableHeaderCell>
            <asp:TableHeaderCell>Postal Code</asp:TableHeaderCell>
            <asp:TableHeaderCell>Phone</asp:TableHeaderCell>
            <asp:TableHeaderCell>Alternate Phone</asp:TableHeaderCell>
            <asp:TableHeaderCell>Email</asp:TableHeaderCell>
            <asp:TableHeaderCell>Birth Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Occupation</asp:TableHeaderCell>
            <asp:TableHeaderCell>Company Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Company Address</asp:TableHeaderCell>
            <asp:TableHeaderCell>Company PostalCode</asp:TableHeaderCell>
            <asp:TableHeaderCell>Company Phone</asp:TableHeaderCell>
            <asp:TableHeaderCell>Submit Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Sex</asp:TableHeaderCell>
            <asp:TableHeaderCell>Wants Share</asp:TableHeaderCell>
            <asp:TableHeaderCell>Waitlisted</asp:TableHeaderCell>
            <asp:TableHeaderCell>On Hold</asp:TableHeaderCell>
            <asp:TableHeaderCell>Shareholder Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Shareholder Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Shareholder Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Shareholder Date</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>

