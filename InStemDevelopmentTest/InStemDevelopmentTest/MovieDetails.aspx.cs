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
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string title = Request.QueryString["title"];
                string year = Request.QueryString["year"];
                using (var client = new System.Net.Http.HttpClient())
                {
                    client.BaseAddress = new Uri("http://localhost:49609/api/movies/");
                    //HTTP GET
                    var apiName = "getMoviesByTitle/" + title.ToLower() + "/" + year;
                    var responseTask = client.GetAsync(apiName);
                    responseTask.Wait();
                    var result = responseTask.Result;
                    if (result.IsSuccessStatusCode)
                    {

                        var readTask = result.Content.ReadAsAsync<MovieInformation.MovieDetails[]>();
                        readTask.Wait();

                        var movieDetails = readTask.Result;
                        if (movieDetails != null)
                        {
                            foreach (MovieInformation.MovieDetails moviedetails in movieDetails)
                            {
                                lblMovieName.Text = moviedetails.title;
                                lblMoviewYear.Text = moviedetails.year.ToString();
                                if (moviedetails.info != null)
                                {
                                    lblReleaseDate.Text = moviedetails.info.release_date.ToString("MMMM dd, yyyy");

                                    TimeSpan ts = TimeSpan.FromSeconds(moviedetails.info.running_time_secs);
                                    // Converts the total miliseconds to the human readable time format
                                    lblRunningTime.Text = $"{ts.Hours} hours {ts.Minutes} minutes {ts.Seconds} seconds";

                                    lblRating.Text = moviedetails.info.rating.ToString();
                                    lblPlot.Text = moviedetails.info.plot.ToString();
                                    lblRank.Text = moviedetails.info.rank.ToString();
                                    foreach (string actorMovie in moviedetails.info.actors)
                                    {
                                        lblActors.Text += actorMovie + ",";
                                    }
                                    lblActors.Text = lblActors.Text.Substring(0, lblActors.Text.Length - 1);
                                    foreach (string directorMpovie in moviedetails.info.directors)
                                    {
                                        lbldirectors.Text += directorMpovie + ",";
                                    }
                                    lbldirectors.Text = lbldirectors.Text.Substring(0, lbldirectors.Text.Length - 1);

                                    foreach (string geners in moviedetails.info.genres)
                                    {
                                        lblGenres.Text += geners + ",";
                                    }
                                    lblGenres.Text = lblGenres.Text.Substring(0, lblGenres.Text.Length - 1);
                                    imageMovie.ImageUrl = moviedetails.info.image_url;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}