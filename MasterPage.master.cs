using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class MasterPage : System.Web.UI.MasterPage
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Username.Text = "未登录";
            ImgUser.ImageUrl = ResolveUrl(SelectHeader());
            ImgUser2.ImageUrl = ResolveUrl(SelectHeader());
            feedback_email.Text = "";
            Userid.Text = "";
        }
        else
        {
            User user = (User)Session["user"];
            Username.Text = user.Username;
            feedback_email.Text = user.Email;
            ImgUser.ImageUrl = ResolveUrl(SelectHeader());
            ImgUser2.ImageUrl = ResolveUrl(SelectHeader());
        }
    }

    public string SelectHeader()
    {
        string s = "images/user.png";
        string sql = "select picture from users where username = '" + Username.Text + "'";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader re = com.ExecuteReader();
            if (re.Read())
                s = re.GetString(0);
            else
                s = "images/user.png";
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
    
    //获取配置连接信息
    public static string connstr = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ConnectionString;

    //建立连接对象 ，将配置信息作为 连接对象的参数
    SqlConnection conn = new SqlConnection(connstr);
   
    public List<int> getUserLiksList(int uid)
    {
        SqlConnection conn2 = new SqlConnection(connstr);
        List<int> list = new List<int>();
        try
        {
            //写对数据库的操作语句
            string str = "select fileid from loves where userid = " + uid;
            //打开数据库连接；
            conn2.Open();
            //建立一个对数据库的操作的执行对象命令
            SqlCommand cmd = new SqlCommand(str, conn2);
            //执行对数据库的操作，并将对数据库操作的结果保存起来
            SqlDataReader reader = cmd.ExecuteReader();
            //对结果进行判断并处理
            while (reader.Read())
            {
                list.Add(reader.GetInt32(1));
            }
            reader.Close();
            return list;
        }
        catch
        {
            Response.Write("<script>alert('error')</script>");
            return list;
        }
        //关闭数据集，关闭连接

        finally
        {
            conn2.Close();
        }
    }
    public List<int> getUserCollections(int uid)
    {
        SqlConnection conn2 = new SqlConnection(connstr);
        try
        {
            //写对数据库的操作语句
            string str = "select fileid from collect where userid = "+uid;
            //打开数据库连接；
            conn2.Open();
            //建立一个对数据库的操作的执行对象命令
            SqlCommand cmd = new SqlCommand(str, conn2);
            //执行对数据库的操作，并将对数据库操作的结果保存起来
            SqlDataReader reader = cmd.ExecuteReader();
            //对结果进行判断并处理
            List<int> list = new List<int>();
            while (reader.Read())
            {
                list.Add(reader.GetInt32(0));
            }
            reader.Close();
            return list;
        }
        catch
        {
            Response.Write("<script>alert('用户名或密码错误，登录不成功')</script>");
            return null;
        }
        //关闭数据集，关闭连接

        finally
        {
            conn2.Close();
        }
    }

    //重置
    protected void btncancle_Click(object sender, EventArgs e)
    {
        LgUsername.Text = "";
        LgUserpass.Text = "";
        txtUsername.Text = "";
        txtPassword.Text = "";
        txtrepassword.Text = "";
        //Response.Redirect("~/AdminDefault.aspx");
    }

    //注销会话期
    protected void lbtnexit_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Username.Text = "未登录";
        Userid.Text = "";
        ImgUser.ImageUrl = ResolveUrl(SelectHeader());
        ImgUser2.ImageUrl = ResolveUrl(SelectHeader());
    }
    //搜索
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "all")
        {
            Response.Redirect("~/search.aspx?all=" + txtsearch.Text);
        }
        if (DropDownList1.SelectedValue == "content")
        {
            Response.Redirect("~/search.aspx?all=" + txtsearch.Text);
        }
        else
        {
            Response.Redirect("~/search.aspx?" + DropDownList1.SelectedValue + "=" + txtsearch.Text);
        }
    }
    //反馈
    protected void feedback_btn1_Click(object sender, EventArgs e)
    {
        SqlConnection conn2 = new SqlConnection(connstr);
        try
        {
            User u = (User)Session["user"];
            String con = feedback_1.Text;
            if (con.Trim() == "")
            {
                Response.Write("<script>alert('反馈内容不能为空!')</script>");
            }
            else
            {
                //写对数据库的操作语句
                string str = "insert into Feedback(userid,content,publishdate) values(" + u.Userid + ",'" +
                    con + "','" + DateTime.Now.ToShortDateString() + "')";
                //打开数据库连接；
                conn2.Open();
                //建立一个对数据库的操作的执行对象命令
                SqlCommand cmd = new SqlCommand(str, conn2);
                //执行对数据库的操作，并将对数据库操作的结果保存起来
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('反馈成功!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('反馈失败!')</script>");
                }
            }
        }
        catch
        {
            Response.Write("<script>alert('请登录后再反馈')</script>");
            
        }
        //关闭数据集，关闭连接

        finally
        {
            conn2.Close();
        }
    }
    //邮箱反馈
    protected void feedback_btn2_Click(object sender, EventArgs e)
    {
        SqlConnection conn2 = new SqlConnection(connstr);
        try
        {
            User u = (User)Session["user"];
            String con = feedback_2.Text;
            String con_email = feedback_email.Text;
            if (con.Trim() == "")
            {
                Response.Write("<script>alert('反馈内容不能为空!')</script>");
            }
            else
            {
                //写对数据库的操作语句
                string str = "insert into Feedback(userid,content,publishdate,email) values(" + u.Userid + ",'" +
                    con + "','" + DateTime.Now.ToShortDateString() + "','" + con_email + "')";
                //打开数据库连接；
                conn2.Open();
                //建立一个对数据库的操作的执行对象命令
                SqlCommand cmd = new SqlCommand(str, conn2);
                //执行对数据库的操作，并将对数据库操作的结果保存起来
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('反馈成功!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('反馈失败!')</script>");
                }
            }
        }
        catch
        {
            Response.Write("<script>alert('请登录后再反馈')</script>");

        }
        //关闭数据集，关闭连接

        finally
        {
            conn2.Close();
        }
    }
}
