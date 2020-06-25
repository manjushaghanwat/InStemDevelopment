using InStemDevelopmentTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InStemDevelopmentTest
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridMovieInformation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink hl = (HyperLink)e.Row.FindControl("Link");
                if (hl != null)
                {
                    hl.NavigateUrl = "MovieDetails.aspx?title=" + hl.Text + "&year=" + e.Row.Cells[2].Text;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (var client = new System.Net.Http.HttpClient())
                {
                    client.BaseAddress = new Uri("http://localhost:49609/api/movies/");
                    //HTTP GET
                    var apiName = "getMoviesBySearchCriteria/" + txtsearchbyMovieName.Text.ToLower();
                    var responseTask = client.GetAsync(apiName);
                    responseTask.Wait();
                    var result = responseTask.Result;
                    if (result.IsSuccessStatusCode)
                    {

                        var readTask = result.Content.ReadAsAsync<MovieInformation.MovieDetails[]>();
                        readTask.Wait();
                        var movieDetails = readTask.Result;
                        gridMovieInformation.DataSource = movieDetails;
                        gridMovieInformation.DataBind();
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    } 
}