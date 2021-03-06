﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetExp
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusCheck.loginStatusCheck(Session, Response, "student");

            if (Request.Files.Count > 0)
            {
                try
                {
                    HttpPostedFile file = Request.Files[0];
                    
                    string filePath = Server.MapPath("../upload/student/" + file.FileName);
                    file.SaveAs(filePath);

                    Response.Write("{\"msg\":\"Success\",\"data\":\""+file.FileName+"\"}");
                }
                catch
                {
                    Response.Write("{\"msg\":\"Error when saving the upload file\"}");
                }
            }
            else
            {
                Response.Write("{\"msg\":\"Error: No files uploaded\"}");
            }
        }
    }
}