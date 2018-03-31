using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Text;

namespace ChbpayTools
{
    public class Tools
    {
        public static string ToJsonDate(object obj)
        {
            obj = JsonConvert.SerializeObject(obj);
            return obj.ToString();
        }
    }
}
