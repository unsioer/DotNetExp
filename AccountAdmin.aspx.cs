using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;


namespace dotnetExp
{
    public partial class AccountAdmin : System.Web.UI.Page
    {
        protected String userTableStr;

        protected List<String[]> LoadTeacherInfoFromFile(object sender)
        {
            List<String[]> teacherList = new List<string[]>();
            FileStream filestream = File.OpenRead(Common.path);
            StreamReader read = new StreamReader(filestream, Encoding.UTF8);
            string strReadline;

            while ((strReadline = read.ReadLine()) != null)
            {
                String[] teacherRow = strReadline.Split(',');
                teacherList.Add(teacherRow);
            }
            filestream.Close();
            return teacherList;
        }
        protected List<String[]> LoadTeacherInfoFromMySql(object sender)
        {
            List<String[]> teacherList = new List<string[]>();
            MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQLConnection"].ToString());
            string sql = "SELECT * FROM teacher";
            MySqlDataAdapter adapter = new MySqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet, "teacher");
            showUserList.DataSource=dataSet.Tables[0];
            showUserList.DataBind();

            FileStream filestream = File.OpenRead(Common.path);
            StreamReader read = new StreamReader(filestream, Encoding.UTF8);
            string strReadline;

            while ((strReadline = read.ReadLine()) != null)
            {
                String[] teacherRow = strReadline.Split(',');
                teacherList.Add(teacherRow);
            }
            filestream.Close();
            return teacherList;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //List<String[]> teacherList = LoadTeacherInfoFromFile(sender);

            List<String[]> teacherList = new List<string[]>();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
            string sql = "SELECT id,username,password,gender,phone,email,address FROM dotnetexp.dbo.teacher WHERE is_deleted IS NULL";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet, "teacher");
            showUserList.DataSource = dataSet.Tables[0];
            showUserList.DataBind();
            for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
            {

                string[] teacherRow = new string[dataSet.Tables[0].Rows[i].ItemArray.Length];
                for(int j=0;j< dataSet.Tables[0].Rows[i].ItemArray.Length;j++)
                    teacherRow[j] = (dataSet.Tables[0].Rows[i].ItemArray[j].ToString());

                teacherList.Add(teacherRow);
            }
            Session["teacherList"] = teacherList;
        }
    }
}