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
        protected bool CreateTeacherIntoFile(object sender)
        {
            String username = Request["username"];
            String password = Request["password"];
            File.AppendAllText(Common.path, username + ',' + password + '\n');
            return true;
        }
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
                    //CreateTeacherIntoFile(sender);

                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String username = Request["username"];

                    string sql = "select * from dotnetexp.dbo.teacher where username='" + username + "';";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "用户名已存在", "<script language='javascript'>alert('对不起，您输入的用户名已存在，请重新输入！')</script>");
                        return;
                    }
                    String password = Request["password"];
                    String gender = Request["gender"];
                    String phone = Request["phone"];
                    String email = Request["email"];
                    String address = Request["address"];
                    List<String[]> teacherList = new List<string[]>();

                    sql = "INSERT INTO dotnetexp.dbo.teacher(username, password, gender, phone, email, address) VALUES('" + username + "','" + password + "','" + gender + "','" + phone + "','" + email + "','" + address + "');";
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