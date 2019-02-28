using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class update : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    User user = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["user"];
        if (user != null)
        {
            TextBox1.Text = user.Username;
            TextBox3.Text = user.Phone;
            avatar.ImageUrl = user.Picture;
            Signature.Text = user.Introduce;
            if (user.Sex.Contains("男"))
                radSex.Checked = true;
            else if (user.Sex.Contains("女"))
                radSex2.Checked = true;
            else
                radSex3.Checked = true;
        }
        else if (user == null)
        {
        }

        if (!IsPostBack)
            init_date();
        else { }

    }
    protected void set_year()   //设置年,从100年前到现在
    {
        for (int i = DateTime.Now.Year-100; i <= DateTime.Now.Year; i++)
        {
            year.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
    }

    protected void set_month()  //设置月，1-12月
    {
        for (int i = 1; i <= 12; i++)
        {
            month.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
    }

    protected int get_days(int ye, int mo)       //根据年和月获取当月的天数
    {
        if (mo == 4 || mo == 6 || mo == 9 || mo == 11)//30天的月份
        {
            return 30;
        }
        else if (mo == 2)
        {
            if ((ye % 4 == 0&& ye % 100 != 0) || (ye % 400 == 0)) //闰年二月
            {
                return 29;
            }
            else       //平年二月
            {
                return 28;
            }
        }
        else           //31天的月份
        {
            return 31;
        }
    }

    protected void set_day(int max) //设置日，参数为要设置的最大值
    {
        int count = day.Items.Count;
        if (count > max)
        {
            for (int i = count; i > max; i--)
            {
                day.Items.Remove(day.Items.FindByText(i.ToString()));
            }
        }
        else if (count < max)
        {
            for (int i = count + 1; i <= max; i++)
            {
                day.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
    }

    protected void init_date()      //初始化日期，并将最初显示日期变为当前日期
    {
        set_year();
        set_month();
        if (user != null)
        {
            string m_year = DateTime.Parse(user.Birthday).Year.ToString();
            string m_month = DateTime.Parse(user.Birthday).Month.ToString();
            string m_day = DateTime.Parse(user.Birthday).Day.ToString();
            year.SelectedValue = m_year;
            month.SelectedValue = m_month;
            update_date();
            day.SelectedValue = m_day;
        }
        else{
            year.Items.FindByText(DateTime.Now.Year.ToString()).Selected = true;
            month.Items.FindByText(DateTime.Now.Month.ToString()).Selected = true;
            update_date();
            day.Items.FindByText(DateTime.Now.Day.ToString()).Selected = true;
        }
    }

    protected void update_date()    //更新‘日’
    {
        int ye = int.Parse(year.SelectedItem.Text);
        int mo = int.Parse(month.SelectedItem.Text);
        int days = get_days(ye, mo);
        set_day(days);
    }

    //每次更改年、月时都更新一下日
    protected void year_SelectedIndexChanged(object sender, EventArgs e)
    {
        update_date();
    }

    protected void month_SelectedIndexChanged(object sender, EventArgs e)
    {
        update_date();
    }
    //个人信息编辑
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        String username = TextBox1.Text;
        String introduce = Signature.Text;
        String picture2 = Image1.ImageUrl;
        String picture = avatar.ImageUrl;
        String phone = TextBox3.Text;
        String sex = "男";
        DateTime birthday = Convert.ToDateTime(year.SelectedValue + "-" + month.SelectedValue + "-" + day.SelectedValue);
        try
        {
            string sql = "select username,introduce,picture,phone,sex,birthday from users";
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
            {
                re.Close();
                if (picture2 == "images/user.gif")
                    sql = "update users set username = '" + username + "',introduce ='" + introduce + "',picture ='" + picture + "',phone ='" + phone + "',sex ='" + sex + "',birthday ='" + birthday + "' where username = '" + username + "'";
                else
                    sql = "update users set username = '" + username + "',introduce ='" + introduce + "',picture ='" + picture2 + "',phone ='" + phone + "',sex ='" + sex + "',birthday ='" + birthday + "' where username = '" + username + "'";
                SqlCommand com2 = new SqlCommand(sql, con);
                if (com2.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('编辑成功')</script>");
                }
                else
                {
                    Response.Write("<script>alert('编辑失败')</script>");
                }
            }
            else
            {
            }
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
    //显示封面
    protected void Button4_Click(object sender, EventArgs e)
    {
        bool files = false;
        if (this.FileUpload1.HasFile)
        {
            //获取上传文件的后缀
            String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
            String[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png" };
            //判断文件类型是否符合
            for (int i = 0; i < restrictExtension.Length; i++)
            {
                if (fileExtension == restrictExtension[1])
                {
                    files = true;
                }
            }
            //调用SaveAs方法实现上传
            if (files == true)
            {
                try
                {
                    this.Image1.ImageUrl = "~/images/" + FileUpload1.FileName;
                    this.FileUpload1.SaveAs(Server.MapPath("~/images/") + FileUpload1.FileName);
                    this.Label11.Text = "文件上传成功!预约如图所示：";
                    Label12.Text = "~/images/" + FileUpload1.FileName;
                }
                catch
                {
                    this.Label11.Text = "文件上传不成功";
                }
            }
            else
            {
                this.Label11.Text = "只能够上传后缀为.gif、 .jpg、 .bmp、.png的文件夹";
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "images/user.gif";
    }
}