using MySql.Data.MySqlClient;
using Newtonsoft.Json;
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
    public class DB
    {
        static string connStr = @"server=localhost;user id=root;password=34023260;persistsecurityinfo=True;database=chbei;Charset=utf8";
        MySqlConnection con = new MySqlConnection(connStr);
        string json = string.Empty;

        #region 查询是否存在
        /// <summary>
        /// 查询是否存在
        /// </summary>
        /// <param name="fromname">表名</param>
        /// <param name="fieldname">字段名称</param>
        /// <param name="value">数据</param>
        /// <returns></returns>
        public bool SelectDate(string fromname, string fieldname, string value)
        {

            string sql = string.Format("select {0} from {1} where {2} = {3}",
                fieldname,
                fromname,
                fieldname,
                value);//格式化SQL查询语句

            con.Open();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dateread = cmd.ExecuteReader();
            if (dateread.HasRows)
            {
                con.Close();
                return false;
            }
            else
            {
                con.Close();
                return true;
            }

        }
        #endregion

        #region 后台登录查询
        public bool Login(string username, string password)
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select man_name,man_password from chbei_manage where man_name=@man_name and man_password=@man_password", con);
            cmd.Parameters.AddWithValue("@man_name", username);
            cmd.Parameters.AddWithValue("@man_password", password);
            MySqlDataReader mySqlDataReader = cmd.ExecuteReader();
            if (mySqlDataReader.HasRows)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }
        #endregion

        #region order表查询 
        public object Order(string key, int n, int m, string kw = "", string stime = "", string etime = "")
        {
            object obj = "";
            string[] str = {
                string.Format("SELECT * FROM chbei_order"),//订单管理列表查询
                string.Format("SELECT * FROM chbei_order WHERE order_id LIKE \""+key+"\" AND order_id LIKE \""+key+"\"" ),//订单编号查询
                string.Format("SELECT * FROM chbei_order WHERE merchantname LIKE \""+key+"\" AND merchantname LIKE \""+key+"\""),//商户名称查询
                string.Format("SELECT * FROM chbei_order WHERE merchantorders LIKE \""+key+"\" AND merchantorders LIKE \""+key+"\""),//商户订单号查询
                string.Format("SELECT * FROM chbei_order WHERE order_id=\""+key+"\" and starttime BETWEEN \""+stime+"\" and \""+etime+"\""),//按时间订单号查询
                string.Format("SELECT * FROM chbei_order WHERE merchantname=\""+key+"\" and starttime BETWEEN \""+stime+"\" and \""+etime+"\""),//按时间商户名称查询
                string.Format("SELECT * FROM chbei_order WHERE merchantorders=\""+key+"\" and starttime BETWEEN \""+stime+"\" and \""+etime+"\""),//按时间商户订单号查询
                //string.Format("SELECT * FROM chbei_order WHERE id=\""+id+"\""),//订单详细查询

            };
            string[] msg = {
                "{\"error\":" + "\"订单列表为空\"}",
                "{\"error\":" + "\"订单编号为空\"}",
                "{\"error\":" + "\"商户名称为空\"}",
                "{\"error\":" + "\"商户订单号为空\"}",
                "{\"error\":" + "\"订单编号时间内查询为空\"}",
                "{\"error\":" + "\"商户名称时间内查询为空\"}",
                "{\"error\":" + "\"商户订单号时间内查询为空\"}",
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
                int jsonlen = json.Length;
                if (jsonlen <= 0)
                {
                    return json = msg[m];
                }
                else
                {
                    json = json.Substring(0, json.Length - 1);
                    json += "},";
                }
            }
            int jsonlens = json.Length;
            if (jsonlens <= 0)
            {
                return json = msg[m];

            }
            json = json.Substring(0, json.Length - 1);
            json = @"[" + json + "]";
            json = json.Replace("\\", "\\");
            con.Close();
            return json;

        }
        #endregion

        #region order方法
        public object OrderSelect(string oid = "", string kw = "", string stime = "", string etime = "")
        {
            if (oid == string.Empty && kw == string.Empty && stime == "" && etime == "")
            {
                //订单列表查询
                Order(oid, 0, 0);
            }
            if (oid != "" && kw == "1" && stime == "" && etime == "")
            {
                //订单编号查询
                Order(oid, 1, 1);
            }
            if (oid != "" && kw == "2" && stime == "" && etime == "")
            {
                //商户名称查询
                Order(oid, 2, 2);
            }
            if (oid != "" && kw == "3" && stime == "" && etime == "")
            {
                //商户订单号查询
                Order(oid, 3, 3);
            }
            if (oid != string.Empty && kw == "1" && stime != "" && etime != "")
            {
                //按时间订单号查询
                Order(oid, 4, 4, kw, stime, etime);
            }
            if (oid != string.Empty && kw == "2" && stime != "" && etime != "")
            {
                //按时间商户名称查询
                Order(oid, 5, 5, kw, stime, etime);
            }
            if (oid != string.Empty && kw == "3" && stime != "" && etime != "")
            {
                //按时间商户订单号查询
                Order(oid, 6, 6, kw, stime, etime);
            }
            return json;
        }
        #endregion

        #region oreder详情
        public string OrderDetails(int id)
        {
            string json = string.Empty;
            con.Open();
            MySqlCommand cmd = command("SELECT order_id,merchantname,merchantorders,order_amount,actualamount,payresults,feedback,starttime FROM chbei_order WHERE id="+id+"", con);
            MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string jsons= JsonConvert.SerializeObject(dt);
            return jsons;
        }
        #endregion

        #region 简单更新数据
        /// <summary>
        /// 
        /// </summary>
        /// <param name="fromname">表名</param>
        /// <param name="fieldname">字段名</param>
        /// <param name="value">数据</param>
        /// <returns></returns>
        public bool UpDateTable(string fromname, string fieldname, string value)
        {
            con.Open();
            string sql = string.Format("update {0} set {1}={2}", fromname, fieldname, value);
            MySqlCommand cmd = new MySqlCommand(sql, con);
            int non = cmd.ExecuteNonQuery();
            if (non == 0)
            {
                con.Close();
                return false;
            }
            else
            {
                con.Close();
                return true;
            }
        }
        #endregion

        #region 多条数据更新
        /// <summary>
        /// </summary>
        /// <param name="fromname">表名</param>
        /// <param name="fieldname">字段名</param>
        /// <param name="value">数据</param>
        /// <param name="fieldnum">数据个数</param>
        /// <param name="where">条件</param>
        /// <param name="whereval">结果</param>
        public void MoveUpDateTabel(string fromname, string[] fieldname, string[] value, int fieldnum, string where, string whereval)
        {
            con.Open();
            List<MySqlParameter> mies = new List<MySqlParameter>();
            try
            {
                for (int i = 0; i < fieldnum; i++)
                {
                    foreach (MySqlParameter item in mies)
                    {
                        item.ToString();
                        item.PossibleValues.Add(fieldname[i]);
                        item.PossibleValues.Add(value[i]);
                        item.PossibleValues.Add(where);
                        item.PossibleValues.Add(whereval);
                    }
                    string sql = fieldname[i] + "=" + value[i] + ",";
                    sql = sql.Substring(0, sql.LastIndexOf(","));
                    MySqlCommand cmd = new MySqlCommand("update " + fromname + " set " + sql + " where " + where + "=" + whereval + "", con);
                    cmd.ExecuteNonQuery();

                }
            }
            catch (Exception)
            {

                throw;
            }

            con.Close();
        }
        #endregion

        #region 简单MysqlCommanad改造
        public MySqlCommand command(string cmdstr, MySqlConnection con)
        {
            MySqlCommand cmd = new MySqlCommand(cmdstr, con);
            return cmd;
        }
        #endregion


    }
}
