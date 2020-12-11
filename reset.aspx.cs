using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetExp
{
    public partial class reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["Request_Method"] == "POST")
            {
                if (Request["token"] == null)
                {
                    Response.Redirect("/login.aspx");
                }
                else
                {
                    string token = Request["token"].ToString();
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    string sql = "select student_id from dotnetexp.dbo.reset_student where token='" + token + "';";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "student");
                    if (dataSet.Tables[0].Rows.Count == 0)
                    {
                        Response.Redirect("/login.aspx");
                    }
                    int student_id = int.Parse(dataSet.Tables[0].Rows[0].ItemArray[0].ToString());
                    if (Request["password"]==null||Request["password2"]==null)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "", "<script language='javascript'>alert('对不起，您输入的密码为空，请重新输入！')</script>");
                    }
                    else if (!Request["password"].Equals(Request["password2"]))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "密码不一致", "<script language='javascript'>alert('对不起，您输入的密码不一致，请重新输入！')</script>");
                    }
                    string password = Request["password"];
                    sql = "UPDATE dotnetexp.dbo.student SET password='" + password + "' where id="+student_id+";";
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    SqlCommand cmd = new SqlCommand(sql, connection);

                    object obj = cmd.ExecuteNonQuery();
                    if (obj != null)
                    {
                        //Success
                        Response.Redirect("/login.aspx");
                    }
                    else
                    {
                        //Fail
                        ClientScript.RegisterStartupScript(GetType(), "", "<script language='javascript'>alert('服务器错误！')</script>");
                    }

                }
            }
            else
            {
                if(Request["token"]==null)
                {
                    Response.Redirect("/login.aspx");
                }
                else
                {
                    string token = Request["token"].ToString();
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    string sql = "select student_id from dotnetexp.dbo.reset_student where token='" + token + "';";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "student");
                    if (dataSet.Tables[0].Rows.Count == 0)
                    {
                        Response.Redirect("/login.aspx");
                    }
                }
            }
        }
    }
}