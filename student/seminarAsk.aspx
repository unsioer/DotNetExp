﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seminarAsk.aspx.cs" Inherits="DotNetExp.student.seminarAsk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>讨论课管理</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button"
                data-toggle="collapse" data-target="#bs-navbar"
                aria-controls="bs-navbar" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span><span class="icon-bar"></span><span
                        class="icon-bar"></span>
            </button>
            <a href="dashboard.aspx" class="navbar-brand">XMUStudent</a>
        </div>
        <nav id="bs-navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="seminar.aspx">讨论课管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout.aspx">注销</a></li>
            </ul>
        </nav>
        <h1>讨论课提问</h1>
        <%
            if (Request["id"] != null)
            {
                Response.Write("<form class='form-horizontal' id='form' method='post' action='./seminarAsk.aspx?id=" + Request["id"] + "'>");
            }
            else
            {
                Response.Write("<form class='form-horizontal' id='form' method='post' action='seminarAsk.aspx'>");
            }

        %>

        <div class="form-group">
            <label class="col-2">问题</label>
            <%   
                        Response.Write("<input name='question' id='question' class='col-10 form-control' value='" + (string)Session["question"] + "'/>");
            %> 
        </div>
        <input type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input name="Reset" type="reset" id="Reset" value="取消" />
        </form>




    </div>
</body>
</html>