using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotnetExp
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["cur_user"] = null;
            Session["cur_type"] = null;
            Response.Write("<script>window.parent.location='/login.aspx'</script>");
        }
    }
}