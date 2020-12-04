<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createUser.aspx.cs" Inherits="DotNetExp.createUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建用户</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>

<body>
    <!-- #include file="adminHeader.aspx" -->
    <div class="container">
        <h1 class="page-header"><b>管理员界面——创建用户</b></h1>
        <form name="myFORM" class="form-horizontal" method="post" action="createUser.aspx" runat="server">
            <div class="form-group">
                <label for="username" class="col-sm-3 col-sm-offset-1 control-label">账号类型</label>
                <div style="text-align:center;" class="col-sm-6">
                    <input type="radio" name="type" value="teacher" checked="checked" />教师
                    <input type="radio" name="type" value="student" />学生
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-3 col-sm-offset-1 control-label">学工号<b style="color: red">*</b></label>
                <div class="col-sm-6">
                    <input name="username" class="form-control" type="text" id="username" required="required" />
                </div>
            </div>
            <div class="form-group">
                <label for="fullname" class="col-sm-3 col-sm-offset-1 control-label">姓名<b style="color: red">*</b></label>
                <div class="col-sm-6">
                    <input name="fullname" class="form-control" type="text" id="fullname" required="required" />
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">密码（空为默认）</label>
                <div class="col-sm-6">
                    <input name="password" class="form-control" type="password" id="password" />
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">确认密码（空为默认）</label>
                <div class="col-sm-6">
                    <input name="password2" class="form-control" type="password" id="password2" />
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input name="email" class="form-control" type="email" id="email" />
                </div>
            </div>
            <div class="form-group" style="text-align:center;">
                <input class="btn btn-success" type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input class="btn" name="Reset" type="reset" id="Reset" value="取消" />&nbsp; &nbsp;
                <button class="btn btn-info"><a href="accountAdmin.aspx" style="color: white;">返回</a></button>
            </div>
        </form>

    </div>
    <!-- #include file="/footer.aspx" -->
</body>

</html>
