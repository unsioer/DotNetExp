<%@ Page Language="C#" AutoEventWireup="true" %>

<%
    Session["cur_user"] = null;
    Session["cur_id"] = null;
    Session["cur_type"] = null;
    Response.Write("<script>window.parent.location='/login.aspx'</script>");
%>