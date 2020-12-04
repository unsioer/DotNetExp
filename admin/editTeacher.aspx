<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editTeacher.aspx.cs" Inherits="DotNetExp.editTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改用户信息</title>
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
        <a href="accountAdmin.aspx">返回</a>
        <% if (Session["id"] == null)
            {
                Response.Write("<form id='form1' method='post' runat='server' action='editTeacher.aspx'>");
            }
            else
            {
                Response.Write("<form id='form1' method='post' runat='server' action='editTeacher.aspx?id=" + (string)Session["id"] + "'>");
            }
        %>
        <table border="1">
            <tr>
                <td>教工号</td>
                <td>
                    <%   
                        Response.Write("<input name='username' type='username' id='username' size='20' value='" + (string)Session["username"] + "' required/>");
                    %>
                </td>
            </tr>
            <tr>
                <td>用户名</td>
                <td>
                    <%
                        Response.Write("<input name='fullname' type='fullname' id='fullname' size='20' value='" + (string)Session["fullname"] + "' required/>");
                    %>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <%   
                        Response.Write("<input name='password' type='password' id='password' size='20' value='" + (string)Session["password"] + "' required/>");
                    %>                    
                </td>
            </tr>
            <tr>
                <tr>
                    <td>邮箱：</td>
                    <td>
                        <%   
                            Response.Write("<input name='email' type='email' id='email' size='20' value='" + (string)Session["email"] + "'/>");
                        %>  
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Submit" value="提交" />&nbsp; &nbsp;
                    <input name="Reset" type="reset" id="Reset" value="取消" />
                    </td>
                </tr>
        </table>
        <input type="text" id="contentChanged" name="contentChanged" hidden="hidden" />
        </form> 
    </div>

    <!-- #include file="/footer.aspx" -->
</body>
</html>
