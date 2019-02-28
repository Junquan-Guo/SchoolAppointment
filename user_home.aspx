<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user_home.aspx.cs" Inherits="user_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/index.css" media="screen" />

    <!-- main -->
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <h3 class="agile_w3_title">我的主页</h3>
                </div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;
                    <span>当前位置： 
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" PathSeparator="/ ">
                            <CurrentNodeStyle ForeColor="#777777" Font-Size="13px" />
                            <NodeStyle Font-Bold="True" ForeColor="#777777" Font-Size="13px" />
                            <PathSeparatorStyle Font-Bold="True" Font-Size="8px" ForeColor="#777777" CssClass="separator" />
                            <RootNodeStyle Font-Bold="True" ForeColor="#0daed3" Font-Size="13px" />
                        </asp:SiteMapPath>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <aside class="sidebar col-md-1 inner-left" role="complementary">
                </aside>
                <div class="main col-md-10 inner-left" role="main">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">个人主页</h3>
                        </div>
                        <div class="panel-body">
                            <div class="update_screen">
                                <div class="col-md-3 col-sm-3 media-right avatar">
                                    <div class="f-pr">
                                        <asp:Image ID="avatar"  runat="server" ImageUrl="~/images/user.png" />
                                    </div>
                                </div>
                                <div class="col-md-9 col-sm-9 media-right avatar">
                                    <div class="name">
                                        <div class="f-cb2">
                                            <h2 class="h2_head ">
                                                <span class="h2_text">
                                                    <asp:Label ID="Label1" CssClass=" " runat="server" Text="登陆后显示用户名"></asp:Label>
                                                </span>
                                                <asp:Label ID="Label5" ToolTip="" runat="server" Text=" "></asp:Label>
                                            </h2>
                                            <asp:Button ID="BianJi" cssClass="btn btn-primary h2_btn" runat="server" Text="编辑个人资料" OnClick="BianJi_Click" />
                                        </div>
                                    </div>

                                    <ul class="data s-fc3 f-cb">
                                        <li class="fst"><a href="#"><strong>1</strong><span>动态</span></a></li>
                                        <li><a href="#"><strong>48</strong><span>关注</span></a></li>
                                        <li><a href="#"><strong>43</strong><span>粉丝</span></a></li>
                                    </ul>
                                    <div class="inf s-fc3 f-brk">
                                        <asp:Label ID="Label2" runat="server" Text="登陆后显示个人介绍信息"></asp:Label>
                                    </div>
                                    <div class="inf s-fc3">
                                        <asp:Label ID="Label3" runat="server" Text="所在地区：xx省 - xx市"></asp:Label>&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label4" runat="server" Text="年龄：n岁"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <aside class="sidebar col-md-1 inner-right" role="complementary">
                    </aside>
                </div>
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <!-- END-main -->

</asp:Content>


