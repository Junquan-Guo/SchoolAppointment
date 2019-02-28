using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class dynamic : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    int userid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null){
        }
        else
        {
            User user = (User)Session["user"];
            string picture = user.Picture;
            string username = user.Username;
            userid = user.Userid;
        }

    }
    //动态发布
    protected void myButton4_Click(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (Request.Form["content"] != null && !Request.Form["content"].ToString().Trim().StartsWith("<p><br></p>"))
            {
                string content = Request.Form["content"].ToString();
                String str = "insert into issues(comment,publishdate,love,typeid,userid) values('" + content + "','" + DateTime.Now + "','" + 0 + "','" + 5 + "','" + userid + "')";
                try
                {
                    con.Open();
                    SqlCommand com = new SqlCommand(str, con);
                    if (com.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('发布成功')</script>");
                        ListView1.DataBind();
                    }
                    else
                        Response.Write("<script>alert('发布失败')</script>");
                }
                catch (Exception ez)
                {
                    Response.Write("<script>alert('发布失败2')</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('不能为空')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('请登录')</script>");
        }

    }
}