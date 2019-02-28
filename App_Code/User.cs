using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// User 的摘要说明
/// </summary>
[Serializable]
public class User
{
    public User()
    {
    }
    private int userid;

    public int Userid
    {
        get { return userid; }
        set { userid = value; }
    }
    private String username;

    public String Username
    {
        get { return username; }
        set { username = value; }
    }
    private String password;

    public String Password
    {
        get { return password; }
        set { password = value; }
    }

    private String sex;

    public String Sex
    {
        get { return sex; }
        set { sex = value; }
    }

    private String picture;

    public String Picture
    {
        get { return picture; }
        set { picture = value; }
    }

    private String email;

    public String Email
    {
        get { return email; }
        set { email = value; }
    }

    private String phone;

    public String Phone
    {
        get { return phone; }
        set { phone = value; }
    }

    private String introduce;

    public String Introduce
    {
        get { return introduce; }
        set { introduce = value; }
    }
    private String birthday;

    public String Birthday
    {
        get { return birthday; }
        set { birthday = value; }
    }

    private String region;

    public String Region
    {
        get { return region; }
        set { region = value; }
    }
    

    private List<int> list;

    public List<int> List
    {
        get { return list; }
        set { list = value; }
    }

    private List<int> likesList;

    public List<int> LikesList
    {
        get { return likesList; }
        set { likesList = value; }
    }


    public string Elmail { get; set; }
}