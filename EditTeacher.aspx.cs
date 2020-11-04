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

namespace dotnetExp
{
    public partial class EditTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request["Request_Method"] == "POST")
            {
                if (Request["id"] != null)
                {

                    /*if (Request["password"] != null && Request["contentChanged"] != null && Request["contentChanged"].Equals("true"))
                    {
                        UpdateTeacherInfoToFile(sender);
                        Session["contentChanged"] = false;
                        Response.Redirect("AccountAdmin.aspx");
                    }
                    else
                    {
                        LoadTeacherInfoFromFile(sender);
                        return;
                    }*/

                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String no = Request["no"];
                    String password = Request["password"];
                    String email = Request["email"];
                    List<String[]> teacherList = new List<string[]>();

                    string sql = "UPDATE dotnetexp.dbo.teacher SET password='" + password + "',email='"+email +"' WHERE is_deleted IS NULL AND id="+Request["id"]+";";
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
                Response.Redirect("AccountAdmin.aspx");
            }
            else if (Request["id"] != null & Request["delete"] == "1")
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                String username = Request["username"];

                string sql = "select * from dotnetexp.dbo.teacher where id='" + Request["id"] + "';";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "teacher");
                if (dataSet.Tables[0].Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "用户不存在", "<script language='javascript'>alert('对不起，用户不存在！')</script>");
                    return;
                }
                String password = Request["password"];
                String gender = Request["gender"];
                String phone = Request["phone"];
                String email = Request["email"];
                String address = Request["address"];
                List<String[]> teacherList = new List<string[]>();

                sql = "UPDATE dotnetexp.dbo.teacher SET is_deleted=1 WHERE id=" + Request["id"];
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
            else if (Request["Request_Method"] == "GET" && Request["id"] != null)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "SELECT no,username,password,email FROM dotnetexp.dbo.teacher WHERE is_deleted IS NULL AND id=" + Request["id"];
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "teacher");
                Session["id"] = Request["id"];
                Session["no"]= dataSet.Tables[0].Rows[0].ItemArray[0].ToString();
                Session["username"] = dataSet.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["password"] = dataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["email"] = dataSet.Tables[0].Rows[0].ItemArray[3].ToString();
            }
            
        }
    }
}