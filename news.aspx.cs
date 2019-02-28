using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //搜索
    protected void btnsearch1_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/search.aspx?all=" + grabble.Text);

    }
   
}