using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace DotNetExp
{
    public class StatusCheck
    {
        public static int loginStatusCheck(HttpSessionState Session, HttpResponse Response, String userType)
        {
            if(userType.Equals("teacher"))
            {
                if (Session["cur_id"] == null || Session["cur_type"] == null)
                {
                    Response.Redirect("/login.aspx");
              
                }
                else if (!Session["cur_type"].Equals("teacher"))
                {
                    Response.StatusCode = 404;
                    Response.End();
                }
                else if (Session["cur_activate"] != null)
                {
                    Response.Redirect("/activateAccount.aspx");
                }
            }
            else if(userType.Equals("admin"))
            {
                if (Session["cur_id"] == null || Session["cur_type"] == null)
                {
                    Response.Redirect("/login.aspx");
                }
                else if (!Session["cur_type"].Equals("admin"))
                {
                    Response.StatusCode = 404;
                    Response.End();
                }
            }
            else if(userType.Equals("student"))
            {
                if (Session["cur_id"] == null || Session["cur_type"] == null)
                {
                    Response.Redirect("/login.aspx");
                }
                else if (!Session["cur_type"].Equals("student"))
                {
                    Response.StatusCode = 404;
                    Response.End();
                }
                else if (Session["cur_activate"] != null)
                {
                    Response.Redirect("/activateAccount.aspx");
                }
            }
            return 0;
        }
    }
}