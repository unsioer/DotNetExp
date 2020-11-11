<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountAdmin.aspx.cs" Inherits="dotnetExp.AccountAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理账户状态</title>
    <script
        src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
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
                <a href="/main.aspx" class="navbar-brand">XMUAdmin</a>
            </div>
            <nav id="bs-navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li id="index"><a href="AccountAdmin.aspx">管理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/login.aspx" target="_blank">登录</a></li>
                </ul>
            </nav>
        </div>
    </header>


    <div class="container">
        <h1 class="page-header"><b>管理员界面——管理账户状态</b></h1>
        <div class="col-md-12">
            <form runat="server">
                <asp:GridView ID="showUserList" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth=""
                    CellPadding="3" GridLines="Horizontal" CssClass="table table-hover table-striped text-center"
                    Style="">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="学工号" />
                        <asp:BoundField DataField="username" HeaderText="姓名" />
                        <asp:BoundField DataField="password" HeaderText="密码" ItemStyle-CssClass="text-center"/>
                        <asp:BoundField DataField="email" HeaderText="邮箱" ItemStyle-CssClass="text-center"/>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"  />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </form>
        </div>
        <div class="col-md-12">
            <div class="col-md-12 row">
                <div class="col-sm-4">
                    <a class="btn btn-info" href="AccountAdmin.aspx">刷新</a>
                </div>
                <div class="col-sm-4">
                    <a class="btn btn-success" href="CreateTeacher.aspx">新建</a>
                </div>
                <!--div class="col-sm-2">
                    <label for="page" class="control-label">页码</label>
                </div>
                <div class="col-sm-4">
                    <select class="form-control" id="page" name="page"></select>
                </div-->
                <div class="col-sm-4">
                    
                </div>
            </div>
            <div class="col-md-12">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>学工号</th>
                            <th>姓名</th>
                            <th>密码</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<string[]> teacherList = (List<string[]>)Session["teacherList"];
                            if (teacherList != null)
                            {
                                for (int i = 0; i < teacherList.Count; i++)
                                {
                                    try
                                    {
                                        string[] teacherRow = teacherList[i];
                                        //if (teacherRow.Length == 2)
                                        {
                                            Response.Write("<tr>");
                                            for(int j=1;j<teacherRow.Length;j++)
                                                Response.Write(" <td>" + teacherRow[j] + "</td>");
                                            Response.Write(" <td><a name='edit' type='button' href='EditTeacher.aspx?id=" + teacherRow[0] + "'>编辑</> " +
                                                "<a name='edit' type='button' href='EditTeacher.aspx?id=" + teacherRow[0] + "&delete=1'>删除</>"+"</td>");
                                            Response.Write("</tr>");
                                            System.Console.Write(teacherRow[0]);
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        System.Console.Write(ex.Message);
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<tr>");
                                Response.Write(" <td>");
                                Response.Write("     <input name='username' type='text' size='40' value='找不到内容！'/>");
                                Response.Write(" </td>");
                                Response.Write("</tr>");

                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <footer class="footer bs-docs-footer">
        <div class="container">
            <p class='text-center'><b>HaiyunLab</b> 2020 © 保留所有权利。</p>
        </div>
    </footer>
</body>
</html>
