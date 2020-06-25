using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Models
{
    public class MovieInformation
    {
        public class Rootobject
        {
            public MovieDetails[] Property1 { get; set; }
        }

        public class MovieDetails
        {
            public int year { get; set; }
            public string title { get; set; }
            public Info info { get; set; }
        }

        public class Info
        {
            public string[] directors { get; set; }
            public DateTime release_date { get; set; }
            public float rating { get; set; }
            public string[] genres { get; set; }
            public string image_url { get; set; }
            public string plot { get; set; }
            public int rank { get; set; }
            public int running_time_secs { get; set; }
            public string[] actors { get; set; }
        }

    }
}