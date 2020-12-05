<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DotNetExp.login" %>

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
        <div style="text-align:center;margin-top: 60px; margin-bottom: 50px;">
            <img alt="logo" src="/static/img/profile.png" style="height: 150px; border-radius: 50%;">
        </div>
        <form name="myFORM" class="form-horizontal" method="post" action="login.aspx" runat="server">
            
            <div class="form-group">
                <label for="username" class="col-sm-2 col-sm-offset-1 control-label">账号<b style="color: red">*</b></label>
                <div class="col-sm-7">
                    <input name="username" class="form-control" type="text" id="username" required="required" />
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 col-sm-offset-1 control-label">密码<b style="color: red">*</b></label>
                <div class="col-sm-7">
                    <input name="password" class="form-control" type="password" id="password" required="required" />
                </div>
            </div>
            <div class="form-group">
                <div style="text-align:center;">
                    <input type="radio" name="type" value="admin" checked="checked" />管理员
                    <input type="radio" name="type" value="teacher" />教师
                    <input type="radio" name="type" value="student" />学生
                </div>
            </div>
            <div class="form-group" style="text-align: center;">
                <input class="btn btn-success" type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input class="btn" name="Reset" type="reset" id="Reset" value="取消" />
            </div>
        </form>
    </div>
    <!-- include file="/footer.aspx" -->
</body>
</html>
