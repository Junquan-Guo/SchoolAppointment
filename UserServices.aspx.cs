using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class UserServices : System.Web.UI.Page
{
    public static string connstr = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request["type"].ToString();
        if (type == "login")
        {
            string cap = Request["cap"];
            if (cap.ToLower() != Session["cap"].ToString().ToLower())
            {
                Response.Write("验证码错误");
                Response.End();
            }
            else
            {
                Response.Write(login(Request["username"].ToString(), Request["password"]));
                Response.End();
            }
        }
        if (type == "reg")
        {
            string cap = Request["cap"];
            if (cap.ToLower() != Session["cap"].ToString().ToLower())
            {
                Response.Write("验证码错误");
                Response.End();
            }
            else
            {
                Response.Write(reg(Request["username"].ToString(), Request["password"].ToString(),Request["phone"].ToString()));
                Response.End();
            }
        }
        if (type == "dianzan")
        {
            Response.Write(dianzan(int.Parse(Request["fileid"])));
            Response.End();
        }
    }

    public String login(String username,String password)
    {
         
        //建立连接对象 ，将配置信息作为 连接对象的参数
        SqlConnection conn = new SqlConnection(connstr);
        try
        {
            //写对数据库的操作语句
            string str = "select * from users where username='" + username + "' and password='" + password + "'";

            //打开数据库连接；
            conn.Open();
            //建立一个对数据库的操作的执行对象命令
            SqlCommand cmd = new SqlCommand(str, conn);

            //执行对数据库的操作，并将对数据库操作的结果保存起来
            SqlDataReader reader = cmd.ExecuteReader();

            //对结果进行判断并处理
            if (reader.Read())
            {
                User user = new User();
                user.Userid = reader.GetInt32(0);
                user.Username = reader.GetString(1);
                user.Password = reader.GetString(2);
                user.Sex = reader.GetString(3);
                //user.Email = reader.GetString(4);
                user.Phone = reader.GetString(5);
                user.Birthday = reader.GetDateTime(6).ToString();
                user.Introduce = reader.GetString(7);
                //user.Region = reader.GetString(8);
                user.Picture = reader.GetString(9);
                List<int> list = getUserCollections(user.Userid);
                if (list == null)
                {
                    Response.Write("<script>alert('error')</script>");
                }
                else
                {
                    user.List = list;
                }
                Session["user"] = user;
                reader.Close();
                return user.Username + "," + user.Picture;
            }
            else{
                reader.Close();
                return "";
            }
        }
        catch
        {
            return "";
        }
        //关闭数据集，关闭连接

        finally
        {
            conn.Close();
        }
    }

    public List<int> getUserCollections(int uid)
    {
        SqlConnection conn2 = new SqlConnection(connstr);
        try
        {
            //写对数据库的操作语句
            string str = "select fileid from collect where userid = " + uid;
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
            return null;
        }
        //关闭数据集，关闭连接

        finally
        {
            conn2.Close();
        }
    }
   
    public String reg(String username, String password,String phone)
    {
        SqlConnection conn = new SqlConnection(connstr);
        try{
            conn.Open();
            string str = "select * from users where username='" + username + "' ";
            SqlCommand cmd = new SqlCommand(str, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                reader.Close();
                return "用户名已存在";
            }
            else
            {
                reader.Close();
                str = "select * from users where phone='" + phone + "' ";
                cmd = new SqlCommand(str, conn);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    return "手机号码已被注册";
                }
                else
                {
                    reader.Close();
                    string str1 = "insert into users(username,phone,sex,password,picture,birthday,introduce,grade) values('" +
                        username + "','" + phone + "','" + "保密" + "','" +
                        password + "','" + "~/images/userface.png" + "','" +
                        DateTime.Now.ToString("G") + "','" + "暂无介绍!" + "','" + "普通会员" + "')";
                    cmd = new SqlCommand(str1, conn);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return "注册成功";
                    }
                    else
                    {
                        return "注册失败";
                    }
                }
            }
        }
        catch(Exception ex)
        {
            return "注册失败";
        }
        finally { conn.Close(); }
    }

    public String dianzan(int fileid)
    {
        //建立连接对象 ，将配置信息作为 连接对象的参数
        SqlConnection con = new SqlConnection(connstr);
        if (Session["user"] != null)
        {
            User user = (User)Session["user"];
            if (user.LikesList != null)
            {
                foreach (int id in user.LikesList)
                {
                    if (id == fileid)
                    {
                        String str5 = "delete from loves where userid =" + user.Userid + " and fileid = " + fileid;
                        try
                        {
                            con.Open();
                            SqlCommand com = new SqlCommand(str5, con);
                            if (com.ExecuteNonQuery() > 0)
                            {
                                user.LikesList.Remove(id);
                                Session["user"] = user;
                                com = new SqlCommand("update files set love = love - 1 where fileid = " + fileid, con);
                                com.ExecuteNonQuery();
                                return "取消点赞成功";
                            }
                            else
                                return "取消点赞失败2";
                        }
                        catch (Exception ez)
                        {
                            return "取消点赞失败1";
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
            }

            String str2 = "insert into loves(userid,fileid) values(" + user.Userid + "," + fileid + ")";
            try
            {
                con.Open();
                SqlCommand com5 = new SqlCommand(str2, con);
                if (com5.ExecuteNonQuery() > 0)
                {
                    if (user.LikesList == null)
                        user.LikesList = new List<int>();
                    user.LikesList.Add(fileid);
                    Session["user"] = user;
                    com5 = new SqlCommand("update files set love = love + 1 where fileid = " + fileid, con);
                    com5.ExecuteNonQuery();
                    return "点赞成功";
                }
                else
                    return "点赞失败1";
            }
            catch (Exception ez)
            {
                return "点赞失败2";
            }
            finally
            {
                con.Close();
            }
        }
        else
        {
            return "您还未登录";
        }
    }
}