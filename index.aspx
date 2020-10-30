<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="dotnetExp.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="border: 1px double #FF0000; width: 421px; height: 241px; top: 107px; left: 325px; position: absolute;">
            <tr>
                <td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp; 
                <b>&nbsp;&nbsp;&nbsp; 职员查询系统登录</b>
                    <br />
                    <br />
                    &nbsp;用户名：&nbsp;&nbsp;<asp:TextBox ID="txtName" runat="server" Width="148px"></asp:TextBox>
                    &nbsp;<br />
                    <br />
                    &nbsp;<br />
                    &nbsp; 密&nbsp; 码：&nbsp;&nbsp;<asp:TextBox ID="txtPwd" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnLogin" runat="server"
                        Style="top: 142px; left: 34px; position: absolute; height: 26px; right: 187px"
                        Text="登录" Width="73px" OnClick="btnLogin_Click" />
                    <br />
                    <asp:Button ID="btnCancel" runat="server"
                        Style="top: 142px; left: 161px; position: absolute; height: 26px" Text="重置"
                        Width="73px" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
    </form>
</body>
</html>
