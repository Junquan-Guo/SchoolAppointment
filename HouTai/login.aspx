<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="HouTai_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>校约健</title>
    <link rel="shortcut icon" href="~/images/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="css/pages/login.css" /><%--login样式--%>
    <link rel="stylesheet" href="css/style.default.css" />
    <%--字体样式--%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" />
    <%-- 设置字体--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="hero-area">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 ">
                            <div class="contact-h-cont">
                                <h3 class="text-center">
                                    <img src="images/logo.png" class="img-fluid" alt="" /></h3>
                                <br />
                                <div class="form-group">
                                    <label for="username"><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;管理员:</label>
                                    <asp:TextBox ID="txtmanagename" CssClass="form-control" runat="server" placeholder="输入用户名"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><i class="fa fa-unlock-alt"></i>&nbsp;&nbsp;&nbsp;密码:</label>
                                    <asp:TextBox ID="txtmanagepassword" CssClass="form-control" runat="server" placeholder="输入用户密码" TextMode="Password"></asp:TextBox>
                                </div>
                                <asp:Button ID="btnlogin" CssClass="btn btn-general btn-blue" runat="server" Text="登 录" OnClick="btnlogin_Click" />
                                <asp:Button ID="btncancle" CssClass="btn btn-general btn-danger" runat="server" Text="重 置" OnClick="btncancle_Click1" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
