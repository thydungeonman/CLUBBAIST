<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReservationStaff.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.ReservationStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <asp:RadioButtonList OnSelectedIndexChanged="ReservationSelect_SelectedIndexChanged" ID="ReservationSelect" runat="server" AutoPostBack="True">
        <asp:ListItem Selected="True">Member Reservation</asp:ListItem>
        <asp:ListItem>Tournament Reservation</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    <asp:Table  ID="ReservationTable" runat="server">

         
        <asp:TableRow>
            <asp:TableCell>
                Date:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  ID="Date" TextMode="Date" runat="server"></asp:TextBox> YYYY-MM-DD<br />
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                Time:
            </asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                Number of Players: 
            </asp:TableCell>
            <asp:TableCell>
           <asp:RadioButtonList  OnSelectedIndexChanged="NumberOfPlayers_SelectedIndexChanged"  ID="NumberOfPlayers" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                MemberName 1:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="MemberName1" runat="server"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="MemberNumber: "></asp:Label> <asp:TextBox ID="MemberNumber" runat="server"></asp:TextBox><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                MemberName2:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="MemberName2" runat="server"></asp:TextBox><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                MemberName3:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="MemberName3" runat="server"></asp:TextBox><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                MemberName4:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="MemberName4" runat="server" ></asp:TextBox><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                NumberOfCarts:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="NumberOfCarts" runat="server"></asp:TextBox><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                PhoneNumber:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Message" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                <br />Current TeeTime Reservations
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                 MemberNumber:
            </asp:TableCell>
            <asp:TableCell>
                 <asp:TextBox ID="CancelNumber" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Load" OnClick="Load_Click" runat="server" Text="Load Reservations" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="ReservationList" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Cancel" OnClick="Cancel_Click" runat="server" Text="Cancel" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="TournamentTable" Visible="False" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Name:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  ID="Name"   runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Start Date:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  ID="TSDate" TextMode="Date" runat="server"></asp:TextBox>
            </asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Start Time:
            </asp:TableCell>
            <asp:TableCell>
                Hour: <asp:DropDownList ID="TSHour" runat="server">
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
        Minute:<asp:DropDownList ID="TSMinute" runat="server">
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>37</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
            <asp:ListItem>52</asp:ListItem>
               </asp:DropDownList>
        AMorPM <asp:DropDownList ID="TSAMPM" runat="server">
            <asp:ListItem>AM</asp:ListItem>
            <asp:ListItem>PM</asp:ListItem>
               </asp:DropDownList><br />
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                End Date:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  ID="TEDate" TextMode="Date" runat="server"></asp:TextBox>
            </asp:TableCell>
                </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                End Time:
            </asp:TableCell>
            <asp:TableCell>
                Hour: <asp:DropDownList ID="TEHour" runat="server">
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
        Minute:<asp:DropDownList ID="TEMinute" runat="server">
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>37</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
            <asp:ListItem>52</asp:ListItem>
               </asp:DropDownList>
        AMorPM <asp:DropDownList ID="TEAMPM" runat="server">
            <asp:ListItem>AM</asp:ListItem>
            <asp:ListItem>PM</asp:ListItem>
               </asp:DropDownList><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button OnClick="TournamentSubmit_Click" ID="TournamentSubmit" runat="server" Text="Submit" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="TournamentMessage" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


</asp:Content>

