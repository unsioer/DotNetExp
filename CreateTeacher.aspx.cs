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
                    ClientScript.RegisterStartupScript(this.GetType(), "用户名为空", "<script language='javascript'>alert('对不起，您输入的用户名为空，请重新输入！')</script>");
                }
                else if (Request["password"] == ""|| Request["password2"] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "密码为空", "<script language='javascript'>alert('对不起，您输入的密码为空，请重新输入！')</script>");
                }
                else if(!Request["password"].Equals(Request["password2"]))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "密码不一致", "<script language='javascript'>alert('对不起，您输入的密码不一致，请重新输入！')</script>");
                }
                else
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String no = Request["no"];

                    string sql = "select * from dotnetexp.dbo.teacher where no='" + no + "';";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "学工号已存在", "<script language='javascript'>alert('对不起，您输入的学工号已存在，请重新输入！')</script>");
                        return;
                    }
                    String username = Request["username"];
                    String password = Request["password"];
                    String email = Request["email"];
                    List<String[]> teacherList = new List<string[]>();

                    sql = "INSERT INTO dotnetexp.dbo.teacher(no, username, password, email) VALUES('" + no + "','" + username + "','" + password + "','" + email + "');";
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