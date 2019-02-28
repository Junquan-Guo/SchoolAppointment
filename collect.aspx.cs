using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class collect : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    User user = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["user"];
        if (user != null)
        {
            Label1.Text = ""+user.Userid+"";
        }
        else if (user == null)
        {
        }
        init();
    }
    public void init()
    {
        if (user != null)
        {
            String sql = "select COUNT(collectid) from collect where userid='" + user.Userid + "'";
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
    }

}