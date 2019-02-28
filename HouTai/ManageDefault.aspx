<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="ManageDefault.aspx.cs" Inherits="HouTai_ManageDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/apps/Manage.css" />
    <div class="row" id="home-cont">
                <div class="alert alert-block alert-success">
                    <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>
                    <i class="icon-ok green"></i>欢迎使用<strong class="green">校约健后台系统<small>(v1.0)</small></strong>,<asp:Label ID="datetime" runat="server" Text="登录时间"></asp:Label>	
                </div>
                <div class="state-overview clearfix">
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol darkblue">
                                <a href="Inform.aspx">
                                    <i class="fa fa-comments-o"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="message" runat="server" Text="0"></asp:Label></h1>
                                <p>今日信息</p>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol terques">
                                <a href="UserList.aspx">
                                    <i class="fa fa-user"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="amount" runat="server" Text="0"></asp:Label></h1>
                                <p>用户总数</p>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol red">
                                <a href="UserList.aspx">
                                    <i class="fa fa-user-plus"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="newly" runat="server" Text="0"></asp:Label></h1>
                                <p>新增人数</p>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol yellow">
                                <a href="NewsList.aspx">
                                    <i class="fa fa-file-word-o"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="photograph" runat="server" Text="0"></asp:Label>
                                </h1>
                                <p>图文数量</p>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol blue">
                                <a href="#">
                                    <i class="fa fa-file-video-o"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="video" runat="server" Text="0"></asp:Label>
                                </h1>
                                <p>视频数量</p>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <section class="panel">
                            <div class="symbol green">
                                <a href="#">
                                    <i class="fa fa-file-excel-o"></i>
                                </a>
                            </div>
                            <div class="value">
                                <h1>
                                    <asp:Label ID="check" runat="server" Text="0"></asp:Label></h1>
                                <p>活动图文</p>
                            </div>
                        </section>
                    </div>
                </div>
                <!--实时交易记录-->
                <div class="clearfix">
                    <div class="Order_Statistics">
                        <div class="title_name">素材信息</div>
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td class="name">图片数量：</td>
                                    <td class="munber"><a href="#">340</a>&nbsp;个</td>
                                </tr>
                                <tr>
                                    <td class="name">视频数量：</td>
                                    <td class="munber"><a href="#">2</a>&nbsp;个</td>
                                </tr>
                                <tr>
                                    <td class="name">重复的素材：</td>
                                    <td class="munber"><a href="#">13</a>&nbsp;个</td>
                                </tr>
                                <tr>
                                    <td class="name">损坏的素材：</td>
                                    <td class="munber"><a href="#">6</a>&nbsp;个</td>
                                </tr>
                                <tr>
                                    <td class="name">回收站的素材：</td>
                                    <td class="munber"><a href="#">6</a>&nbsp;个</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="Order_Statistics">
                        <div class="title_name">会员登录统计信息</div>
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td class="name">注册会员登录：</td>
                                    <td class="munber"><a href="#">40</a>&nbsp;次</td>
                                </tr>
                                <tr>
                                    <td class="name">微信会员登录：</td>
                                    <td class="munber"><a href="#">16</a>&nbsp;次</td>
                                </tr>
                                <tr>
                                    <td class="name">新浪会员登录：</td>
                                    <td class="munber"><a href="#">303</a>&nbsp;次</td>
                                </tr>
                                <tr>
                                    <td class="name">QQ会员登录：</td>
                                    <td class="munber"><a href="#">12</a>&nbsp;次</td>
                                </tr>
                                <tr>
                                    <td class="name">今天登录的会员：</td>
                                    <td class="munber"><a href="#">12</a>&nbsp;次</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--<div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> -->
                    <div class="news_style">
                        <div class="title_name">最新消息</div>
                        <ul class="list">
                            <li><i class="fa fa-bell-o"></i><a href="#">系统更新日志</a></li>
                            <li><i class="fa fa-bell-o"></i><a href="#">系统错误通告</a></li>
                            <li><i class="fa fa-bell-o"></i><a href="#">上个月的文章总结</a></li>
                            <li><i class="fa fa-bell-o"></i><a href="#">文章涉及法律警告</a></li>
                            <li><i class="fa fa-bell-o"></i><a href="#">管理员手册</a></li>
                        </ul>
                    </div>
                </div>
                <!--记录-->
                <div class="clearfix">
                    <div class="home_btn">
                        <div>
                            <a href="NewsAdd.aspx" title="添加图文" class="btn  btn-primary btn-sm no-radius">
                                <span class="glyphicon glyphicon-picture"></span>
                                <h5 class="margin-top">添加图文</h5>
                            </a>
                            <a href="javascript:(void);" title="添加视频" class="btn  btn-info btn-sm no-radius">
                                <span class="glyphicon glyphicon-film"></span>
                                <h5 class="margin-top">添加视频</h5>
                            </a>
                            <a href="javascript:(void);" title="添加活动" class="btn  btn-info btn-sm no-radius">
                                <span class="glyphicon glyphicon-time"></span>
                                <h5 class="margin-top">添加活动</h5>
                            </a>
                            <a href="javascript:(void);" title="添加链接" class="btn  btn-warning btn-sm no-radius">
                                <span class="glyphicon glyphicon-send"></span>
                                <h5 class="margin-top">添加链接</h5>
                            </a>
                            <a href="javascript:(void);" title="添加广告" class="btn  btn-danger btn-sm no-radius">
                                <span class="glyphicon glyphicon-qrcode"></span>
                                <h5 class="margin-top">添加广告</h5>
                            </a>
                            <a href="javascript:(void);" title="添加通告" class="btn  btn-pink btn-sm no-radius">
                                <span class="glyphicon glyphicon-flag"></span>
                                <h5 class="margin-top">添加通告</h5>
                            </a>
                            <a href="javascript:(void);" title="个人信息" class="btn  btn-success btn-sm no-radius">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <h5 class="margin-top">个人信息</h5>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
</asp:Content>

