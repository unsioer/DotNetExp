<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="dotnetExp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <h1 class="page-header"><b>登录</b></h1>
        <form name="myFORM" method="post" action="CreateTeacher.aspx" runat="server">
            <table border="1">
                <tr>
                    <td>学工号</td>
                    <td>
                        <input name="no" type="text" id="no" required="required" />
                        <b style="color: red">*</b>
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <input name="password" type="password" id="password" required="required" />
                        <b style="color: red">*</b>
                    </td>
                </tr>
                <tr>
                    <input type="radio" name="type" value="admin" checked="checked"/>管理员
                    <input type="radio" name="type" value="teacher" />教师
                    <input type="radio" name="type" value="student" />学生
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Submit" value="登录" />&nbsp; &nbsp; 
                    <input name="Reset" type="reset" id="Reset" value="重置" />
                    </td>
                </tr>
            </table>

        </form>
    </div>
    <footer class="footer bs-docs-footer">
        <div class="container">
            <p class='text-center'><b>HaiyunLab</b> 2020 © 保留所有权利。</p>
        </div>
    </footer>
</body>
</html>
