using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;


namespace DotNetExp
{
    public partial class accountAdmin : System.Web.UI.Page
    {
        protected String userTableStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "admin");

            List<String[]> teacherList = new List<string[]>();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
            string sql = "SELECT id,username,fullname,password,email,is_activated FROM dotnetexp.dbo.student WHERE is_deleted=0";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet, "student");
            showStudentList.DataSource = dataSet.Tables[0];
            showStudentList.DataBind();

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
            sql = "SELECT id,username,fullname,password,email,is_activated FROM dotnetexp.dbo.teacher WHERE is_deleted=0";
            adapter = new SqlDataAdapter(sql, connection);
            dataSet = new DataSet();
            adapter.Fill(dataSet, "teacher");
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