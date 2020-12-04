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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["cur_type"]!=null)
            {
                if (Session["cur_type"].Equals("admin"))
                    Response.Redirect("admin/accountAdmin.aspx");
                else if (Session["cur_type"].Equals("teacher"))
                    Response.Redirect("teacher/dashboard.aspx");
                else if (Session["cur_type"].Equals("student"))
                    Response.Redirect("student/Seminar.aspx");
            }
            if (Request["Request_Method"] == "POST")
            {
                if (Request["username"] == "")
                {
                    ClientScript.RegisterStartupScript(GetType(), "学工号为空", "<script language='javascript'>alert('对不起，您输入的学工号为空，请重新输入！')</script>");
                }
                else if (Request["password"] == "")
                {
                    ClientScript.RegisterStartupScript(GetType(), "密码为空", "<script language='javascript'>alert('对不起，您输入的密码为空，请重新输入！')</script>");
                }
                else if (Request["type"] != "admin" && Request["type"] != "teacher" && Request["type"] != "student")
                {
                    ClientScript.RegisterStartupScript(GetType(), "用户类型错误", "<script language='javascript'>alert('对不起，您请求的用户类型有误！')</script>");
                }
                else
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String username = Request["username"];
                    String password = Request["password"];
                    String usertype = Request["type"];
                    string sql = "select id";
                    if(!usertype.Equals("admin"))
                    {
                        sql += ", is_activated";
                    }
                    sql+=" from dotnetexp.dbo." + usertype + " where username='" + username + "' and password='" + password + "' and is_deleted=0;";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "user");
                    if (dataSet.Tables[0].Rows.Count == 0)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "错误", "<script language='javascript'>alert('对不起，您输入的账号或密码不正确！')</script>");
                        return;
                    }
                    else
                    {
                        Session["cur_id"] = dataSet.Tables[0].Rows[0][0];
                        Session["cur_type"] = usertype;
                        if(!usertype.Equals("admin"))
                        {
                            if (dataSet.Tables[0].Rows[0][1].ToString().Equals("0"))
                                Session["cur_activate"] = "0";
                        }
                        if (usertype == "admin")
                            Response.Redirect("admin/accountAdmin.aspx");
                        else if (usertype == "teacher")
                            Response.Redirect("teacher/dashboard.aspx");
                        else
                            Response.Redirect("student/dashboard.aspx");

                    }


                }
            }
            else
            {

            }
        }
    }
}