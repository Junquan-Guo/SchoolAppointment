﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HouTai_NameList : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    ArrayList deleteUser = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["managename"] == null)
        {
            //Response.Redirect("~/HouTai/404.aspx");
        }
        else
        {

        }
        init();
    }
    public void init()
    {
        String sql = "select COUNT(manageid) from manage";
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader
            re = com.ExecuteReader();
            if (re.Read())
                Label3.Text = re.GetInt32(0).ToString();
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
    //设置按钮是否隐藏
    public void IsVisivble(Boolean b)
    {
        Button4.Visible = b;
        Button5.Visible = b;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox b = (CheckBox)sender;
        if (b.Checked)
            deleteUser.Add(b);
        else
        {
            if (deleteUser.Contains(b))
                deleteUser.Remove(b);
        }
    }

    //重置选中按钮
    public void initCheckBox()
    {
        foreach (CheckBox b in deleteUser)
            b.Checked = false;
        deleteUser.Clear();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageList.aspx");
        IsVisivble(true);
    }

    public void DeleteUser(int id)
    {
        String sql = "delete from manage where manageid = " + id;
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(sql, con);
            if (com.ExecuteNonQuery() <= 0)
                Response.Write("<script>alert('管理员" + id + "删除失败')</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('管理员" + id + "删除失败')</script>");
        }
        finally
        {
            con.Close();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        if (deleteUser.Count == 0)
            Response.Write("<script>alert('请选择你要删除的列')</script>");
        else
        {
            foreach (CheckBox b in deleteUser)
            {
                int id = int.Parse(b.ToolTip);
                DeleteUser(id);
            }
        }
        initCheckBox();
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        initCheckBox();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton bt = (LinkButton)sender;
        Response.Redirect("UserEditor.aspx?userid=" + bt.ToolTip);
    }

    //搜索
    protected void Button6_Click(object sender, EventArgs e)
    {
        String text = TextBox1.Text;
        if (text != "")
        {
            Label1.Text += text + "^";
            SqlDataSource1.SelectCommand = "SELECT * FROM [manage] where managename like '%" + text + "%'";
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
                Label2.Text = "搜索不到任何有关的记录！！！";
            else
                Label2.Text = "";
            IsVisivble(true);
        }
        else
        {
            Label2.Text = "搜索框不能为空";
            GridView1.Visible = false;
            Button4.Visible = true;
            Button5.Visible = false;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        String s = Label1.Text.Substring(0, Label1.Text.Length - 1);

        String[] key = s.Split('^');
        List<String> list = key.ToList();
        if (list.Count > 1)
        {
            String str = list[list.Count - 2];
            SqlDataSource1.SelectCommand = "SELECT * FROM [manage] where managename like '%" + str + "%'";
            GridView1.DataBind();
            TextBox1.Text = str;
            //重置label1文本
            Label1.Text = "";
            list.RemoveAt(list.Count - 1);
            foreach (String s1 in list)
            {
                Label1.Text += s1 + "^";
                Label2.Text = "";
            }

        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [manage]";
            GridView1.DataBind();
            IsVisivble(false);
            Label1.Text = "";
            TextBox1.Text = "";
        }
    }
}