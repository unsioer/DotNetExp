﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accountAdmin.aspx.cs" Inherits="DotNetExp.accountAdmin" %>

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
    <!-- #include file="adminHeader.aspx" -->

    <div class="container">
        <h1 class="page-header"><b>管理员界面——管理账户状态</b></h1>
        <div class="col-md-12">
            <h2>学生账号</h2>
            <form runat="server">
                <asp:GridView ID="showStudentList" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth=""
                    CellPadding="3" GridLines="Horizontal" CssClass="table table-hover table-striped">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="username" HeaderText="学工号" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="fullname" HeaderText="姓名" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="password" HeaderText="密码" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="email" HeaderText="邮箱" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="is_activated" HeaderText="激活状态" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HtmlEncode="false" DataField="id" 
                            DataFormatString="<a name='edit' type='button' href='editUser.aspx?type=student&id={0}'>编辑</a> <a name='edit' type='button' href='editUser.aspx?type=student&id={0}&reset=1'>重置密码</a> <a name='edit' type='button' href='editUser.aspx?type=student&id={0}&delete=1'>删除</a>"
                            HeaderText="操作" ItemStyle-CssClass="text-center" />
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" HorizontalAlign="Center" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </form>
        </div>
        <div class="col-md-12">
            <h2>教师账号</h2>
            <div class="col-md-12">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>教工号</th>
                            <th>姓名</th>
                            <th>密码</th>
                            <th>邮箱</th>
                            <th>激活状态</th>
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
                                        string[] studentRow = teacherList[i];

                                        Response.Write("<tr>");
                                        for (int j = 1; j < studentRow.Length; j++)
                                            Response.Write("<td>" + studentRow[j] + "</td>");
                                        Response.Write("<td><a name='edit' type='button' href='editUser.aspx?type=teacher&id=" + studentRow[0] + "'>编辑</a> " +
                                            "<a name='edit' type='button' href='editUser.aspx?type=teacher&id=" + studentRow[0] + "&reset=1'>重置密码</a> " +
                                            "<a name='edit' type='button' href='editUser.aspx?type=teacher&id=" + studentRow[0] + "&delete=1'>删除</a>" + "</td>");
                                        Response.Write("</tr>");
                                        System.Console.Write(studentRow[0]);
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
    <!-- #include file="/footer.aspx" -->
</body>
</html>
