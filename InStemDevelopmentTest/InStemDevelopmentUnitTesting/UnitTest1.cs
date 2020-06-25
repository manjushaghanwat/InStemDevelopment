using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication2.Controllers;
using Newtonsoft.Json;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication2.Models;
using static WebApplication2.Models.MovieInformation;

namespace InStemDevelopmentUnitTesting
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
       
        public void GetAllYears_ShouldReturnAllYears()
        {
               var testYears = GetYears();
               var controller = new ValuesController();
               var result = controller.GetYears() as List<int>;
               Assert.AreEqual(testYears.Count, result.Count);
        }

        private List<int> GetYears()
        {
            var testYears = new List<int>();
            testYears.Add(2018);
            testYears.Add(2017);
            testYears.Add(2016);
            testYears.Add(2015);            
            return testYears;
        }
    }
}
