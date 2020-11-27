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
    public partial class seminarAsk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "student");

            if (Request["Request_Method"] == "POST")
            {
                if (Request["id"] != null)
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                    String question = Request["question"];

                    String sql = "UPDATE dotnetexp.dbo.seminar_student SET question='"+question+"' WHERE is_deleted=0 AND seminar_id=" + Request["id"] + " AND student_id=" + Session["cur_id"] + ";";
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
                Response.Redirect("seminar.aspx");
            }
            if (Request["Request_Method"] == "GET")
            {
                if(Request["id"]!=null)
                {
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());

                    String sql = "SELECT question from dotnetexp.dbo.seminar_student WHERE is_deleted=0 AND seminar_id=" + Request["id"] + " AND student_id=" + Session["cur_id"] + ";";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet, "question");
                    Session["question"] = dataSet.Tables[0].Rows[0].ItemArray[0].ToString();
                }
            }
        }
    }
}