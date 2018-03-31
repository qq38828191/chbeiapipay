using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
namespace ChbpayDB
{
    public class DBS
    {
        static string connStr = @"server=localhost;user id=root;password=34023260;persistsecurityinfo=True;database=chbei;Charset=utf8";
        MySqlConnection con = new MySqlConnection(connStr);
        string json = string.Empty;


        #region order表查询 
        public object Order(string oid, int n)
        {
            object obj = "";
            string[] str = {
                string.Format("SELECT * FROM chbei_order"),
                string.Format("SELECT * FROM chbei_order WHERE order_id in ("+oid+")"),
                string.Format("SELECT * FROM chbei_order WHERE merchantname in (\""+oid+"\")"),
                string.Format("SELECT * FROM chbei_order WHERE merchantorders in (\"" +oid+"\")"),
                string.Format("SELECT * FROM ")
            };
            con.Open();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command(str[n], con));
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            DataSet da = dataSet.Tables[0].DataSet;
            foreach (DataRow dr in da.Tables[0].Rows)
            {
                json += "{";
                foreach (DataColumn dm in da.Tables[0].Columns)
                {
                    string dmstr = dm.ToString();//字段名
                    obj = dr[dm];//根据字段名取值  
                    json += string.Format(@"""" + dmstr + @"""" + ":" + @"""" + obj + @"""");
                    json += ",";
                }
                json = json.Substring(0, json.Length - 1);
                json += "},";
            }
            json = json.Substring(0, json.Length - 1);
            json = @"[" + json + "]";
            json = json.Replace("\\", "\\");
            con.Close();
            return json;
        }
        #endregion

        #region order方法
        public object OrderSelect(string oid, string kw)
        {
            if (oid == string.Empty && kw == string.Empty)
            {
                //订单列表查询
                Order(oid, 0);
            }
            else if (json == string.Empty)
            {
                return json = "{\"error\":" + "\"订单列表为空\"}";
            }
            if (oid == "" && kw == "1")
            {
                //订单编号查询
                Order(oid, 1);
            }
            else if (json == string.Empty)
            {
                return json = "{\"error\":" + "\"未找到订单编号\"}";
            }
            if (oid == "" && kw == "2")
            {
                //商户名称查询
                Order(oid, 2);
            }
            else if (json == string.Empty)
            {
                return json = "{\"error\":" + "\"未找到商户名称\"}";
            }
            if (oid == "" && kw == "3")
            {
                //商户订单号查询
                Order(oid, 3);
            }
            else if (json == string.Empty)
            {
                return json = "{\"error\":" + "\"未找到商户订单号\"}";
            }
            return json;
        }
        #endregion




        public MySqlCommand command(string cmdstr, MySqlConnection con)
        {
            MySqlCommand cmd = new MySqlCommand(cmdstr, con);
            return cmd;
        }
    }
}
