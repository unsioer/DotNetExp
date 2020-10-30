using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotnetExp
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Uname = txtName.Text.Trim();//取姓名文本框中的值
            string Upassword = txtPwd.Text.Trim();//取密码文本框中的值
            if (Uname == "")//判断姓名是否为空
            {
                //注册启动脚本
                ClientScript.RegisterStartupScript(this.GetType(), "用户名为空", "<script language='javascript'>alert('姓名不允许为空！')</script>");//客户端对话框提示
                return;
            }
            if (Upassword == "")//判断密码是否为空
            {
                ClientScript.RegisterStartupScript(this.GetType(), "密码为空", "<script language='javascript'>alert('密码不允许为空！')</script>");//客户端提示
                return;
            }
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ToString());//创建连接对象

            string sql = string.Format("SELECT COUNT(*) FROM userinfo WHERE UName = '{0}' and UPassword = '{1}'", Uname, Upassword);//需要执行的SQL语句
            //string sql = "SELECT * FROM userinfo";//需要执行的SQL语句
            SqlCommand command = new SqlCommand(sql, connection);//命令对象的创建
            connection.Open(); //打开数据库

            /*先看用户名和密码是啥
            SqlDataReader rdr = command.ExecuteReader();
            // 迭代结果集中的行，直到读完最后一条记录Read方法返回false
            while (rdr.Read())
            {
                txtName.Text = rdr[0].ToString();;
                txtPwd.Text = rdr[1].ToString();  
            }
            rdr.Close();                                        // 关闭DataReader
            */

            int count = (int)command.ExecuteScalar();//执行查询
            connection.Close();//关闭数据库
            if (count > 0)//判断执行成功跳转页面
            {
                Response.Redirect("view.aspx");
            }
            else
            {//否则客户端提示，并清空文本框
                ClientScript.RegisterStartupScript(this.GetType(), "无此用户", "<script language='javascript'>alert('对不起，您输入的信息不正确，请重新输入！')</script>");
                txtName.Text = "";
                txtPwd.Text = "";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPwd.Text = "";
        }
    }

}