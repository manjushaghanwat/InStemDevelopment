<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="InStemDevelopmentTest.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <label for="selectYear"> Select Year </label>    
    <asp:DropDownList ID="ddlMovieYears" runat="server" CssClass="DropdownList1"> </asp:DropDownList>
    
    </div>
    
    <h1> Movie List</h1>    
    <table id="table_id" class="tableStyle display">
    <thead>
        <tr>         
            <th>Title</th>
            <th>Release Date</th>           
            <th>Rating</th>         
            <th>Plot</th>         
            <th>actors</th>                   
            
        </tr>
    </thead>    
</table>

<script src="Scripts/jquery-3.3.1.js"> </script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">  
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


    <script type="text/javascript">
        $(document).ready(function ()
        {
            var t;
            var currentyear;                      
            $.ajax({
                type: "GET",
                url: 'http://localhost:49609/api/movies/getYears',
                dataType: 'json',
                success: function (data) {

                    var ddlmovieYears = $("[id*=ddlMovieYears]");
                    //ddlmovieYears.empty().append('<option selected="selected" value="0">Please select</option>');
                    $.each(data, function (index, item)
                    {                        
                        if (index == 0)
                        {
                            currentyear = item;                            
                        }
                        ddlmovieYears.append($("<option></option>").val(item).text(item));
                    });
                    $("#ddlMovieYears").prop('selectedIndex', 0);
                    displayMovies(currentyear);
                }
            });
        });

        $(".DropdownList1").change(function ()
        {
            var yearSelected = $(this).val();
            displayMovies(yearSelected);
        });

        $('#myInput').on( 'keyup', function () {
               t.search( this.value ).draw();
        });

        function displayMovies(yearSelected) {
            //Take the Id from the dropdown list when selected an item                                          
        
            $.ajax({
                type: "GET",
                url: 'http://localhost:49609/api/movies/getMoviesByYear/' + yearSelected,
                dataType: 'json',
                success: function (data) {
                    t = $('#table_id').DataTable();
                    t.clear().draw();
                    $.each(data, function (index, val) {
                        t.row.add([
                            val.title,
                            val.info.release_date,
                            val.info.rating,
                            val.info.plot,
                            val.info.actors
                        ]).draw(false);

                    });

                },

            });
        }
        
 </script>  

</asp:Content>


