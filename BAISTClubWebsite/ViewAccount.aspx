<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAccount.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.ViewAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <asp:Label ID="Balance" runat="server" Text=""></asp:Label>
    <br />
    <asp:Table ID="TransactionTable" GridLines="Both" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Post Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Activity Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Description</asp:TableHeaderCell>
            <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>

