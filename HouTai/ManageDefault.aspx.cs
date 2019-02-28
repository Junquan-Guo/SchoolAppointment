using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HouTai_ManageDefault : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["managename"] == null)
        {
            Response.Redirect("~/HouTai/404.aspx");
        }
        else
        {
            datetime.Text = "你本次登录时间为   " + DateTime.Now.ToLocalTime().ToString() + "。";
        }
        init();
    }

    public void init()
    {
        String sql = "select COUNT(fileid) from files";
        String sql2 = "select COUNT(videoid) from video";
        String sql3 = "select COUNT(userid) from users";
        String sql4 = "select COUNT(feedbackid) from feedback where DateDiff(dd,publishdate,getdate())=0";
        String sql5 = "select COUNT(userid) from users where DateDiff(dd,registration,getdate())=0";
        String sql6 = "select COUNT(activityid) from activity";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlCommand com2 = new SqlCommand(sql2, con);
            SqlCommand com3 = new SqlCommand(sql3, con);
            SqlCommand com4 = new SqlCommand(sql4, con);
            SqlCommand com5 = new SqlCommand(sql5, con);
            SqlCommand com6 = new SqlCommand(sql6, con);
            SqlDataReader 
            re = com.ExecuteReader();
            if (re.Read())
                photograph.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com2.ExecuteReader();
            if (re.Read())
                video.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com3.ExecuteReader();
            if (re.Read())
                amount.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com4.ExecuteReader();
            if (re.Read())
                message.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com5.ExecuteReader();
            if (re.Read())
                newly.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com6.ExecuteReader();
            if (re.Read())
                check.Text = re.GetInt32(0).ToString();
            re.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('error')</script>");
        }
        finally
        {
            con.Close();
        }
    }
}