<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activateAccount.aspx.cs" Inherits="DotNetExp.activateAccount" %>

<%
    if (Session["cur_id"] == null || Session["cur_type"] == null)
    {
        Response.Redirect("/login.aspx");
    }
    else if ((!Session["cur_type"].Equals("student") && !Session["cur_type"].Equals("teacher")) || Session["cur_activate"] == null)
    {
        Response.Status = "404 Not Found";
        return;
    }
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>激活用户</title>
</head>

<body>
    <p><b>激活用户</b></p>
    <form name="myFORM" method="post" action="createTeacher.aspx" runat="server">
        <table border="1">
            <tr>
                <td>学工号</td>
                <td>
                    <input name="username" type="text" id="username" required="required" />
                    <b style="color: red">*</b>
                </td>
            </tr>
            <tr>
                <td>姓名</td>
                <td>
                    <input name="fullname" type="text" id="fullname" required="required" />
                    <b style="color: red">*</b>
                </td>
            </tr>
            <tr>
                <td>新密码</td>
                <td>
                    <input name="password" type="password" id="password" required="required" />
                </td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td>
                    <input name="password2" type="password" id="password2" required="required" />
                </td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <input name="email" cols="25" id="email" />

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input name="Reset" type="reset" id="Reset" value="取消" />
                </td>
            </tr>
        </table>

    </form>

</body>

</html>
