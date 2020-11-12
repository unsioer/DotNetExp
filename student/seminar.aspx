<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seminar.aspx.cs" Inherits="DotNetExp.student.seminar" %>

<%
    if (Session["cur_user"] == null || Session["cur_id"] == null || Session["cur_type"] == null)
    {
        Response.Redirect("/login.aspx");
    }
    else if (!Session["cur_type"].Equals("student"))
    {
        Response.Status = "404 Not Found";
        return;
    }
%>
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
        <div>
            <input type="file" id="avatar" name="avatar">
        </div>
        <button type="button">保存</button>

        <div class="alert" role="alert" id="result"></div>
    </div>
    <script type="text/javascript">
        $('button').click(function () {
            
            var files = $('#avatar').prop('files');
            var data = new FormData();
            data.append('avatar', files[0]);
            $.ajax({
                url: './upload.aspx',
                type: 'POST',
                data: data,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    $("#result").text(JSON.stringify(data)).addClass("alert-success").removeClass("alert-danger");
                },
                error: function (err) {
                    console.error(err);
                    $("#result").html(err.responseText).removeClass("alert-success").addClass("alert-danger");
                }
            });
        });
    </script>
</body>
</html>
