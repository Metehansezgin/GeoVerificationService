﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GeoVerificationService.Models
{
    class REQUEST_GEO_01
    {
        [Key]
        public int id { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }

    }
}
