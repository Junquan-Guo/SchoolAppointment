<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="video_detail.aspx.cs" Inherits="video_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <!-- main -->
    <style style="text/css">
        .navbar-nav > li:nth-of-type(3) > a.active {
            color: #ffffff !important;
            background-color: #E60012;
        }
        .icon_play {
            font-size:3em;
            color:#f00;
            transition: all 0.3s ease 0s;
        }
        .icon_play:hover {
            color:#00ff90;
        }
    </style>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT  v.*, g.[growname] buwei1, g1.[growname] type1,g2.[growname] 
        FROM [dbo].[video] v 
        INNER JOIN [dbo].[grows] g
            ON v.[buwei] = g.[growid]
        INNER JOIN [dbo].[grows] g1   
            ON v.[type] = g1.[growid]
        INNER JOIN [dbo].[grows] g2    
            ON v.[nandu] = g2.[growid] WHERE ([videoid] = @videoid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="videoid" QueryStringField="videoid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <h3 class="agile_w3_title">视频详情</h3>
                </div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;<span>当前位置：
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
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left left-border" role="main">
                    <div class="about-page-wrap">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="videoid" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <div class="com-cnt page-content">
                                    <h1 class="single_post_title_main">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("videoname") %>'></asp:Label>
                                    </h1>
                                    <p>
                                        <span><i class="fa fa-clock-o">&nbsp;</i><asp:Label ID="Label3" runat="server" Text='<%#Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:Label>&nbsp;&nbsp;</span>
                                        <span><i class="fa fa-eye">&nbsp;</i><asp:Label ID="Label4" runat="server" Text='<%#Eval("nub") %>'></asp:Label>&nbsp;&nbsp;</span>
                                        <span><i class="fa fa-thumbs-o-up">&nbsp;</i><asp:Label ID="Label5" runat="server" Text='<%#Eval("love") %>'></asp:Label>&nbsp;&nbsp;</span>
                                    </p>
                                </div>
                                <div class="video_text">
                                    <div class="media">
                                        <div class="media-left">
                                            <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("pic") %>' CssClass="media-object" Style="width: 240px; margin: 0 10px 20px 0" />
                                        </div>
                                        <div class="media-body">
                                            <table class="table table-bordered table-hover">
                                                <tbody>
                                                    <tr>
                                                        <td class="col-md-3"><strong>更新时间</strong></td>
                                                        <td class="col-md-9">
                                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("publishdate") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr class="active">
                                                        <td><strong>作者</strong></td>
                                                        <td>
                                                            <p>
                                                                <a href="search.asp?actor=ADMIN3" target="_blank">
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("radact") %>'></asp:Label></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>参与人数</strong></td>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("nub")+"人参与" %>'></asp:Label></td>
                                                    </tr>
                                                    <tr class="active">
                                                        <td><strong>部位</strong></td>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("buwei1") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>类型</strong></td>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("type1") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr class="active">
                                                        <td><strong>难度</strong></td>
                                                        <td>
                                                            <asp:Label ID="Label11" runat="server" Text='<%#Eval("grade") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr class="active">
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/video_play.aspx?videoid="+Eval("videoid")%>'>
                                                            <span class="glyphicon glyphicon-play-circle icon_play"></span>
                                                        </asp:HyperLink>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="text_content">
                                        <h4>介绍</h4>
                                        <p>
                                            <asp:Label ID="Label12" runat="server" Text='<%#Eval("abstract") %>'></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>

                        <%--上一篇，下一篇--%>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                            SelectCommand="select * from video where videoid in (
        select 
        case 
        when SIGN(videoid- @videoid) &lt; 0 THEN MAX(videoid)
        end 
        from video
        where videoid !=@videoid
        GROUP BY SIGN(videoid- @videoid)
        )
        ORDER BY videoid ">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="videoid" QueryStringField="videoid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                            SelectCommand="select * from video where videoid in (
        select 
        case 
        when SIGN(videoid- @videoid) &gt; 0 THEN MIN(videoid)
        end 
        from video
        where videoid !=@videoid
        GROUP BY SIGN(videoid- @videoid)
        )
        ORDER BY videoid ">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="videoid" QueryStringField="videoid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div id="pages" class="page">
                        <ul class="pager">
                            <li class="previous">
                                <asp:ListView ID="ListView5" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource7">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink7" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' Text="&larr; 上一篇" runat="server"></asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' Text='<%# Eval("videoname") %>' runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>
                            <li class="next">
                                <asp:ListView ID="ListView6" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource8">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink8" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' Text="下一篇 &rarr;" runat="server"></asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' Text='<%# Eval("videoname") %>' runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>                                     
                        </ul>
                    </div>
                    </div>
                </div>

                <aside class="sidebar col-md-3 inner-right" role="complementary">
                    <%--搜索--%>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">搜索</span></h3>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="panel-collapse">站内搜索</span>
                            </h3>
                        </div>
                        <div class="panel-body">
                            <form class="searchform" id="searchform">
                                <div class="sform-div">
                                    <asp:TextBox ID="grabble" class="s" name="q" placeholder="输入关键字" runat="server"></asp:TextBox>
                                    <asp:Button ID="searchsubmit" CssClass="searchsubmit"  runat="server"/>
                                </div> 
                            </form>
                        </div>
                    </div>
                    <%--最新视频--%>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">最新视频</span>
                        </h3>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">最新视频</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tabbed custom-tabbed">
                                <div class="block current">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                                        SelectCommand="SELECT top 9 * FROM [video]  ORDER BY [publishdate] DESC"></asp:SqlDataSource>
                                    <ul>
                                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <li class="">
                                                    <span class="badge badge-radius badge-default color">
                                                        <%= i++ %>
                                                    </span>
                                                    <asp:HyperLink ID="HyperLink3" runat="server" 
                                                        NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid") %>'
                                                        Text='<%# Eval("videoname").ToString().Length>12 ? Eval("videoname").ToString().Substring(0,10)+"...":Eval("videoname") %>'
                                                        ToolTip='<%# Eval("videoname") %>'></asp:HyperLink>
                                                    <span class="span_date2">
                                                        <asp:Label ID="Headline4" runat="server" Text='<%#"["+ Eval("publishdate","{0:MM-dd}")+"]" %>'></asp:Label>
                                                    </span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--推荐--%>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                        SelectCommand="SELECT top 3 v.*, g1.[growname] qw
FROM [dbo].[video] v 
INNER JOIN [dbo].[grows] g1   
    ON v.[type] = g1.[growid]
WHERE g1.[growname] in(
SELECT g1.[growname] 
FROM [dbo].[video] v 
INNER JOIN [dbo].[grows] g1   
    ON v.[type] = g1.[growid]
		                    WHERE (v.[videoid] = @videoid)) and (v.[videoid] != @videoid)
                        ORDER BY NEWID()">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="videoid" QueryStringField="videoid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">相似视频</span>
                        </h3>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">推荐视频</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tabbed custom-tabbed">
                                <div class="block current">
                                    <ul class="widget-list">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <li>
                                                    <figure>
                                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid") %>'>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pic") %>' />
                                                        </asp:HyperLink>
                                                    </figure>
                                                    <div class="sn-wrapper">
                                                        <p class="s-desc">
                                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid") %>' Text='<%# Eval("videoname") %>' ToolTip='<%# Eval("videoname") %>'>
                                                            </asp:HyperLink>
                                                        </p>
                                                        <span class="comments">
                                                            <i class="fa fa-calendar"></i>&nbsp;
                                                            <asp:HyperLink ID="Label10" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:HyperLink>
                                                        </span>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <!-- END-main -->

</asp:Content>
