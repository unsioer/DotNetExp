using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetExp
{
    public partial class editUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "admin");

            if (Request["Request_Method"] == "POST")
            {
                if (Request["id"] != null && (Request["type"].Equals("teacher") || Request["type"].Equals("student")) 
                    && (Request["delete"]==null || !Request["delete"].Equals("1"))
                    && (Request["reset"] == null || !Request["reset"].Equals("1")))
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    string username = Request["username"];
                    string fullname = Request["fullname"];
                    string password = Request["password"];
                    string email = Request["email"];
                    string type = Request["type"];

                    string sql = "SELECT * FROM dotnetexp.dbo." + type + " WHERE username='" + username + "' AND id!=" + Request["id"] + ";";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "教工号已存在", "<script language='javascript'>alert('对不起，您修改的教工号已存在，请重新输入！')</script>");
                        return;
                    }

                    sql = "UPDATE dotnetexp.dbo.teacher SET username='" + username + "', fullname='" + fullname + "', password='" + password + "',email='" + email + "' WHERE is_deleted=0 AND id=" + Request["id"] + ";";
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

                }
                Response.Redirect("accountAdmin.aspx");
            }
            else if (Request["id"] != null && (Request["type"].Equals("teacher") || Request["type"].Equals("student")) && Request["delete"] == "1")
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string type = Request["type"];

                string sql = "select * from dotnetexp.dbo." + type + " where id='" + Request["id"] + "';";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "teacher");
                if (dataSet.Tables[0].Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "用户不存在", "<script language='javascript'>alert('对不起，用户不存在！')</script>");
                    return;
                }

                sql = "UPDATE dotnetexp.dbo." + type + " SET is_deleted=1 WHERE id=" + Request["id"];
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

                Response.Redirect("accountAdmin.aspx");
            }
            else if (Request["id"] != null && (Request["type"].Equals("teacher") || Request["type"].Equals("student")) && Request["reset"] == "1")
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string type = Request["type"];

                string sql = "select * from dotnetexp.dbo." + type + " where id='" + Request["id"] + "';";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "user");
                if (dataSet.Tables[0].Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "用户不存在", "<script language='javascript'>alert('对不起，用户不存在！')</script>");
                    return;
                }

                sql = "UPDATE dotnetexp.dbo." + type + " SET password='123456', is_activated=0 WHERE id=" + Request["id"];
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

                Response.Redirect("accountAdmin.aspx");
            }

            else if (Request["Request_Method"] == "GET" && Request["id"] != null && (Request["type"].Equals("teacher")|| Request["type"].Equals("student")))
            {
                string type = Request["type"];
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "SELECT username,fullname,password,email FROM dotnetexp.dbo." + type + " WHERE is_deleted=0 AND id=" + Request["id"];
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "user");
                Session["id"] = Request["id"];
                Session["username"] = dataSet.Tables[0].Rows[0].ItemArray[0].ToString();
                Session["fullname"] = dataSet.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["password"] = dataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["email"] = dataSet.Tables[0].Rows[0].ItemArray[3].ToString();
            }

        }
    }
}