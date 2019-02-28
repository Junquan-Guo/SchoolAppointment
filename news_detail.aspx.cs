using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class news_detail : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    int userid = 0;
    int filedid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        filedid = int.Parse(Request.QueryString["fileid"]);
        if (Session["user"] == null)
        {
            ImgUser3.ImageUrl = "images/user.png";
        }
        else
        {
            User user = (User)Session["user"];
            string picture = user.Picture;
            string username = user.Username;
            userid = user.Userid;
            ImgUser3.ImageUrl =picture;
            String sql = "SELECT d.*, u.[picture],u.[username] FROM [dbo].[discuss] d  INNER JOIN [dbo].[users] u" +
                            " ON d.[userid] = u.[userid]" +
                            "WHERE ([fileid] = " + filedid + ") and u.username = '" + username + "'" +
                            " ORDER BY d.[publishdate] DESC";
            SqlDataSource4.SelectCommand = sql;
        }
    }

    //评论
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (TextBox1.Text.Trim() != "")
            {
                String str = "insert into discuss(comment,publishdate,userid,fileid) values('" + TextBox1.Text + "','" + DateTime.Now + "','" + userid + "'," + Request.QueryString["fileid"] + ")";
                try
                {
                    con.Open();
                    SqlCommand com = new SqlCommand(str, con);
                    if (com.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('评论成功')</script>");
                        ListView2.DataBind();
                        ListView4.DataBind();
                    }
                    else
                        Response.Write("<script>alert('评论失败')</script>");
                }
                catch (Exception ez)
                {
                    Response.Write("<script>alert('评论失败2')</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('评论不能为空，请输入评论！！！')</script>");
            }
        }
        else {
            Response.Write("<script>alert('请登录后再评论！！！')</script>");
        }
    }
    public int hasCollect()
    {
        if (Session["user"] != null)
        {
            User user = (User)Session["user"];
            foreach (int id in user.List)
            {
                if (id == filedid)
                    return 1;
            }
        }
        return 0;
    }
    public int haslikes()
    {
        User user = (User)Session["user"];
        if (user != null && user.LikesList != null)
        {
            foreach (int id in user.LikesList)
            {
                if (id == filedid)
                    return 1;
            }
        }
        return 0;
    }
    //收藏
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            User user = (User)Session["user"];
            foreach(int id in user.List){
                if (id == filedid)
                    return;
            }
            String str2 = "insert into collect(userid,fileid) values("+userid+"," + Request.QueryString["fileid"] + ")";
            try{
                con.Open();
                SqlCommand com = new SqlCommand(str2, con);
                if (com.ExecuteNonQuery() > 0){
                    Response.Write("<script>alert('收藏成功')</script>");
                    user.List.Add(filedid);
                    Session["user"] = user;
                }
                else
                    Response.Write("<script>alert('收藏失败')</script>");
            }
            catch (Exception ez){
                Response.Write("<script>alert('收藏失败2')</script>");
            }
            finally{
                con.Close();
            }
        }
        else
        {
            Response.Write("<script>alert('你还没登录！！！')</script>");
        }
    }
    //搜索
    protected void btnsearch1_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/search.aspx?all=" + grabble.Text);

    }
}