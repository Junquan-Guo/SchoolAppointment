<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news_detail.aspx.cs" Inherits="news_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <!-- main -->
    <style style="text/css">
        .navbar-nav > li:nth-of-type(2)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
        .u-btn {
            margin: 0; 
        }
    </style>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [files] WHERE ([fileid] = @fileid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT f.[fileid],f.[filename], g.[growname],c.[classname],t.[typename],t.[typeurl]
        FROM [dbo].[files] f 
        INNER JOIN [dbo].[maps] m
            ON f.[fileid] = m.[fileid]
        INNER JOIN [dbo].[grows] g
            ON m.[growid] = g.[growid]
        INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
        INNER JOIN [dbo].[types] t
            ON c.[typeid] = t.[typeid]and g.[growname]!='全部' 
        WHERE (f.[fileid] = @fileid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--上一篇，下一篇--%>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="select * from files where fileid in (
        select 
        case 
        when SIGN(fileid- @fileid) &lt; 0 THEN MAX(fileid)
        end 
        from files
        where fileid !=@fileid
        GROUP BY SIGN(fileid- @fileid)
        )
        ORDER BY fileid ">
        <SelectParameters>
            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="select * from files where fileid in (
        select 
        case 
        when SIGN(fileid- @fileid) &gt; 0 THEN MIN(fileid)
        end 
        from files
        where fileid !=@fileid
        GROUP BY SIGN(fileid- @fileid)
        )
        ORDER BY fileid ">
        <SelectParameters>
            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="col-md-6 col-sm-6 bcid-cat">
                            <h3 class="agile_w3_title">
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                            </h3>
                        </div>
                        <div class="col-md-6 col-sm-6 location">
                            <i class="fa fa-map-marker"></i>&nbsp;
                            <span> <asp:Label ID="Label7" runat="server" Text="当前位置："></asp:Label>
                                <ul class="breadcrumb">
                                    <li>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/"+Eval("typeurl") +".aspx?typeid=2&classid=1&growid=1"%>' Text='<%# Eval("typename") %>'></asp:HyperLink></li>
                                    <li>
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/"+Eval("typeurl") +".aspx?typeid=2&classid=1&growid=1"%>' Text='<%# Eval("classname") %>'></asp:HyperLink>
                                    </li>
                                    <li class="active">
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("growname") %>'></asp:Label>
                                    </li>
                                </ul>
                            </span>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>

    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left left-border" role="main">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="about-page-wrap">
                                <div class="com-cnt page-content">
                                    <h1 class="single_post_title_main">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("filename") %>'></asp:Label></h1>
                                    <span class="single-post-meta-wrapper">
                                        <span>作者：<asp:Label ID="Label2" runat="server" Text='<%# Eval("radact") %>'></asp:Label>&nbsp;&nbsp;</span>
                                        <span><i class="fa fa-clock-o">&nbsp;</i><asp:Label ID="Label3" runat="server" Text='<%# Eval("publishdate") %>'></asp:Label>&nbsp;&nbsp;</span>
                                        <span><i class="fa fa-eye">&nbsp;</i><asp:Label ID="Label4" runat="server" Text='<%# Eval("reading") %>'></asp:Label>&nbsp;&nbsp;</span>
                                        <span><i class="fa fa-thumbs-o-up">&nbsp;</i><asp:Label ID="Label5" runat="server" Text='<%# Eval("love") %>'></asp:Label>&nbsp;&nbsp;</span>
                                    </span>
                                    <span class="single-post-meta-wrapper2">
                                        <span><a class="dianzan imgbtn_dz"></a>&nbsp;点赞&nbsp;&nbsp;</span>
                                        <%--<span><asp:Button ID="Button5" cssClass="imgbtn_dz" Text="" OnClientClick="return confirm('点赞?')" runat="server"/>&nbsp;点赞&nbsp;&nbsp;</span>--%>
                                        <span><asp:Button ID="Button3" cssClass="imgbtn_sc" Text="" OnClick="Button3_Click" runat="server"/>&nbsp;收藏&nbsp;&nbsp;</span>
                                        <span><asp:Button ID="Button4" cssClass="imgbtn_zf" Text="" OnClientClick="return confirm('转发?')"  runat="server"/>&nbsp;转发&nbsp;&nbsp;</span>
                                    </span><br /><br />
                                    <div>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("filecontent") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <div id="pages" class="page">
                        <ul class="pager">
                            <li class="previous">
                                <asp:ListView ID="ListView5" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource7">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink7" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' Text="&larr; 上一篇" runat="server"></asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' Text='<%# Eval("filename") %>' runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>
                            <li class="next">
                                <asp:ListView ID="ListView6" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource8">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink8" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' Text="下一篇 &rarr;" runat="server"></asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' Text='<%# Eval("filename") %>' runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>                                     
                        </ul>
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
                                    <asp:Button ID="searchsubmit" CssClass="searchsubmit" OnClick="btnsearch1_Click" runat="server"/>
                                </div> 
                            </form>
                        </div>
                    </div>
                    <%--评论--%>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand="SELECT d.*, u.[picture], u.[username]
                        FROM [dbo].[discuss] d 
                        INNER JOIN [dbo].[users] u
                            ON d.[userid] = u.[userid]
                            WHERE ([fileid] = @fileid)
                        ORDER BY d.[publishdate] DESC ">
                        <SelectParameters>  
                            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand="SELECT d.*, u.[picture], u.[username]
                        FROM [dbo].[discuss] d 
                        INNER JOIN [dbo].[users] u
                            ON d.[userid] = u.[userid]
                        WHERE ([fileid] = @fileid)
                        ORDER BY d.[publishdate] DESC ">
                        <SelectParameters>  
                            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <%--统计--%>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand="SELECT COUNT(*)as num FROM discuss WHERE ([fileid] = @fileid)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <%--我的评论--%>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">评论</span></h3>
                        <span class="sub s-fc3">
                            <asp:ListView ID="ListView3" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <span class="j-flag">
                                        <asp:Label ID="Label15" runat="server" Text='<%# "共"+Eval("num")+"条评论" %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:ListView>
                        </span>
                    </div>
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                        href="#collapseOne">我要评论
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="m-cmmt">
                                        <div class="iptarea">
                                            <div class="head">
                                                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="javascript:void(0)">
                                                    <asp:Image ID="ImgUser3" runat="server" ImageUrl="~/images/user.png"/>
                                                </asp:HyperLink>
                                                <asp:Label ID="Labeluser" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="j-flag">
                                                <div class="m-cmmtipt f-cb f-pr">
                                                    <div class="u-txtwrap holder-parent f-pr" style="display: block;">
                                                        <asp:TextBox ID="TextBox1" runat="server" class="u-txt area j-flag" TextMode="MultiLine" Rows="6" placeholder="扯淡、吐槽、表扬……想说啥就说啥！"></asp:TextBox>
                                                    </div>
                                                    <div class="btns f-cb f-pr">
                                                        <i class="icn fa fa-smile-o j-flag"></i>
                                                        <i class="icn fa  fa-at j-flag"></i>
                                                        <asp:Button ID="Button1" class="btn u-btn u-btn-1 j-flag" runat="server" Text="评论" OnClick="Button1_Click" />
                                                    </div>
                                                    <div class="corr u-arr">
                                                        <em class="arrline">◆</em>
                                                        <span class="arrclr">◆</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                        href="#collapseTwo">我的评论
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="m-cmmt">
                                        <div class="cmmts j-flag">
                                            <h3 class="u-hd4">我的吐槽</h3>
                                            <asp:ListView ID="ListView4" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <div class="itm">
                                                        <div class="head">
                                                            <asp:HyperLink ID="HyperLink5" runat="server">
                                                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("picture") %>'/>
                                                            </asp:HyperLink>
                                                        </div>
                                                        <div class="cntwrap">
                                                            <div class="cnt f-brk">
                                                                <asp:HyperLink ID="HyperLink6" cssClass="s-fc7" runat="server" Text='<%# Eval("username")+"：" %>'></asp:HyperLink>
                                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                                            </div>
                                                            <div class="rp">
                                                                <div class="time s-fc4">
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:Label>
                                                                </div>
                                                                <a href="#"><i class="zan fa fa-thumbs-o-up"></i>
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# "("+Eval("love")+")" %>'></asp:Label></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <div class="Page_pl">
                                                <asp:DataPager ID="DataPager2" runat="server" PagedControlID="ListView4" PageSize="4">
                                                    <Fields>
                                                        <asp:NumericPagerField />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                        href="#collapseThree">精彩评论
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="m-cmmt">                            
                                        <div class="cmmts j-flag">
                                            <h3 class="u-hd4">全部评论</h3>
                                            <asp:ListView ID="ListView2" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource6" >
                                                <ItemTemplate>
                                                    <div class="itm">
                                                        <div class="head">
                                                            <asp:HyperLink ID="HyperLink5" runat="server">
                                                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("picture") %>'/>
                                                            </asp:HyperLink>
                                                        </div>
                                                        <div class="cntwrap">
                                                            <div class="cnt f-brk">
                                                                <asp:HyperLink ID="HyperLink6" cssClass="s-fc7" runat="server" Text='<%# Eval("username")+"：" %>'></asp:HyperLink>
                                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                                            </div>
                                                            <div class="rp">
                                                                <div class="time s-fc4">
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:Label>
                                                                </div>
                                                                <a href="#"><i class="zan fa fa-thumbs-o-up"></i>
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# "("+Eval("love")+")" %>'></asp:Label></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <div class="Page_pl">
                                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView2" PageSize="4">
                                                    <Fields>
                                                        <asp:NumericPagerField />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--推荐--%>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand="SELECT top 3 f.[fileid],f.[filename],f.[pic],f.[publishdate], g.[growname]
                        FROM [dbo].[files] f 
                        INNER JOIN [dbo].[maps] m
                            ON f.[fileid] = m.[fileid]
                        INNER JOIN [dbo].[grows] g
                            ON m.[growid] = g.[growid] and g.[growname]!='全部'
                        WHERE g.[growname] in(
	                        SELECT g.[growname] 
	                        FROM [dbo].[files] f 
	                        INNER JOIN [dbo].[maps] m
		                        ON f.[fileid] = m.[fileid]
	                        INNER JOIN [dbo].[grows] g
		                        ON m.[growid] = g.[growid] and g.[growname]!='全部'
		                    WHERE (f.[fileid] = @fileid)) and (f.[fileid] != @fileid)
                        ORDER BY NEWID()">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="fileid" QueryStringField="fileid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">相似文章</span>
                        </h3>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">推荐文章</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tabbed custom-tabbed">
                                <div class="block current">
                                    <ul class="widget-list">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyField="fileid" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <li>
                                                    <figure>
                                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pic") %>' />
                                                        </asp:HyperLink>
                                                    </figure>
                                                    <div class="sn-wrapper">
                                                        <p class="s-desc">
                                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' Text='<%# Eval("filename") %>' ToolTip='<%# Eval("filename") %>'>
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
    <script>
        $(window).ready(function () {
            var i = "<%= hasCollect() %>"
            if (i == 1) {
                $("#ContentPlaceHolder1_DataList1_Button3_0").removeClass("imgbtn_sc")
                $("#ContentPlaceHolder1_DataList1_Button3_0").addClass("imgbtn_cc")
            }
            $(".dianzan").click(function () {
                var fileid = "<%= Request["fileid"]%>"
                $.ajax({
                    url:"./UserServices.aspx",
                    data:{
                        fileid:fileid,
                        type:"dianzan"
                    },
                    type:"get",
                    success: function (data) {
                        alert(data)
                        if (data == "点赞成功") {
                            $(".dianzan").removeClass("imgbtn_dz")
                            $(".dianzan").addClass("imgbtn_zz")
                        }
                        else if (data == "取消点赞成功") {
                            $(".dianzan").removeClass("imgbtn_zz")
                            $(".dianzan").addClass("imgbtn_dz")
                        }
                    }
                })
            })
            var flag = "<%= haslikes()%>"
            if (flag == 1) {
                $(".dianzan").removeClass("imgbtn_dz")
                $(".dianzan").addClass("imgbtn_zz")
            }
        })
        
    </script>
</asp:Content>

