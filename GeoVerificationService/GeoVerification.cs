using GeoVerificationService.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;

using Timer = System.Timers.Timer;

namespace GeoVerificationService
{
    public partial class GeoVerification : ServiceBase
    {
        static string API = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyB-W-mk7pC24H-VgBwwjLN7zf2EWrbURTY&latlng=";

        Thread REQUEST_GEO_01_THREAD, REQUEST_GEO_02_THREAD;
        Boolean REQUEST_GEO_01_THREAD_STATUS = false, REQUEST_GEO_02_THREAD_STATUS=false;

        Timer timer;
        private int TimerInterval = 5000;

        DbConnetion DB;
        public GeoVerification()
        {
            InitializeComponent();

           
        }

        protected override void OnStart(string[] args)
        {
            DB = new DbConnetion();

            if (timer == null)
            {
                timer = new Timer();
                timer.Interval = TimerInterval;
                timer.Elapsed += Timer_Elapsed;
                timer.Enabled = true;
                timer.Start();
            }

        }

        private void REQUEST_GEO_01_THREAD_FUNC()
        {

            List<REQUEST_GEO_01> list = DB.GET_REQUEST_GEO_01();
            if (list != null)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    List<Result> results = API_Request(list[i].Latitude, list[i].Longitude);
                    if (results != null)
                    {
                        DB.DELETE_REQUEST_GEO_01(list[i].id);

                        foreach (var item in results)
                        {
                            DB.ADD_REQUEST_GEO_DONE(list[i].Latitude, list[i].Longitude, item.formatted_address);
                        }
                    }
                    else
                    {
                        DB.DELETE_REQUEST_GEO_01(list[i].id);
                    }
                }
            }
        }
        private void REQUEST_GEO_02_THREAD_FUNC()
        {
            List<REQUEST_GEO_02> list = DB.GET_REQUEST_GEO_02();
            if (list != null)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    List<Result> results = API_Request(list[i].Latitude, list[i].Longitude);
                    if (results != null)
                    {
                        DB.DELETE_REQUEST_GEO_02(list[i].id);

                        foreach (var item in results)
                        {
                            DB.ADD_REQUEST_GEO_DONE(list[i].Latitude, list[i].Longitude, item.formatted_address);
                        }
                    }
                    else
                    {
                        DB.DELETE_REQUEST_GEO_02(list[i].id);
                    }
                }
            }
        }
        private void Timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            timer.Stop();

            REQUEST_GEO_01_THREAD = new Thread(new ThreadStart(REQUEST_GEO_01_THREAD_FUNC));
            REQUEST_GEO_02_THREAD = new Thread(new ThreadStart(REQUEST_GEO_02_THREAD_FUNC));
            REQUEST_GEO_01_THREAD.Start();
            REQUEST_GEO_02_THREAD.Start();

            timer.Start();
        }


        public List<Result> API_Request(string Latitude, string Longitude)
        {
            using (var client = new HttpClient())
            {
                var responseTask = client.GetAsync(API + Latitude + "," + Longitude);
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsStringAsync();
                    readTask.Wait();

                    Response response = JsonConvert.DeserializeObject<Response>(readTask.Result);

                    if (response.results.Count > 0)
                    {
                        return response.results;
                    }
                    else
                    {
                        return null;
                    }
                }
                return null;
            }
        }
        protected override void OnStop()
        {
            timer.Stop();
        }


    }
}
