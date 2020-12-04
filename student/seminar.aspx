<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seminar.aspx.cs" Inherits="DotNetExp.student.seminar" %>

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

    <!-- #include file="studentHeader.aspx" -->
    <div class="container">
        <h1 class="page-header">讨论课列表</h1>
        <div class="col-md-12 row">
            <div class="col-sm-4">
                <a class="btn btn-info" href="seminar.aspx">刷新</a>
            </div>
        </div>
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>名称</th>
                        <th>课程</th>
                        <th>日期</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<string[]> seminarList = (List<string[]>)Session["seminarList"];
                        if (seminarList != null)
                        {
                            for (int i = 0; i < seminarList.Count; i++)
                            {
                                try
                                {
                                    string[] seminarRow = seminarList[i];
                                    Response.Write("<tr>");
                                    for (int j = 1; j < seminarRow.Length - 1; j++)
                                        Response.Write("<td>" + seminarRow[j] + "</td>");
                                    if (seminarRow[seminarRow.Length - 1].Equals("0"))
                                    {
                                        Response.Write("<td><a name='edit' type='button' href='seminarEnroll.aspx?id=" + seminarRow[0] + "'>报名</> ");
                                    }
                                    else
                                    {
                                        Response.Write("<td><a name='edit' type='button' href='seminarEnroll.aspx?id=" + seminarRow[0] + "&cancel=1'>取消报名</> " +
                                        "<a name='edit' type='button' href='seminarMaterialPage.aspx?id=" + seminarRow[0] + "'>上传材料</> " +
                                        "<a name='edit' type='button' href='seminarAsk.aspx?id=" + seminarRow[0] + "'>提问</> " +
                                        "<a name='edit' type='button' href='seminarMaterialPage.aspx?id=" + seminarRow[0] + "'>上传报告</> ");
                                    }
                                    Response.Write("</tr>");
                                    System.Console.Write(seminarRow[0]);

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
    <!-- #include file="/footer.aspx" -->

</body>
</html>
