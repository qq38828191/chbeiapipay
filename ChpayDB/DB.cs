using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ChpayDB
{
    public class DB
    {
        #region 查询是否存在
        static string connStr = ConfigurationManager.AppSettings["ConnectionString"];
        MySqlConnection con = new MySqlConnection(connStr);
        public int IsExistence(string fromname, string fieldname, string value)
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select 1 from @fromname where @fieldname = @value limit 1", con);
            cmd.Parameters.AddWithValue("@fromname", fromname);
            cmd.Parameters.AddWithValue("@fieldname", fieldname);
            cmd.Parameters.AddWithValue("@value", value);
            int isexist = cmd.ExecuteNonQuery();
            con.Close();
            if (isexist == 0)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        #endregion

        #region 单条普通查询
        /// <summary>
        /// 单数据查询
        /// </summary>
        public bool IntoDate(string fromname, string fieldname, string value)
        {

            string sql = string.Format("select {0} from {1} where {2} = {3}",
                fieldname,
                fromname,
                fieldname,
                value);//格式化SQL查询语句

            con.Open();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            //MySqlCommand cmd = new MySqlCommand("select @fieldname from @fromname where @fieldname=@value");
            //cmd.Parameters.AddWithValue("@fieldname", fieldname);
            //cmd.Parameters.AddWithValue("@fromname", fromname);
            //cmd.Parameters.AddWithValue("@value", value);
            MySqlDataReader dateread = cmd.ExecuteReader();

            if (dateread.Read())
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

        #region 简单更新数据
        public bool UpDateTable(string fromname, string fieldname, string value)
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand("update @fromname set @fieldname=@value", con);
            cmd.Parameters.AddWithValue("@fromname", fromname);
            cmd.Parameters.AddWithValue("@fieldname", fieldname);
            cmd.Parameters.AddWithValue("@value", value);
            int non = cmd.ExecuteNonQuery();
            if (non == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion

        //"update user set user_name=@uName,user_pwd=@uPwd,type=@uType where user_no=@uNo";

    }
}
