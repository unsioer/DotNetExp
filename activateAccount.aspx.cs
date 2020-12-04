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
    public partial class activateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cur_id"] == null || Session["cur_type"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            else if (Session["cur_activate"] == null|| Session["cur_type"]==null || (!Session["cur_type"].Equals("student") && !Session["cur_type"].Equals("teacher")))
            {
                Response.StatusCode = 404;
                Response.End();
            }
            string usertype = Session["cur_type"].ToString();
            if (Request["Request_Method"] == "POST")
            {
                if (Session["cur_id"] != null)
                {
                    if (Request["username"] == "")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "教工号为空", "<script language='javascript'>alert('对不起，您输入的教工号为空，请重新输入！')</script>");
                    }
                    else if (Request["fullname"] == "")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "姓名为空", "<script language='javascript'>alert('对不起，您输入的姓名为空，请重新输入！')</script>");
                    }
                    else if (!Request["password"].Equals(Request["password2"]))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "密码不一致", "<script language='javascript'>alert('对不起，您输入的密码不一致，请重新输入！')</script>");
                    }
                    else
                    {
                        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                        string fullname = Request["fullname"];
                        string password = Request["password"];
                        string email = Request["email"];

                        string sql = "UPDATE dotnetexp.dbo." + usertype + " SET fullname='" + fullname + "', password='" + password + "',email='" + email + "', is_activated=1 WHERE is_deleted=0 AND id=" + Session["cur_id"] + ";";
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
                        Session["cur_activate"] = null;
                        if (usertype == "teacher")
                            Response.Redirect("teacher/dashboard.aspx");
                        else
                            Response.Redirect("student/dashboard.aspx");
                    }
                    

                }
                
            }
            else if (Request["Request_Method"] == "GET" && Session["cur_id"] != null)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "SELECT username,fullname,password,email FROM dotnetexp.dbo." + usertype + " WHERE is_deleted=0 AND id=" + Session["cur_id"];
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "teacher");
                Session["id"] = Request["id"];
                Session["username"] = dataSet.Tables[0].Rows[0].ItemArray[0].ToString();
                Session["fullname"] = dataSet.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["password"] = dataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["email"] = dataSet.Tables[0].Rows[0].ItemArray[3].ToString();
            }
        }
    }
}