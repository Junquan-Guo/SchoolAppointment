using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HouTai_Search : System.Web.UI.Page
{
    public string s = "SELECT  f.*, g.[growid], g.[growname] FROM [dbo].[files] f INNER JOIN [dbo].[maps] m ON f.[fileid] = m.[fileid] INNER JOIN [dbo].[grows] g ON m.[growid] = g.[growid]and g.[growname]!='全部'";
    protected void Page_Load(object sender, EventArgs e)
    {
        s = s + " where  filename like '%"+ Request.QueryString["all"].ToString() + "%'";
        rebindDate(s);
    }
    public void rebindDate(String sql)
    {
        SqlDataSource1.SelectCommand = sql;
        GridView2.DataBind();
        if (GridView2.Rows.Count == 0)
            Label4.Text = "0";
        else
            Label4.Text =""+ GridView2.Rows.Count +"";
    }
}