<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="DotNetExp.upload" %>
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
