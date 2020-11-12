using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace dotnetExp
{
    public partial class CreateTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Request_Method"] == "POST")
            {
                if (Request["username"] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "教工号为空", "<script language='javascript'>alert('对不起，您输入的教工号为空，请重新输入！')</script>");
                }
                else if (Request["fullname"] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "姓名为空", "<script language='javascript'>alert('对不起，您输入的姓名为空，请重新输入！')</script>");
                }
                else if(!Request["password"].Equals(Request["password2"]))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "密码不一致", "<script language='javascript'>alert('对不起，您输入的密码不一致，请重新输入！')</script>");
                }
                else
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String username = Request["username"];

                    string sql = "select * from dotnetexp.dbo.teacher where username='" + username + "';";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "教工号已存在", "<script language='javascript'>alert('对不起，您输入的教工号已存在，请重新输入！')</script>");
                        return;
                    }
                    String fullname = Request["fullname"];
                    String password = Request["password"];
                    if(password=="")
                    {
                        password="123456";
                    }
                    String email = Request["email"];
                    List<String[]> teacherList = new List<string[]>();

                    sql = "INSERT INTO dotnetexp.dbo.teacher(username, fullname, password, email, is_deleted, is_activated) VALUES('" + username + "','" + fullname + "','" + password + "','" + email + "', 0 , 0);";
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    object obj = cmd.ExecuteNonQuery();
                    if (obj != null)
                    {
                        //Success
                    }
                    else
                    {
                        //Fail
                    }
                    Response.Redirect("AccountAdmin.aspx");
                }
            }


        }
    }
}