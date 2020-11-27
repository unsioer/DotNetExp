using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetExp.student
{
    public partial class seminarEnroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cur_id"] == null || Session["cur_type"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            else if (!Session["cur_type"].Equals("student"))
            {
                Response.Status = "404 Not Found";
                return;
            }
            else if (Session["cur_activate"] != null)
            {
                Response.Redirect("/activateAccount.aspx");
            }
            if (Request["id"]!=null)
            {
                if(Request["cancel"]!=null && Request["cancel"].Equals("1"))
                {
                    //取消报名
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String sql = "UPDATE dotnetexp.dbo.seminar_student SET is_deleted=1 WHERE is_deleted=0 AND seminar_id=" + Request["id"] + " AND student_id="+Session["cur_id"]+";";
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
                    Response.Redirect("seminar.aspx");
                }
                else
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());

                    String sql = "INSERT INTO dotnetexp.dbo.seminar_student(seminar_id, student_id, is_deleted) VALUES('" + Request["id"] + "'," + Session["cur_id"] + ", 0);";
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
                    Response.Redirect("seminar.aspx");
                }
            }
        }
    }
}