<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTeacher.aspx.cs" Inherits="dotnetExp.EditTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <a href="AccountAdmin.aspx">返回</a>
    <% if (Session["id"] == null)
        {
            Response.Write("<form id='form1' method='post' runat='server' action='EditTeacher.aspx'>");
        }
        else
        {
            Response.Write("<form id='form1' method='post' runat='server' action='EditTeacher.aspx?id=" + (string)Session["id"] + "'>");
        }
    %>
    <table border="1">
        <tr>
            <td>用户名</td>
            <td>
                <%   
                    Response.Write((string)Session["username"]);
                %>
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td>
                <%   
                    Response.Write("<input name='password' type='password' id='password' size='20' value='" + (string)Session["password"] + "' required onchange='processChange()'/>");
                %>                    
            </td>
        </tr>
        <tr>

            <tr>
                <td>性别：</td>
                <td>
                    <%
                        if((string)Session["gender"]=="男")
                        {
                            Response.Write("<input name='gender' type='radio' value='男' checked />男<input type='radio' name='gender' value='女'/>女");
                        }
                        else
                        {
                            Response.Write("<input name='gender' type='radio' value='男' />男<input type='radio' name='gender' value='女' checked/>女");
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td>电话：</td>
                <td>
                    <%   
                    Response.Write("<input name='phone' type='phone' id='phone' size='20' value='" + (string)Session["phone"] + "'/>");
                    %>  
                </td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <%   
                    Response.Write("<input name='email' type='email' id='email' size='20' value='" + (string)Session["email"] + "'/>");
                    %>  
                </td>
            </tr>
            <tr>
                <td>地址：</td>
                <td>
                    <%   
                    Response.Write("<input name='address' type='address' id='address' size='20' value='" + (string)Session["address"] + "'/>");
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
</body>
</html>
