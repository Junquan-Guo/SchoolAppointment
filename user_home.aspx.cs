using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class user_home : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
        if (user != null)
        {
            int m_Y1 = DateTime.Parse(user.Birthday).Year;
            int m_Y2 = DateTime.Now.Year;
            int m_Age = m_Y2 - m_Y1;//计算年龄
            Label1.Text = user.Username;
            avatar.ImageUrl = user.Picture;
            Label2.Text = user.Introduce;
            Label3.Text = "所在地区：" + user.Region;
            Label4.Text = "年龄：" + m_Age + "岁";
            Label5.ToolTip = user.Sex;
            if (user.Sex.Contains("男"))
                Label5.CssClass = "fa fa-mars";
            else if (user.Sex.Contains("女"))
                Label5.CssClass = "fa fa-venus";
            else
                Label5.CssClass = "fa fa-venus-mars";
        }
        else if (user == null){
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void BianJi_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user_update.aspx");
    }
}