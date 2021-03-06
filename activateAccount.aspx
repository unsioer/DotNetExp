﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activateAccount.aspx.cs" Inherits="DotNetExp.activateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>激活用户</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- #include file="header.aspx" -->

    <div class="container">
        <h1 class="page-header"><b>激活用户</b></h1>
        <form name="myFORM" class='form-horizontal' method="post" action="activateAccount.aspx" runat="server">
            <div class="form-group">
                <label for="username" class="col-sm-3 col-sm-offset-1 control-label">学工号<b style="color: red">*</b></label>
                <div class="col-sm-6">
                    <%   
                        Response.Write("<input name='username' class='form-control' type='text' id='username' value='" + (string)Session["username"] + "' disabled='disabled'/>");
                    %>
                </div>
            </div>
            <div class="form-group">
                <label for="fullname" class="col-sm-3 col-sm-offset-1 control-label">姓名<b style="color: red">*</b></label>
                <div class="col-sm-6">
                    <%
                        Response.Write("<input name='fullname' class='form-control' type='text' id='fullname' value='" + (string)Session["fullname"] + "' required='required'/>");
                    %>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">密码</label>
                <div class="col-sm-6">
                    <%   
                        Response.Write("<input name='password' class='form-control' type='password' id='password' value='" + (string)Session["password"] + "' required='required'/>");
                    %>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">确认密码</label>
                <div class="col-sm-6">
                    <%   
                        Response.Write("<input name='password2' class='form-control' type='password' id='password2' value='" + (string)Session["password"] + "' required='required'/>");
                    %>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 col-sm-offset-1 control-label">邮箱</label>
                <div class="col-sm-6">
                    <%   
                        Response.Write("<input name='email' class='form-control' type='email' id='email' value='" + (string)Session["email"] + "'/>");
                    %>
                </div>
            </div>
            <div class="form-group" style="text-align: center;">
                <input class="btn btn-success" type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input class="btn" name="Reset" type="reset" id="Reset" value="取消" />
            </div>
        </form>
    </div>

    <!-- #include file="footer.aspx" -->

</body>

</html>
