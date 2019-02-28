<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/index.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/slide.css"/>
    <script type="text/javascript" src="js/jquery.caroufredsel.js"></script>
  <style>
      .carousel-inner img {
          width: 100%;
          height: 100%;
      }
      .navbar-nav > li:nth-of-type(1) > a.active {
          color: #ffffff !important;
          background-color: #E60012;
      }
  </style>
    <!--轮播-->
    <div id="a1portalSkin_ctr211899211899_mainArea" class="module-content">
        <div class="slideshow carousel clearfix" style="height: 750px; overflow: hidden;">
            <div id="carousel-211899">
                <div class="carousel-item">
                    <div class="carousel-img">
                        <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="javascript:void(0);" Target="">
                            <asp:Image ID="Image1" ImageUrl="~/images/lb_04.jpg" runat="server" Height="750px" />
                        </asp:HyperLink>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-img">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:void(0);" target="">
                            <asp:Image ID="Image2" ImageUrl="~/images/lb_04.jpg" runat="server" Height="750px" />
                        </asp:HyperLink>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-img">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="javascript:void(0);" target="">
                            <asp:Image ID="Image3" ImageUrl="~/images/lb_04.jpg" runat="server" Height="750px" />
                        </asp:HyperLink>
                    </div>
                </div>
            </div>

            <div class="carousel-btn carousel-btn-fixed" id="carousel-page-211899"></div>
            <div class="carousel-page">
                <div class="carousel-prev" id="carousel-prev-211899"></div>
                <div class="carousel-next" id="carousel-next-211899"></div>
            </div>
        </div>
        <script type="text/javascript">
            $(window).bind("load resize", function () {

                $("#carousel-211899").carouFredSel({

                    width: '100%',

                    items: { visible: 1 },

                    auto: { pauseOnHover: true, timeoutDuration: 5000 },

                    swipe: { onTouch: true, onMouse: true },

                    pagination: "#carousel-page-211899",

                    prev: { button: "#carousel-prev-211899" },

                    next: { button: "#carousel-next-211899" },

                    scroll: { fx: "crossfade" }//注释的话就是滚动的

                });

            });

        </script>
    </div>
    <!--END_轮播-->

    <!-- main -->
    <!-- 垂直滚动监听 -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] &lt;= @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <nav class="col-sm-3" id="myScrollspy">
        <div class="container-fluid">
            <ul class="nav nav-pills nav-stacked">
                <asp:ListView ID="ListView1" runat="server"  DataSourceID="SqlDataSource2" >
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="Monitor" runat="server" NavigateUrl='<%# "#"+Eval("introduce")%>' Text='<%# Eval("labelname") %>'>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
    </nav>
    <!-- END_垂直滚动监听 -->

    <%--met-index-tool--%>
    <asp:SqlDataSource ID="SqlDataSource_Headline1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="met-index-tool met-index-body" id="tool">
        <!--H2标题-->
        <div class="title">
            <asp:ListView ID="ListView_Headline1" runat="server"  DataSourceID="SqlDataSource_Headline1" >
                <ItemTemplate>
                    <h2 class="" >
                        <asp:Label ID="Headline1" runat="server" Text='<%# Eval("labelname") %>'></asp:Label>
                    </h2>
                    <div class="home-line" style="background: url(images/1514365123.png)center no-repeat;">
                    </div>
                    <p class="desc">
                        <asp:Label ID="Caption1" runat="server" Text='<%# Eval("introduce2") %>'></asp:Label>
                    </p>
                </ItemTemplate>
            </asp:ListView>
        </div><!--END_H2标题-->
        <!--container-->
        <div class="container">
            <div class="feature-grids">
                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource6">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon1"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink>                         
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource7">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon2"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink>
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView9" runat="server" DataSourceID="SqlDataSource8">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon3"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink>
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource9">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon4"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink>
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="clearfix"></div>

            </div>
		</div><!--END_container-->
        <!--hot-btns-->
		<div class="hot-btns">
            <asp:ListView ID="ListView_More1" runat="server"  DataSourceID="SqlDataSource_Headline1" >
                <ItemTemplate>
                    <asp:HyperLink ID="More1" runat="server" NavigateUrl='<%# "~/"+Eval("url") +".aspx?typeid=6"%>' Text='<%# Eval("more") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:ListView>
	    </div><!--END_hot-btns-->
    </div>
    <%--END_met-index-tool--%>

    <%-- met-index-hot--%>
    <asp:SqlDataSource ID="SqlDataSource_Headline2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="met-index-hot met-index-body" id="hot">
        <!--H2标题-->
        <div class="title">
            <asp:ListView ID="ListView_Headline2" runat="server"  DataSourceID="SqlDataSource_Headline2" >
                <ItemTemplate>
                    <h2 class="">
                        <asp:Label ID="Headline2" runat="server" Text='<%# Eval("labelname") %>'></asp:Label>
                    </h2>
                    <div class="home-line" style="background: url(images/1514365123.png)center no-repeat;">
                    </div>
                    <p class="desc">
                        <asp:Label ID="Caption2" runat="server" Text='<%# Eval("introduce2") %>'></asp:Label>
                    </p>
                </ItemTemplate>
            </asp:ListView>
        </div><!--END_H2标题-->
        <!--container-->
        <div class="container">
            <div class="row">
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                    SelectCommand="SELECT top 1 f.*,c.[classname]
                        FROM [dbo].[files] f 
                        INNER JOIN [dbo].[maps] m
                            ON f.[fileid] = m.[fileid]
                        INNER JOIN [dbo].[grows] g
                            ON m.[growid] = g.[growid]
                        INNER JOIN [dbo].[class] c
                            ON g.[classid] = c.[classid]
                        ORDER BY [publishdate] DESC, [reading]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                    SelectCommand="SELECT top 4 f.*, g.[growid], g.[growname],c.[classname]
                    FROM [dbo].[files] f 
                    INNER JOIN [dbo].[maps] m
                        ON f.[fileid] = m.[fileid]
                    INNER JOIN [dbo].[grows] g
                        ON m.[growid] = g.[growid]
                    INNER JOIN [dbo].[class] c
                        ON g.[classid] = c.[classid] and g.[growname]='全部'
                    WHERE f.[fileid] NOT IN (SELECT TOP 1 [fileid] FROM [files] ORDER BY [publishdate] DESC)    
                    ORDER BY [publishdate] DESC, [reading]"></asp:SqlDataSource>
                <asp:ListView ID="ListView11" runat="server" DataSourceID="SqlDataSource10">
                    <ItemTemplate>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="thumbnail thumbnail_big">
                                <asp:HyperLink ID="HyperLink8" cssClass="thumbnail__link" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                    <asp:Image ID="Image8" runat="server" ImageUrl='<%# Eval("pic")%>' Height="350" Width="560" alt="News" />
                                </asp:HyperLink>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category blue-line">
                                            <i class="fa fa-tags"></i>&nbsp;
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("classname")%>'></asp:Label>
                                        </p>
                                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' CssClass="news__head" runat="server" Text='<%# Eval("filename")%>'></asp:HyperLink>
                                        <p class="news__desc">
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("abstract")%>'>
                                            </asp:Label>
                                        </p>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">
                                            <asp:Label ID="Label11" runat="server" Text='<%#  Eval("publishdate","{0:ddd}")+","+ Eval("publishdate","{0:HH:mm}") %>'></asp:Label></span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                    <i class="fa fa-comment-o"></i>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("amount")%>'></asp:Label>
                                                </span>
                                            </li>
                                            <li>
                                                <span>
                                                    <i class="fa fa-eye"></i>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("reading")%>'></asp:Label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <asp:ListView ID="ListView12" runat="server" DataSourceID="SqlDataSource11">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <div class="thumbnail thumbnail_small">
                                    <asp:HyperLink ID="HyperLink8" cssClass="thumbnail__link"  NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("pic")%>' Height="153" Width="270" />
                                    </asp:HyperLink>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category blue-line">
                                            <i class="fa fa-tags"></i>&nbsp;
                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("classname")%>'></asp:Label>
                                        </p>
                                        <a href="news.html" class="news__link">
                                            <p class="news__text">
                                                <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  runat="server" Text='<%# Eval("filename")%>'></asp:HyperLink>
                                            </p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">
                                            <asp:Label ID="Label16" runat="server" Text='<%#  Eval("publishdate","{0:dddd}")+","+ Eval("publishdate","{0:HH:mm}") %>'></asp:Label>
                                        </span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                    <i class="fa fa-comment-o"></i>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("amount")%>'></asp:Label>
                                                </span>
                                            </li>
                                            <li>
                                                <span>
                                                    <i class="fa fa-eye"></i>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("reading")%>'></asp:Label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

            </div>
        </div><!--END_container-->
        <!--hot-btns-->
		<div class="hot-btns">
            <asp:ListView ID="ListView_More2" runat="server"  DataSourceID="SqlDataSource_Headline2" >
                <ItemTemplate>
                    <asp:HyperLink ID="More2" runat="server" NavigateUrl='<%# "~/"+Eval("url") +".aspx?typeid=2&classid=1&growid=1"%>' Text='<%# Eval("more") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:ListView>
	    </div><!--END_hot-btns-->
    </div>
    <%--END_met-index-hot--%>

    <%--met-index-video--%>
    <asp:SqlDataSource ID="SqlDataSource_Headline3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT top 3 * FROM [video] ORDER BY [publishdate] DESC, [nub] DESC"></asp:SqlDataSource>
    <div class="met-index-video met-index-body" id='video'>
        <!--H2标题-->
        <div class="title">
            <asp:ListView ID="ListView_Headline3" runat="server"  DataSourceID="SqlDataSource_Headline3" >
                <ItemTemplate>
                    <h2 class="">
                        <asp:Label ID="Headline3" runat="server" Text='<%# Eval("labelname") %>'></asp:Label>
                    </h2>
                    <div class="home-line" style="background: url(images/1514365123.png)center no-repeat;">
                    </div>
                    <p class="desc">
                        <asp:Label ID="Caption3" runat="server" Text='<%# Eval("introduce2") %>'></asp:Label>
                    </p>
                </ItemTemplate>
            </asp:ListView>
        </div><!--END_H2标题-->
        <!--container-->
        <div class="container">
            <div class="row">
                <asp:ListView ID="ListView6" runat="server"  DataSourceID="SqlDataSource5">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="newsBox">
                                <div class="thumbnail">
                                    <figure>
                                        <asp:HyperLink ID="HyperLink12" runat="server" cssClass="thumbnail__link">
                                            <asp:Image ID="Image7" runat="server" ImageUrl='<%# Eval("pic") %>' Width="380.77px" Height="270px" style="object-fit:cover" />
                                        </asp:HyperLink>
                                    </figure>
                                    <div class="caption maxheight2">
                                        <div class="box_inner">
                                            <div class="box">
                                                <p class="title">
                                                    <h5>
                                                        <asp:HyperLink ID="HyperLink10" runat="server" Text='<%# Eval("videoname").ToString().Length>24 ? Eval("videoname").ToString().Substring(0,23)+"...":Eval("videoname") %>'></asp:HyperLink>
                                                    </h5>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("abstract").ToString().Length>91 ? Eval("abstract").ToString().Substring(0,90)+"...":Eval("abstract") %>'></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div><!--END_container-->
        <!--hot-btns-->
		<div class="hot-btns">
            <asp:ListView ID="ListView_More3" runat="server"  DataSourceID="SqlDataSource_Headline3" >
                <ItemTemplate>
                    <asp:HyperLink ID="More3" runat="server" NavigateUrl='<%# "~/"+Eval("url") +".aspx?typeid=3"%>' Text='<%# Eval("more") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:ListView>
	    </div><!--END_hot-btns-->
    </div>
    <%--END_met-index-video--%>

    <%--met-index-game--%>
    <asp:SqlDataSource ID="SqlDataSource_Headline4" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="met-index-game met-index-body" id="game">
        <!--H2标题-->
        <div class="title">
            <asp:ListView ID="ListView_Headline4" runat="server"  DataSourceID="SqlDataSource_Headline4" >
                <ItemTemplate>
                    <h2 class="">
                        <asp:Label ID="Headline4" runat="server" Text='<%# Eval("labelname") %>'></asp:Label>
                    </h2>
                    <div class="home-line" style="background: url(images/1514365123.png)center no-repeat;">
                    </div>
                    <p class="desc">
                    </p>
                </ItemTemplate>
            </asp:ListView>
        </div><!--END_H2标题-->
        <!--container-->
        <div class="container">
            <div class="clearfix" data-plugin="matchHeight">
                <div class="col-md-7 col-xs-12 left-news">
                    <!--sec-title-->
                    <div class="sec-title">
                        <asp:ListView ID="ListView2" runat="server"  DataSourceID="SqlDataSource_Headline4" >
                            <ItemTemplate>
                                <h3>
                                    <asp:Label ID="Headline5" runat="server" Text='<%# Eval("introduce2") %>'></asp:Label>
                                </h3>
                                <span class="line"></span>
                                <asp:HyperLink ID="HyperLink7" title='<%# Eval("introduce2") %>' NavigateUrl="discover.aspx?typeid=7" Text="更多"  runat="server" ></asp:HyperLink>
                            </ItemTemplate>
                        </asp:ListView>        
                    </div><!--END_sec-title-->
                    <div id="myCarousel" class="carousel slide">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                            SelectCommand="SELECT top 1 * FROM [activity] a
                            INNER JOIN [dbo].[label] l
                            ON a.[introduce] = l.[introduce2]
                            ORDER BY [publishdate] DESC, [reading] DESC, [like] DESC">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                            SelectCommand="SELECT top 1 * FROM [activity] a
                            INNER JOIN [dbo].[label] l
                            ON a.[introduce] = l.[introduce2]
                            WHERE [activityid] NOT IN ( SELECT TOP 1 [activityid] FROM [activity] ORDER BY [publishdate] DESC) 
                            ORDER BY [publishdate] DESC, [reading] DESC, [like] DESC">
                        </asp:SqlDataSource>

                        <!-- 指示符 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                        </ol>
                        <div class="carousel-inner slick" id="imgnews-slick">
                            <asp:ListView ID="ListView5" runat="server"  DataSourceID="SqlDataSource1" >
                                <ItemTemplate>
                                    <div class="item active">
                                        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl='<%# "~/news_detail.aspx?activityid=" + Eval("activityid") %>' ToolTip='<%# Eval("activityname") %>' Target='_self'>
                                            <div class="text">
                                                <span class="icon">
                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/examine .png" />
                                                </span>
                                                <h3>
                                                    <span>
                                                        0<%= j++ %>
                                                    </span>
                                                    <asp:Label ID="HyperLink4" runat="server"
                                                        Text='<%# Eval("activityname").ToString().Length>41 ? Eval("activityname").ToString().Substring(0,40)+"...":Eval("activityname") %>'></asp:Label>
                                                </h3>
                                                <p class="des">
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("activitycontent").ToString().Length>71 ? Eval("activitycontent").ToString().Substring(0,70)+"...":Eval("activitycontent") %>'></asp:Label>
                                                </p>
                                            </div>                                          
                                                <asp:Image ID="Image6" CssClass="cover-image" runat="server" ImageUrl='<%# Eval("pic") %>' />
                                        </asp:HyperLink>
                                    </div>
                                </ItemTemplate>  
                            </asp:ListView>
                            <asp:ListView ID="ListView13" runat="server"  DataSourceID="SqlDataSource12" >
                                <ItemTemplate>
                                    <div class="item">
                                        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl='<%# "~/news_detail.aspx?activityid=" + Eval("activityid") %>' ToolTip='<%# Eval("activityname") %>' Target='_self'>
                                            <div class="text">
                                                <span class="icon">
                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/examine .png" />
                                                </span>
                                                <h3>
                                                    <span>
                                                        0<%= j++ %>
                                                    </span>
                                                    <asp:Label ID="HyperLink4" runat="server"
                                                        Text='<%# Eval("activityname").ToString().Length>41 ? Eval("activityname").ToString().Substring(0,40)+"...":Eval("activityname") %>'></asp:Label>
                                                </h3>
                                                <p class="des">
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("activitycontent").ToString().Length>71 ? Eval("activitycontent").ToString().Substring(0,70)+"...":Eval("activitycontent") %>'></asp:Label>
                                                </p>
                                            </div>
                                            <asp:Image ID="Image6" cssClass="cover-image" runat="server" ImageUrl='<%# Eval("pic") %>' />
                                        </asp:HyperLink>
                                    </div>
                                </ItemTemplate>  
                            </asp:ListView>
                            <!-- 轮播（Carousel）导航 -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                               <%-- <span class="fa fa-chevron-left" aria-hidden="true"></span>--%>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <%--<span class="fa fa-chevron-right" aria-hidden="true"></span>--%>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>

                </div>
                <div class="col-md-5 col-xs-12 right-news news-ul">
                    <!--sec-title-->
                    <div class="sec-title">
                        <asp:ListView ID="ListView3" runat="server"  DataSourceID="SqlDataSource_Headline4" >
                            <ItemTemplate>
                                <h3>
                                    <asp:Label ID="Headline6" runat="server" Text='<%# Eval("introduce3") %>'></asp:Label>
                                </h3>
                                <span class="line"></span>
                                <asp:HyperLink ID="HyperLink7" title='<%# Eval("introduce3")%>' NavigateUrl="discover.aspx?typeid=7" Text="更多"  runat="server" ></asp:HyperLink>
                            </ItemTemplate>
                        </asp:ListView>        
                    </div><!--END_sec-title-->

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand="SELECT top 9 * FROM [activity] a
                        INNER JOIN [dbo].[label] l
                        ON a.[introduce] = l.[introduce3]
                        ORDER BY [publishdate] DESC, [reading] DESC, [like] DESC">
                    </asp:SqlDataSource>
                    <ul>
                        <asp:ListView ID="ListView4" runat="server"  DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <li class="">
                                    <span class="badge badge-radius badge-default color">
                                        <%= i++ %>
                                    </span>
                                    <asp:HyperLink ID="HyperLink3" runat="server" 
                                        NavigateUrl='<%# "~/news_detail.aspx?activityid=" + Eval("activityid") %>'
                                        Text='<%# Eval("activityname").ToString().Length>26 ? Eval("activityname").ToString().Substring(0,25)+"...":Eval("activityname") %>' 
                                        ToolTip='<%# Eval("activityname") %>'></asp:HyperLink>
                                    <span class="span_date">
                                        <asp:Label ID="Headline4" runat="server" Text='<%#"["+ Eval("publishdate","{0:MM-dd}")+"]" %>' ></asp:Label>
                                    </span>
                                </li>
                            </ItemTemplate>
                        </asp:ListView>
                    </ul>
                </div>
            </div>
        </div><!--END_container-->
    </div>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    <%--END_met-index-game--%>

    <!-- END_main -->
</asp:Content>

