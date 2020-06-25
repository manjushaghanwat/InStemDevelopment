<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="InStemDevelopmentTest.MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/MasterCss.css" rel="stylesheet" />
    <table class="tableStyle">
        <tr>
            <td class="tabletd">
                <asp:Label ID="lblMovieName" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="36px" ForeColor="Black"></asp:Label>
            </td>
            <td class="tabletd">
                <asp:Label ID="lblMoviewYear" runat="server" Font-Names="Arial" Font-Size="20px" ForeColor="Gray" Style="font-weight: 700"></asp:Label>
            </td>

            <td class="tabletd">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/star.jpg" Height="50px" ImageAlign="Middle" ViewStateMode="Disabled" Width="50px" />
            </td>

            <td class="tabletd">
                <asp:Label ID="lblRating" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

    <table class="tableStyle">
        <tr>
            <td class="tabletd">
                <asp:Label ID="lblRunningTime" runat="server" Font-Italic="True" Font-Names="Arial" Font-Size="16px"></asp:Label>
            </td>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Seperator.png" Height="50px" ImageAlign="Middle" ViewStateMode="Disabled" Width="20px" />
            </td>
            <td class="tabletd">
                <asp:Label ID="lblGenres" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="16px"></asp:Label>
            </td>
            <td>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Seperator.png" Height="50px" ImageAlign="Middle" ViewStateMode="Disabled" Width="20px" />
            </td>
            <td class="tabletd">
                <asp:Label ID="lblReleaseDate" Font-Names="Arial" Font-Size="16px" runat="server" Text=""></asp:Label>
    </table>
    <div class="divImage">
        <asp:Image ID="imageMovie" runat="server" Height="300px" Width="400px" />
    </div>

    <table class="tableStyle">
        <tr>
            <td>
                <asp:Label ID="lblPlot" runat="server" BorderStyle="None" Font-Names="Verdana" Font-Size="14px" ForeColor="Black"></asp:Label>

            <td>
        </tr>
    </table>

    <table>
        <tr>
            <td class="tabletd">
                <asp:Label ID="Label11" runat="server" Text="Rank:" Font-Bold="True" Font-Names="Arial" Font-Size="16px" ForeColor="#666666" ViewStateMode="Disabled"></asp:Label>
            </td>
            <td class="tabletd">
                <asp:Label ID="lblRank" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="tabletd">
                <asp:Label ID="Labelact" runat="server" Text="Stars:" Font-Bold="True" Font-Names="Arial" Font-Size="16px" ForeColor="#666666" ViewStateMode="Disabled"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblActors" runat="server" ForeColor="#70579D" Style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="tabletd">
                <asp:Label ID="LabelDirect" runat="server" Text="Director:" Font-Bold="True" Font-Names="Arial" Font-Size="16px" ForeColor="#666666" ViewStateMode="Disabled"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbldirectors" runat="server" Text="" ForeColor="#70579D" Style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>


