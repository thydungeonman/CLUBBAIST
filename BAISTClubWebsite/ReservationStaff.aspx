<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReservationStaff.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.ReservationStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Date:<asp:TextBox ID="Date" TextMode="Date" runat="server"></asp:TextBox> YYYY-MM-DD<br />
    Time: 
        Hour: <asp:DropDownList ID="Hour" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
              </asp:DropDownList>
        Minute:<asp:DropDownList ID="Minute" runat="server">
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>37</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
            <asp:ListItem>52</asp:ListItem>
               </asp:DropDownList>
        AMorPM <asp:DropDownList ID="AMorPM" runat="server">
            <asp:ListItem>AM</asp:ListItem>
            <asp:ListItem>PM</asp:ListItem>
               </asp:DropDownList><br />
        Number of Players: 
        <asp:RadioButtonList  OnSelectedIndexChanged="NumberOfPlayers_SelectedIndexChanged"  ID="NumberOfPlayers" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:RadioButtonList>
    <br />
        <asp:TextBox ID="MemberName1" runat="server"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="MemberNumber: "></asp:Label> <asp:TextBox ID="MemberNumber" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="MemberName2" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="MemberName3" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="MemberName4" runat="server"></asp:TextBox><br />
        NumberOfCarts:<asp:TextBox ID="NumberOfCarts" runat="server"></asp:TextBox><br />
        PhoneNumber:<asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox><br />
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" /><br /><br />
        <asp:Label ID="Message" runat="server" Text=""></asp:Label><br /><br />
                Current TeeTime Reservations

        <br />
        MemberNumber: <asp:TextBox ID="CancelNumber" runat="server"></asp:TextBox><br />
        <asp:Button ID="Load" OnClick="Load_Click" runat="server" Text="Load Reservations" /><br />
        <asp:ListBox ID="ReservationList" runat="server"></asp:ListBox><br />
        <br />
        <asp:Button ID="Cancel" OnClick="Cancel_Click" runat="server" Text="Cancel" />

</asp:Content>

