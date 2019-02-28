using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    public static String conString = ConfigurationManager.ConnectionStrings["Fitness312ConnectionString"].ToString();
    private SqlConnection con = new SqlConnection(conString);
    public int i = 1;
    public int j= 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select introduce,introduce2,introduce3 from label where labelid = 9";
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader re = com.ExecuteReader();

        while (re.Read())
        {
            Image1.ImageUrl = ResolveUrl(re["introduce"].ToString());
            Image2.ImageUrl = ResolveUrl(re["introduce2"].ToString());
            Image3.ImageUrl = ResolveUrl(re["introduce3"].ToString());
        }
        re.Close();
    }

}