using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetExp
{
    public partial class findPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Request_Method"] == "POST")
            {
                if (Request["email"] == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "邮箱为空", "<script language='javascript'>alert('对不起，您输入的邮箱为空，请重新输入！')</script>");
                }
                string mailTo = Request["email"].ToString();
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLServerConnection"].ToString());
                string sql = "select id from dotnetexp.dbo.student where email='" + mailTo + "';";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "student");
                if (dataSet.Tables[0].Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "教工号已存在", "<script language='javascript'>alert('对不起，您输入的教工号已存在，请重新输入！')</script>");
                    return;
                }
                int student_id = int.Parse(dataSet.Tables[0].Rows[0].ItemArray[0].ToString());
                //生成token
                string token = BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(mailTo + DateTime.Now.ToString()))).Replace("-", "");

                sql = "INSERT INTO dotnetexp.dbo.reset_student(student_id,reset_time,token) VALUES(" + student_id + ", GETDATE(), '" + token + "');";
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

                string smtpServer = "smtp-mail.outlook.com"; //SMTP服务器
                string mailFrom = "*"; //登陆用户名
                string userPassword = "*";//登陆密码
                string mailContent = "<a href='https://localhost:44302/reset.aspx?token=" + token + "'>重置密码</a>";

                // 邮件服务设置
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;//指定电子邮件发送方式
                smtpClient.Host = smtpServer; //指定SMTP服务器
                smtpClient.Credentials = new System.Net.NetworkCredential(mailFrom, userPassword);//用户名和密码
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;

                // 发送邮件设置
                MailMessage mailMessage = new MailMessage(mailFrom, mailTo); // 发送人和收件人
                mailMessage.Subject = "重置密码-XMUUser";//主题
                mailMessage.Body = mailContent;//内容
                mailMessage.BodyEncoding = Encoding.UTF8;//正文编码
                mailMessage.IsBodyHtml = true;//设置为HTML格式
                mailMessage.Priority = MailPriority.Low;//优先级

                try
                {
                    smtpClient.Send(mailMessage); // 发送邮件
                    ClientScript.RegisterStartupScript(GetType(), "", "<script language='javascript'>alert('发送成功')</script>");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "<script language='javascript'>alert('发送失败！')</script>");
                }
            }
        }
    }