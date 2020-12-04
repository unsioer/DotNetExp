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
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "user");

            if (Request["Request_Method"] == "POST")
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
                    string username = Request["username"];
                    string fullname = Request["fullname"];
                    string password = Request["password"];
                    string email = Request["email"];
                    string usertype = Session["cur_type"].ToString();

                    string sql = "SELECT * FROM dotnetexp.dbo." + usertype + " WHERE username='" + username + "' AND id!=" + Session["cur_id"] + ";";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);

                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "教工号已存在", "<script language='javascript'>alert('对不起，您修改的教工号已存在，请重新输入！')</script>");
                    }
                    else
                    {
                        sql = "UPDATE dotnetexp.dbo." + usertype + " SET username='" + username + "', fullname='" + fullname + "', password='" + password + "',email='" + email + "' WHERE is_deleted=0 AND id=" + Session["cur_id"] + ";";
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

                        if (usertype == "teacher")
                            Response.Redirect("teacher/dashboard.aspx");
                        else
                            Response.Redirect("student/dashboard.aspx");

                    }

                }


            }



            else if (Request["Request_Method"] == "GET")
            {
                string type = Session["cur_type"].ToString();
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "SELECT username,fullname,password,email FROM dotnetexp.dbo." + type + " WHERE is_deleted=0 AND id=" + Session["cur_id"];
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "user");
                Session["id"] = Session["cur_id"];
                Session["username"] = dataSet.Tables[0].Rows[0].ItemArray[0].ToString();
                Session["fullname"] = dataSet.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["password"] = dataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["email"] = dataSet.Tables[0].Rows[0].ItemArray[3].ToString();
            }

        }
    }
}