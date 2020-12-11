<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset.aspx.cs" Inherits="DotNetExp.reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>重置密码</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <body>
        <header class="navbar navbar-static-top bs-docs-nav box-shadow" id="top">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle collapsed" type="button"
                        data-toggle="collapse" data-target="#bs-navbar"
                        aria-controls="bs-navbar" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span><span class="icon-bar"></span><span
                                class="icon-bar"></span>
                    </button>
                    <a href='/' class="navbar-brand">XMUUser</a>
                </div>
            </div>
        </header>
        <div class="container">
            <h1 class="page-header"><b>重置密码（学生）</b></h1>
            <form id="form1" runat="server" method="post"  class='form-horizontal'>
                <div class="form-group">
                    <label for="password" class="col-sm-3 col-sm-offset-1 control-label">密码</label>
                    <div class="col-sm-6">
                        <input name='password' class='form-control' type='password' id='password' required='required' />

                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 col-sm-offset-1 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input name='password2' class='form-control' type='password' id='password2' required='required' />
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <input class="btn btn-success" type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input class="btn" name="Reset" type="reset" id="Reset" value="取消" />
                </div>
            </form>
        </div>
    </body>
</html>
