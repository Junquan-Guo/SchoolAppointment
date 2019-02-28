using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HouTai_NewsAdd : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["managename"] == null)
        {
            //Response.Redirect("~/HouTai/404.aspx");
        }
        else
        {

        }
        //判断是否第一次进入页面，如果是，则绑定数据库；如果不是，则无需绑定。
        if (!this.IsPostBack)
        {
            //绑定classname 
            string cmdText = "select* from class where classid<7";
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(cmdText, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                this.DropDownList1.DataSource = sdr;
                this.DropDownList1.DataTextField = "classname";//文本内容
                this.DropDownList1.DataValueField = "classid"; //数据源字段
                this.DropDownList1.DataBind();
                sdr.Close();

                //growname
                string cmdCityText = "select* from grows where growname != '全部' and classid=" + this.DropDownList1.SelectedValue;
                SqlCommand cmdCity = new SqlCommand(cmdCityText, con);
                sdr = cmdCity.ExecuteReader();
                this.DropDownList2.DataSource = sdr;
                this.DropDownList2.DataTextField = "growname";
                this.DropDownList2.DataValueField = "growid";
                this.DropDownList2.DataBind();
                sdr.Close();
                //关闭连接
                con.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
        init();
    }
    
    //下拉列表
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //classmane的ID
        string classid = this.DropDownList1.SelectedValue;
        con.Open();
        try
        {
            string cmdCityText = "select* from grows where growname != '全部' and classid=" + classid;
            SqlCommand cmd = new SqlCommand(cmdCityText, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            //绑定
            this.DropDownList2.DataSource = sdr;
            this.DropDownList2.DataTextField = "growname";
            this.DropDownList2.DataValueField = "growid";
            this.DropDownList2.DataBind();
            sdr.Close();
            con.Close();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
    }

    public void init()
    {
        String sql = "SELECT TOP 1 fileid+1 FROM files order by fileid desc;";
        String sql2 = "SELECT  growid  FROM grows where classid=" + DropDownList1.SelectedValue + "  and growname='全部'";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlCommand com2 = new SqlCommand(sql2, con);
            SqlDataReader
            re = com.ExecuteReader();
            if (re.Read())
                Label5.Text = re.GetInt32(0).ToString();
            re.Close();

            re = com2.ExecuteReader();
            if (re.Read())
                Label9.Text = re.GetInt32(0).ToString();
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

    //重置
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        appDate.Text = "";
        Label11.Text = "";
        Label12.Text = "";
        TextBox7.Text = "";
        Editor1.Text = "";
        Image1.ImageUrl = "~/HouTai/images/pic.png";

    }
    //提交
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script>alert('图文标题不能为空！！！')</script>");
        }
        else if (TextBox2.Text == "")
        {
            Response.Write("<script>alert('图文作者不能为空！！！')</script>");
        }
        else if (appDate.Text == "")
        {
            Response.Write("<script>alert('发布时间不能为空！！！')</script>");
        }
        else if (Label11.Text.Trim() != "文件上传成功!预约如图所示：")
        {
            Response.Write("<script>alert('请上传封面图片！！！')</script>");
        }

        else if (TextBox7.Text == "")
        {
            Response.Write("<script>alert('图文摘要不能为空！！！')</script>");
        }
        else if (Editor1.Text.Trim() == "")
        {
            Response.Write("<script>alert('文章内容不能为空！！！')</script>");
        }

        else
        {
            String sql = "insert into files(filename,publishdate,filecontent,radact,abstract,pic,reading,amount,love) values('" + TextBox1.Text + "','" + appDate.Text + "','" + Editor1.Text + "','" + TextBox2.Text + "','" + TextBox7.Text + "','" + Label12.Text + "','" + 0 + "','" + 0 + "','" + 0 + "')";
            String sql2 = "insert into maps(fileid,growid) values('" + Label5.Text + "','" + DropDownList2.DataValueField + "')";
            String sql3 = "insert into maps(fileid,growid) values('" + Label5.Text + "','" + Label9.Text + "')";
            try
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                if (com.ExecuteNonQuery() <= 0)
                    Response.Write("<script>alert('提交失败')</script>");
                else
                    Response.Write("<script>alert('提交成功')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('提交失败1')</script>");
            }
            finally
            {
                con.Close();
            }
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
  
}