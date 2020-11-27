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
    public partial class seminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "student");

            if (Session["cur_id"] == null || Session["cur_type"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            else if (!Session["cur_type"].Equals("student"))
            {
                Response.Status = "404 Not Found";
                Response.End();
            }
            else if (Session["cur_activate"] != null)
            {
                Response.Redirect("/activateAccount.aspx");
            }

            List<String[]> seminarList = new List<string[]>();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
            string sql = "SELECT seminar.id, seminar.name sname, course.[name] cname, CONVERT(varchar, seminar.time, 120 ) " +
                "FROM dotnetexp.dbo.seminar, dotnetexp.dbo.course WHERE course.[no]=seminar.[course_no] AND seminar.is_deleted=0;";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet, "seminar");
            for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
            {

                string[] seminarRow = new string[dataSet.Tables[0].Rows[i].ItemArray.Length+1];
                for (int j = 0; j < dataSet.Tables[0].Rows[i].ItemArray.Length; j++)
                    seminarRow[j] = (dataSet.Tables[0].Rows[i].ItemArray[j].ToString());
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                sql = "SELECT * from dotnetexp.dbo.seminar_student WHERE seminar_id="+seminarRow[0] +" AND student_id=" + Session["cur_id"] + " AND is_deleted=0;";
                adapter = new SqlDataAdapter(sql, connection);
                DataSet enrollDataSet = new DataSet();
                adapter.Fill(enrollDataSet, "seminarEnroll");
                if(enrollDataSet.Tables[0].Rows.Count>0)
                {
                    seminarRow[dataSet.Tables[0].Rows[i].ItemArray.Length] = "1";
                }
                else
                {
                    seminarRow[dataSet.Tables[0].Rows[i].ItemArray.Length] = "0";
                }
                seminarList.Add(seminarRow);
            }
            Session["seminarList"] = seminarList;
        }
    }
}