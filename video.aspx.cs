using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class video : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String buwei = Request["buwei"] == null || Request["buwei"].ToString() == "" ? "" : " buwei = '" + Request["buwei"].ToString() + "' and";
        String type = Request["type"] == null || Request["type"].ToString() == "" ? "" : " type='" + Request["type"].ToString() + "' and";
        String nandu = Request["nandu"] == null || Request["nandu"].ToString() == "" ? "" : " nandu=" + Request["nandu"].ToString() + " and";
        String keyword = buwei + type + nandu;
        if (keyword != "")
        {
            keyword = keyword.Substring(0, keyword.Length - 3);
            SqlDataSource8.SelectCommand = "select * from video where " + keyword;
            ListView10.DataBind();
            if (buwei != "")
                Label9.Text = Request["buwei"].ToString();
            if (type != "")
                Label10.Text += Request["type"].ToString();
            if (nandu != "")
                Label11.Text += Request["nandu"].ToString();
        }  
    }
}