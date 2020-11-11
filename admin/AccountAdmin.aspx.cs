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

        protected void Page_Load(object sender, EventArgs e)
        {
            //List<String[]> teacherList = LoadTeacherInfoFromFile(sender);

            List<String[]> teacherList = new List<string[]>();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
            string sql = "SELECT id,no,username,password,email FROM dotnetexp.dbo.teacher WHERE is_deleted=0";
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