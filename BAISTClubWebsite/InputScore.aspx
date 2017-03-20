<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InputScore.aspx.cs" Inherits="InputScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    Tee: <asp:DropDownList ID="TeeList" runat="server">
        <asp:ListItem>Red</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
         </asp:DropDownList>
    Course Rating: <asp:TextBox ID="Rating" runat="server"></asp:TextBox>
    Slope: <asp:TextBox ID="Slope" runat="server"></asp:TextBox>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>Hole:</asp:TableCell>
            <asp:TableCell>1</asp:TableCell>
            <asp:TableCell>2</asp:TableCell>
            <asp:TableCell>3</asp:TableCell>
            <asp:TableCell>4</asp:TableCell>
            <asp:TableCell>5</asp:TableCell>
            <asp:TableCell>6</asp:TableCell>
            <asp:TableCell>7</asp:TableCell>
            <asp:TableCell>8</asp:TableCell>
            <asp:TableCell>9</asp:TableCell>
            <asp:TableCell>Total</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Shots:</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S1"   runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S2" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S3" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S4" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S5" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S6" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S7" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell> 
                <asp:TextBox  Width="33" ID="S8" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox Width="33" ID="S9" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox Width="33" ID="Front9Total" runat="server" Text="0" ReadOnly="True"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

        <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>Hole:</asp:TableCell>
            <asp:TableCell>10</asp:TableCell>
            <asp:TableCell>11</asp:TableCell>
            <asp:TableCell>12</asp:TableCell>
            <asp:TableCell>13</asp:TableCell>
            <asp:TableCell>14</asp:TableCell>
            <asp:TableCell>15</asp:TableCell>
            <asp:TableCell>16</asp:TableCell>
            <asp:TableCell>17</asp:TableCell>
            <asp:TableCell>18</asp:TableCell>
            <asp:TableCell>Total</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Shots:</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S10" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S11" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S12" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S13" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S14" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S15" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox  Width="33" ID="S16" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox   Width="33" ID="S17" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox Width="33" ID="S18" runat="server" TextMode="Number" Text="0"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox Width="33" ID="Back9Total" runat="server" Text="0" Enabled="True" ReadOnly="True"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="CalcTotal" runat="server" OnClick="CalcTotal_Click" Text="Finalize Scores" />
    <asp:Button ID="Edit" runat="server" OnClick="Edit_Click" Text="Edit Scores" Enabled="False" />
    <br />
    <asp:Button ID="Submit" OnClick="Submit_Click" runat="server" Enabled="false" Text="Submit" />
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:Label ID="HandicapFactorLabel" runat="server" Text="Handicap Factor: "></asp:Label>
    <br />
    <asp:Button ID="Factor" runat="server" OnClick="Factor_Click" Text="Calculate Handicap Factor" />
    

</asp:Content>

