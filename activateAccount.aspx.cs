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
            String id = Session["cur_id"].ToString();
            String usertype = Session["cur_type"].ToString();
            if (Request["Request_Method"] == "POST")
            {
                if (Session["cur_id"] != null)
                {

                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String username = Request["username"];
                    String fullname = Request["fullname"];
                    String password = Request["password"];
                    String email = Request["email"];

                    string sql = "SELECT * FROM dotnetexp.dbo.teacher WHERE username=" + username + " AND id!=" + Request["id"] + ";";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "teacher");
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "教工号已存在", "<script language='javascript'>alert('对不起，您修改的教工号已存在，请重新输入！')</script>");
                        return;
                    }


                    sql = "UPDATE dotnetexp.dbo.teacher SET username=" + username + ", password='" + password + "',email='" + email + "' WHERE is_deleted=0 AND id=" + Request["id"] + ";";
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
                if (usertype == "teacher")
                    Response.Redirect("teacher/dashboard.aspx");
                else
                    Response.Redirect("student/dashboard.aspx");
            }
            else if (Request["Request_Method"] == "GET" && Request["id"] != null)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "SELECT username,fullname,password,email FROM dotnetexp.dbo.teacher WHERE is_deleted=0 AND id=" + Request["id"];
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