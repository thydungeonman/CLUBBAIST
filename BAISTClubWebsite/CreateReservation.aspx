<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="CreateReservation.aspx.cs" Inherits="ClubBAIST.BAISTClubWebsite.UI.CreateReservation" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />

        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                Date:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="Date" TextMode="Date" runat="server"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                 Time: 
                            </asp:TableCell>
                            <asp:TableCell>
                                 Hour: <asp:DropDownList ID="Hour" runat="server">
                        
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
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
                    AMorPM <asp:DropDownList ID="AMorPM" AutoPostBack="true" OnSelectedIndexChanged="AMorPM_SelectedIndexChanged" runat="server">
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
                                <asp:RadioButtonList OnSelectedIndexChanged="NumberOfPlayers_SelectedIndexChanged"  ID="NumberOfPlayers" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                MemberName:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox  ID="MemberName2" runat="server"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                MemberName:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="MemberName3" runat="server"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                MemberName:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="MemberName4" runat="server"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Number Of Carts:
                            </asp:TableCell>
                            <asp:TableCell>
                               <asp:TextBox ID="NumberOfCarts" runat="server" TextMode="Number"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                PhoneNumber:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                <asp:TableCell>
                <asp:TextBox runat="server" ID="ViewTeeTimeBox" TextMode="Date"></asp:TextBox>
                    <asp:Button runat="server" ID="ViewTeeTime" OnClick="ViewTeeTime_Click" Text="Display TeeTimes"></asp:Button>
                    <div style="height:350px; width:auto; overflow:auto;">
                    <asp:Table Gridlines="Both" ID="TeeTimesTable" runat="server">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>Time</asp:TableHeaderCell>
                            <asp:TableHeaderCell>MemberName</asp:TableHeaderCell>
                            <asp:TableHeaderCell>MemberName</asp:TableHeaderCell>
                            <asp:TableHeaderCell>MemberName</asp:TableHeaderCell>
                            <asp:TableHeaderCell>MemberName</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                    </div>
                </asp:TableCell>
          </asp:TableRow>
        </asp:Table>
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" /><br /><br />
        <asp:Label ID="Message" runat="server" Text=""></asp:Label><br /><br />
                Current TeeTime Reservations
        <br />
        <asp:ListBox ID="ReservationList" runat="server"></asp:ListBox>
        <br />
        <asp:Button ID="Cancel"  OnClick="Cancel_Click" runat="server" Text="Cancel" />
        <br />
        <br />

        
        
    </div>
        </asp:Content>

