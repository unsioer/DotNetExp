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
        protected bool UpdateTeacherInfoToFile(object sender)
        {
            FileStream filestream = File.OpenRead(Common.path);
            StreamReader read = new StreamReader(filestream, Encoding.UTF8);
            List<String[]> teacherList = new List<string[]>();
            string strReadline;

            while ((strReadline = read.ReadLine()) != null)
            {
                String[] teacherRow = strReadline.Split(',');
                if (teacherRow[0] == Request["username"])
                {
                    teacherRow[1] = Request["password"].ToString();
                }
                teacherList.Add(teacherRow);
            }
            filestream.Close();
            filestream = File.Create(Common.path);
            StreamWriter write = new StreamWriter(filestream, Encoding.UTF8);
            foreach (string[] teacherRow in teacherList)
            {
                write.WriteLine(teacherRow[0] + ',' + teacherRow[1]);
            }
            write.Close();
            filestream.Close();
            return true;
        }
        protected bool LoadTeacherInfoFromFile(object sender)
        {
            FileStream filestream = File.OpenRead(Common.path);
            StreamReader read = new StreamReader(filestream, Encoding.UTF8);
            string strReadline;

            while ((strReadline = read.ReadLine()) != null)
            {
                String[] teacherRow = strReadline.Split(',');
                if (teacherRow[0] == Request["username"])
                {
                    Session["username"] = teacherRow[0];
                    Session["password"] = teacherRow[1];
                    break;
                }
            }
            filestream.Close();
            return true;
        }
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
                    String password = Request["password"];
                    String gender = Request["gender"];
                    String phone = Request["phone"];
                    String email = Request["email"];
                    String address = Request["address"];
                    List<String[]> teacherList = new List<string[]>();

                    string sql = "UPDATE dotnetexp.dbo.teacher SET password='" + password + "',gender='"+gender+ "',phone='"+phone+ "',email='"+email+"',address='"+address+"' WHERE id="+Request["id"]+";";
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
                string sql = "SELECT id,username,password,gender,phone,email,address FROM dotnetexp.dbo.teacher WHERE id=" + Request["id"];
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "teacher");
                Session["id"] = Request["id"];
                Session["username"] = dataSet.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["password"] = dataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                Session["gender"] = dataSet.Tables[0].Rows[0].ItemArray[3].ToString();
                Session["phone"] = dataSet.Tables[0].Rows[0].ItemArray[4].ToString();
                Session["email"] = dataSet.Tables[0].Rows[0].ItemArray[5].ToString();
                Session["address"] = dataSet.Tables[0].Rows[0].ItemArray[6].ToString();
            }
            
        }
    }
}