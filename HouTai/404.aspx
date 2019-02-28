<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="HouTai_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>校约健</title>
    <link rel="shortcut icon" href="~/images/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="css/pages/404.css"/>
    <link rel="stylesheet" href="css/style.default.css"/><%--字体样式--%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/> <%-- 设置字体--%>

</head>
<body>
    <form id="form1" runat="server">
        <section class="hero-area">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <div class="block text-center">
                            <h1 class="animated wow fadeInLeft" data-wow-delay="0.3s" data-wow-duration=".2s">404!</h1><%--执行0.3s，延时0.2s--%>
                            <p class="animated wow fadeInRight" data-wow-delay="0.5s" data-wow-duration=".5s">找不到页面.</p>
                            <div class="animated wow fadeInUp text-center" data-wow-delay="0.7s" data-wow-duration=".7s">
                                <span>
                                    <a class="btn btn-general btn-blue" href="login.aspx" role="button">返回登录页</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
