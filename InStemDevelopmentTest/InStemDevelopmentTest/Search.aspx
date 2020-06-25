<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="InStemDevelopmentTest.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href="Content/MasterCss.css" rel="stylesheet" />
  <div class="panel panel-default panel-primary tableStyle">
    <table class="tableStyle">
        <tr>
            <td class="tabletd">
                <asp:Label ID="Label1"  runat="server" Text="Search by Movie Name:" Font-Bold="True" Font-Names="Verdana" Font-Size="16px" ForeColor="Black"></asp:Label>    

            </td>
            <td class="tabletd">
                <asp:TextBox ID="txtsearchbyMovieName" runat="server" CssClass="tabletd"></asp:TextBox>
            </td>
            <td class="tabletd">
                <asp:Button ID="btnSearch" CssClass="btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table> 
      
</div>
    

<asp:GridView ID="gridMovieInformation" runat="server" OnRowDataBound="gridMovieInformation_RowDataBound" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" BorderColor="Black" CellPadding="10" CellSpacing="5" EmptyDataText="No  Movies found for the search crietria." AutoGenerateColumns="False" CaptionAlign="Top" CssClass="mGrid1" PageSize="5" BorderStyle="Solid">
    <AlternatingRowStyle CssClass="tabletd" Font-Names="Arial" HorizontalAlign="Left" VerticalAlign="Top" BackColor="#CCCCFF" />
    <Columns>
        <asp:TemplateField HeaderText="Click here to See Movie Details"  ItemStyle-HorizontalAlign="Center"  FooterStyle-HorizontalAlign="Center">
        <ItemTemplate>
          <asp:HyperLink ID="link" runat="server" Text='<%# Eval("title") %>'></asp:HyperLink>
        </ItemTemplate>

            <ControlStyle CssClass="tabletd" />

<FooterStyle HorizontalAlign="Center"></FooterStyle>

            <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" Width="250px" />

<ItemStyle HorizontalAlign="Left" CssClass="tabletd" VerticalAlign="Top" Width="125px" Font-Bold="True" Font-Names="Arial" Font-Size="16px"></ItemStyle>
        </asp:TemplateField>
        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" ItemStyle-HorizontalAlign="left"  FooterStyle-HorizontalAlign="left" Visible="False">             
        <ControlStyle CssClass="tabletd" Width="300px" />
<FooterStyle HorizontalAlign="left"></FooterStyle>

        <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" />

        <ItemStyle CssClass="tabletd" Width="300px" />
        </asp:BoundField>
        <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" >             
        <ControlStyle CssClass="tabletd" Width="100px" />
        <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" />
        <ItemStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" />
        </asp:BoundField>
        <asp:BoundField DataField="info.release_date" HeaderText="Release Date" DataFormatString="{0:d}" >
        <ControlStyle CssClass="tabletd" />
        <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" />
        <ItemStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
        </asp:BoundField>
        <asp:BoundField DataField="info.rating" HeaderText="Rating" >
        <ControlStyle CssClass="tabletd" Width="50px" />
        <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
        <ItemStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
        </asp:BoundField>
        <asp:BoundField DataField="info.plot" HeaderText="Plot" >
        <ControlStyle CssClass="tabletd" />
        <HeaderStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" />
        <ItemStyle CssClass="tabletd" HorizontalAlign="Left" VerticalAlign="Top" Width="500px" />
        </asp:BoundField>
    </Columns>
    <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Top" />
    <HeaderStyle Font-Bold="True" Font-Names="Arial" Font-Size="14px" HorizontalAlign="Left" VerticalAlign="Top" CssClass="tabletd" BackColor="#CCCCCC" ForeColor="#000066" />
    <RowStyle Font-Names="Arial" ForeColor="#000066" HorizontalAlign="Left" VerticalAlign="Top" CssClass="tabletd" BackColor="White" />
    </asp:GridView>

</asp:Content>

