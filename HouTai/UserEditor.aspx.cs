using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HouTai_UserEditor : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    int id = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["managename"] == null)
        {
            //Response.Redirect("~/HouTai/404.aspx");

        }
        else
        {
            if (Request.QueryString["userid"] != null)
            {
                id = int.Parse(Request.QueryString["userid"]);
                ShowMessage(id);
            }
        }
    }

    public void ShowMessage(int id)
    {
        String sql = "select username,phone,sex,grade,introduce,picture,email,birthday,grade from users where userid = " + id;
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
            {
                TextBox1.Text = re.GetString(0);
                TextBox2.Text = re.GetString(1);
                String sex = re.GetString(2);
                String introduce = re.GetString(3);
                TextBox3.Text = re.GetString(4);
                Avatar.ImageUrl = re.GetString(5);
                TextBox4.Text = re.GetString(6);
                TextBox5.Text = re.GetDateTime(7).ToString();
                TextBox6.Text = re.GetString(8);
                if (sex.Contains("男"))
                    radSex.Checked = true;
                else if (sex.Contains("女"))
                    radSex2.Checked = true;
                else if (sex.Contains("保密"))
                    radSex3.Checked = true;

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('该用户没有设置邮箱!')</script>");
        }
        finally
        {
            con.Close();
        }
    }
    //修改
    protected void Button1_Click(object sender, EventArgs e)
    {
        string grade = DropDownList1.SelectedValue;
        String sql = "update users set grade = '" + grade + "' where userid = " + id;
        try{
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            if (com.ExecuteNonQuery() <= 0)
                Response.Write("<script>alert('修改失败')</script>");
            else
                Response.Write("<script>alert('修改成功" + grade + "')</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            con.Close();
        }

    }
    //返回
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HouTai/UserList.aspx");
    }
   
}