using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public partial class Change_Password : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
        if (user != null)
        {
            managename1.Text = user.Username;
        }
        else if (user == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    //修改密码
    protected void Button1_Click(object sender, EventArgs e)
    {
        String username = managename1.Text;
        String oldpwd = password1.Text;
        String newpwd = oldPwd.Text;
        String repwd = password2.Text;
        SqlConnection con = new SqlConnection(conString);
        con.Open();

        try
        {
            string sql = "select * from users where username = '" + username + "' and password = '" + oldpwd + "'";
            
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
            {
                re.Close();
                sql = "update users set password = '"+newpwd+"' where username = '"+username+"'";
                SqlCommand com2 = new SqlCommand(sql, con);
                if (com2.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('修改成功')</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败')</script>");
                }
            }else{
                Label5.Text = "密码错误，请输入正确密码!";
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"')</script>");
        }
        finally
        {
            con.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        password1.Text = " ";
        oldPwd.Text = " ";
        password2.Text=" ";
    }
}