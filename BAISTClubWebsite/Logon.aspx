<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Logon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-top:20%;margin-left:40%">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                     Member Number:
                </asp:TableCell>
                <asp:TableCell>
                     <asp:TextBox ID="MemberNumber" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    Password:
                </asp:TableCell>
                <asp:TableCell>
                     <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
    <asp:Button ID="Submit" OnClick="Submit_Click" runat="server" Text="Login" /><br />
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        <br />
        To login as a Shareholder use MemberNumber: 2 and password: aa 
        <br/>
        To login as an Accociate use MemberNumber: 3 and password: dd
    </div>

</asp:Content>

