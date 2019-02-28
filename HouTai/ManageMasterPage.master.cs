using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HouTai_ManageMasterPage : System.Web.UI.MasterPage{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["managename"] == null)
        {
            Response.Redirect("~/HouTai/404.aspx");
            picture.ImageUrl = ResolveUrl(SelectHeader());
            picture1.ImageUrl = ResolveUrl(SelectHeader());
            picture2.ImageUrl = ResolveUrl(SelectHeader());

        }
        else
        {
            managename1.Text = Session["managename"].ToString();
            UserName.Text = "你好！" + Session["managename"];
            email.Text = SelectHeader1().ToString() ;
            picture.ImageUrl = ResolveUrl(SelectHeader());
            picture1.ImageUrl = ResolveUrl(SelectHeader());
            picture2.ImageUrl = ResolveUrl(SelectHeader());
        }
    }

    public string SelectHeader()
    {
        string s = "~/HouTai/images/face.jpg";
        string sql = "select picture from manage where managename = '" + managename1.Text + "'";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
                s = re.GetString(0);
            else
                s = "~/HouTai/images/face.jpg";
            re.Close();
            return s;
        }
        catch (Exception ex)
        {
            return s;
        }
        finally
        {
            con.Close();
        }
    }
    public string SelectHeader1()
    {
        string s = "这里显示邮箱";
        string sql = "select email from manage where managename = '" + managename1.Text + "'";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
                s = re.GetString(0);
            else
                s = "这里显示邮箱";
            re.Close();
            return s;
        }
        catch (Exception ex)
        {
            return s;
        }
        finally
        {
            con.Close();
        }
    }
    //搜索
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HouTai/Search.aspx?all=" + TextBox1.Text);
    }
}