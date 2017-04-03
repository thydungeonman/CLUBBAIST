<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStaff.master" AutoEventWireup="true" CodeFile="ViewAccountStaff.aspx.cs" Inherits="ViewAccountStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    MemberNumber: <asp:TextBox ID="MemberNumber" TextMode="Number" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Submit" OnClick="Submit_Click" runat="server" Text="View Account" />
    <br />
    <br />
    <asp:Table Visible="false" ID="AddTable" runat="server">
        <asp:TableRow>
            <asp:TableCell>Activity Date: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="ActivityDate" TextMode="Date" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Description: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="Description" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Amount To Charge: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ToolTip="A negative value would mean that the member has paid a portion of thier fees." ID="Amount" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Charge" OnClick="Charge_Click" runat="server" Text="Submit" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />

    <asp:Label ID="Balance" runat="server" Text=""></asp:Label>
    <asp:Table ID="TransactionTable" GridLines="Both" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Post Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Activity Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Description</asp:TableHeaderCell>
            <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>

</asp:Content>

