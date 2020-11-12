<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTeacher.aspx.cs" Inherits="dotnetExp.CreateTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建用户</title>
</head>

<body>
    <p><b>管理员界面——创建用户</b></p>
    <a href="AccountAdmin.aspx">返回管理页</a>
    <form name="myFORM" method="post" action="CreateTeacher.aspx" runat="server">
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
                <td>密码（为空则为默认密码）</td>
                <td>
                    <input name="password" type="password" id="password" />
                </td>
            </tr>
            <tr>
                <td>确认密码（为空则为默认密码）</td>
                <td>
                    <input name="password2" type="password" id="password2" />
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