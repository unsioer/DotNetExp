<%@ Page Language="C#" AutoEventWireup="true" %>

<%
    Session["cur_id"] = null;
    Session["cur_type"] = null;
    Session["cur_activate"] = null;
    Response.Write("<script>window.parent.location='/login.aspx'</script>");
%>