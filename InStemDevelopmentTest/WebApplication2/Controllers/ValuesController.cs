using Newtonsoft.Json;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication2.Models;
using static WebApplication2.Models.MovieInformation;

namespace WebApplication2.Controllers
{
    [RoutePrefix("api/movies")]
    public class ValuesController : ApiController
    {
        // GET api/values
        [HttpGet]
        [Route("")]
        public IHttpActionResult Get()
        {
            var movieDetails = JsonConvert.DeserializeObject<List<MovieDetails>>(System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Content/moviedata.json")));

            var moviesResult = movieDetails.Where(x => x.year == 2013).OrderByDescending(y => y.title).Take(4);

            if (moviesResult == null)
            {
                return NotFound();
            }
            return Ok(moviesResult);
        }

        [HttpGet]
        [Route("getMoviesByYear/{year}")]
     
    public IHttpActionResult GetMoviesByYear(int year)
    {
        var movieDetails = JsonConvert.DeserializeObject<List<MovieDetails>>(System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Content/moviedata.json")));
        var moviesResult = movieDetails.Where(x => x.year == year).OrderByDescending(y => y.title).Take(4);
        if (moviesResult == null)
        {
            return NotFound();
        }
        return Ok(moviesResult);
    }

        [HttpGet]
        [Route("getMoviesBySearchCriteria/{title}")]
        //[Route("getMoviesBySearchCriteria")]
        public IHttpActionResult GetMoviesBySearchCrietria(string title)
        {
            var movieDetails = JsonConvert.DeserializeObject<List<MovieDetails>>(System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Content/moviedata.json")));
            var moviesResult = movieDetails.Where(x => x.title.ToLower().Contains(title.ToLower())).ToList();
            if (moviesResult == null)
            {
                var response = new HttpResponseMessage(HttpStatusCode.NotFound)
                {
                    Content = new StringContent("Movie not found", System.Text.Encoding.UTF8, "text/plain"),
                    StatusCode = HttpStatusCode.NotFound
                };
                throw new HttpResponseException(response);
            }            
            return Ok(moviesResult);
        }

        

        [HttpGet]
        [Route("getMoviesByTitle/{title}/{year}")]
        public IHttpActionResult GetMoviesByTitle(string title,int year)
        {
            var movieDetails = JsonConvert.DeserializeObject<List<MovieDetails>>(System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Content/moviedata.json")));

            var moviesResult = movieDetails.Where(x => x.title.ToLower().Equals(title) && x.year.Equals(year)).ToList();
            if (moviesResult == null)
            {
                var response = new HttpResponseMessage(HttpStatusCode.NotFound)
                {
                    Content = new StringContent("Movie not found", System.Text.Encoding.UTF8, "text/plain"),
                    StatusCode = HttpStatusCode.NotFound
                };
                throw new HttpResponseException(response);                
            }
            return Ok(moviesResult);
        }
        

        [HttpGet]
        [Route("getYears")]        
        public IHttpActionResult GetYears()
        {
            var movieDetails = JsonConvert.DeserializeObject<List<MovieDetails>>(System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/Content/moviedata.json")));

            List<int> yearsList = movieDetails.OrderByDescending(x => x.year).Select(x => x.year).Distinct().ToList();

            if (yearsList.Count == 0)
            {
                return NotFound();
            }
            return Ok(yearsList);
        }

    }
}
