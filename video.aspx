<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style style="text/css">
        .navbar-nav > li:nth-of-type(3)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
    </style>
    <!-- main -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT * FROM [types]  WHERE (typeid = @typeid) ">
        <SelectParameters>
            <asp:QueryStringParameter Name="typeid" QueryStringField="typeid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="typeid" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <h3 class="agile_w3_title">
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("typename") %>'></asp:Label>
                            </h3>
                        </ItemTemplate>
                    </asp:DataList>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT g.*,c.*
	    FROM [dbo].[grows] g
	    INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	    WHERE g.[classid]=7 and growname!='全部'">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT g.*,c.*
	    FROM [dbo].[grows] g
	    INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	    WHERE g.[classid]=8 and growname!='全部'">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
        SelectCommand="SELECT g.*,c.*
	    FROM [dbo].[grows] g
	    INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	    WHERE g.[classid]=9 and growname!='全部'">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT g.*,c.*
	FROM [dbo].[grows] g
	INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	WHERE g.[classid]=7 and growname='全部'">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT g.*,c.*
	FROM [dbo].[grows] g
	INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	WHERE g.[classid]=8 and growname='全部'">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT g.*,c.*
	FROM [dbo].[grows] g
	INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
	WHERE g.[classid]=9 and growname='全部'">
    </asp:SqlDataSource>

    <div class="course-content">
        <div class="container">
            <div class="course-nav-box">
                <div class="course-nav-row clearfix" id="a1">
                    <span class="hd l">
                        <asp:ListView ID="ListView1" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("classname") %>' />
                            </ItemTemplate>
                        </asp:ListView>
                    </span>
                    <div class="bd">
                        <ul class="">
                            <li class="course-nav-item on">
                                <asp:ListView ID="ListView2" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" Text='<%#Eval("growname") %>' alt=""  runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>
                            <asp:ListView ID="ListView3" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <li class="course-nav-item">
                                        <asp:HyperLink ID="HyperLink2" Text='<%#Eval("growname") %>' alt='<%#Eval("growid")%>' runat="server"></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>
                </div>

                <div class="course-nav-row clearfix" id="a2">
                    <span class="hd l">
                        <asp:ListView ID="ListView4" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("classname") %>' />
                            </ItemTemplate>
                        </asp:ListView>
                    </span>
                    <div class="bd">
                        <ul class="">
                            <li class="course-nav-item on">
                                <asp:ListView ID="ListView5" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource6">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" Text='<%#Eval("growname") %>' alt="" runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>
                            <asp:ListView ID="ListView6" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <li class="course-nav-item">
                                        <asp:HyperLink ID="HyperLink2" Text='<%#Eval("growname") %>' alt='<%#Eval("growid")%>' runat="server"></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>
                </div>
                <div class="course-nav-row clearfix" id="a3">
                    <span class="hd l">
                        <asp:ListView ID="ListView7" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource7">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("classname") %>' />
                            </ItemTemplate>
                        </asp:ListView>
                    </span>
                    <div class="bd">
                        <ul class="">
                            <li class="course-nav-item on">
                                <asp:ListView ID="ListView8" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource7">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" Text='<%#Eval("growname") %>'  alt="" runat="server"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>
                            </li>
                            <asp:ListView ID="ListView9" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <li class="course-nav-item">
                                        <asp:HyperLink ID="HyperLink2" Text='<%#Eval("growname") %>' alt='<%#Eval("growid")%>' runat="server"></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <!--/requested-movies-->
        <div class="w3_content_agilleinfo_inner">
            <div class="agile_featured_movies">
                <div class="agileinfo_tabs">
                    <div id="horizontalTab">
                        <ul class="resp-tabs-list inner-second">
                            <li>最新
                            </li>
                            <li>最热
                            </li>
                            <li>评论最多
                            </li>
                        </ul>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [video] ORDER BY [publishdate] DESC, [nub] DESC"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [video] ORDER BY [nub] DESC, [publishdate] DESC, [love] DESC"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [video] ORDER BY [love] DESC, [publishdate] DESC, [nub] DESC"></asp:SqlDataSource>
                        <div class="resp-tabs-container">
                            <%--最新--%>
                            <div class="tab1">
                                <div class="tab_movies_agileinfo">
                                    <div class="wthree_agile-requested-movies">
                                        <asp:ListView ID="ListView10" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource8">
                                            <ItemTemplate>
                                                <div class="col-md-2 col-sm-3 col-xs-4 w3l-movie-gride-agile requested-movies">
                                                    <asp:HyperLink ID="HyperLink4" CssClass="hvr-sweep-to-bottom" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' runat="server">
                                                        <asp:ImageMap ID="ImageMap1" CssClass="img-responsive" ToolTip='<%# Eval("videoname") %>' ImageUrl='<%# Eval("pic") %>' runat="server"></asp:ImageMap>
                                                        <div class="w3l-action-icon">
                                                            <i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                                        </div>
                                                    </asp:HyperLink>
                                                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                        <div class="w3l-movie-text">
                                                            <h6>
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/video_detail.aspx?videoid="+Eval("videoid")%>' Text='<%# Eval("videoname") %>'></asp:HyperLink>
                                                            </h6>
                                                        </div>
                                                        <div class="mid-2 agile_mid_2_home">
                                                            <p>
                                                                <asp:HyperLink ID="HyperLink5" runat="server" Text='<%# Eval("nub")+"人参与" %>' ></asp:HyperLink>
                                                            </p>
                                                            <div class="block-stars">
                                                                <p>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("grade") %>'></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ribben one">
                                                        <p>
                                                            <asp:Label ID="Label4" runat="server" Text="NEW"></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="Table1" runat="server">
                                                    <tr id="Tr1" runat="server">
                                                        <td id="Td1" runat="server">
                                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                                <tr id="itemPlaceholder" runat="server">
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr2" runat="server">
                                                        <td id="Td2" runat="server" style="">
                                                            <div class="Page-nav">
                                                                <asp:DataPager ID="DataPager1" PageSize="40" runat="server">
                                                                    <Fields>
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                        <asp:NumericPagerField />
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                    </Fields>
                                                                </asp:DataPager>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <%--最热--%>
                            <div class="tab2">
                                <div class="tab_movies_agileinfo">
                                    <div class="wthree_agile-requested-movies">
                                        <asp:ListView ID="ListView11" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource9">
                                            <ItemTemplate>
                                                <div class="col-md-2 col-sm-3 col-xs-4 w3l-movie-gride-agile requested-movies">
                                                    <asp:HyperLink ID="HyperLink4" CssClass="hvr-sweep-to-bottom" NavigateUrl="javascript:void(0);" runat="server">
                                                        <asp:ImageMap ID="ImageMap1" CssClass="img-responsive" ToolTip='<%# Eval("videoname") %>' ImageUrl='<%# Eval("pic") %>' runat="server"></asp:ImageMap>
                                                        <div class="w3l-action-icon">
                                                            <i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                                        </div>
                                                    </asp:HyperLink>
                                                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                        <div class="w3l-movie-text">
                                                            <h6>
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/video_detail.aspx" Text='<%# Eval("videoname") %>'></asp:HyperLink>
                                                            </h6>
                                                        </div>
                                                        <div class="mid-2 agile_mid_2_home">
                                                            <p>
                                                                <asp:HyperLink ID="HyperLink5" runat="server" Text='<%# Eval("nub")+"人参与" %>' ></asp:HyperLink>
                                                            </p>
                                                            <div class="block-stars">
                                                                <p>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("grade") %>'></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ribben one">
                                                        <p>
                                                            <asp:Label ID="Label4" runat="server" Text="NEW"></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="Table1" runat="server">
                                                    <tr id="Tr1" runat="server">
                                                        <td id="Td1" runat="server">
                                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                                <tr id="itemPlaceholder" runat="server">
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr2" runat="server">
                                                        <td id="Td2" runat="server" style="">
                                                            <div class="Page-nav">
                                                                <asp:DataPager ID="DataPager1" PageSize="40" runat="server">
                                                                    <Fields>
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                        <asp:NumericPagerField />
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                    </Fields>
                                                                </asp:DataPager>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <%--评论最多--%>
                            <div class="tab3">
                                <div class="tab_movies_agileinfo">
                                    <div class="wthree_agile-requested-movies">
                                        <asp:ListView ID="ListView12" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource10">
                                            <ItemTemplate>
                                                <div class="col-md-2 col-sm-3 col-xs-4 w3l-movie-gride-agile requested-movies">
                                                    <asp:HyperLink ID="HyperLink4" CssClass="hvr-sweep-to-bottom" NavigateUrl="javascript:void(0);" runat="server">
                                                        <asp:ImageMap ID="ImageMap1" CssClass="img-responsive" ToolTip='<%# Eval("videoname") %>' ImageUrl='<%# Eval("pic") %>' runat="server"></asp:ImageMap>
                                                        <div class="w3l-action-icon">
                                                            <i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                                        </div>
                                                    </asp:HyperLink>
                                                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                        <div class="w3l-movie-text">
                                                            <h6>
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/video_detail.aspx" Text='<%# Eval("videoname") %>'></asp:HyperLink>
                                                            </h6>
                                                        </div>
                                                        <div class="mid-2 agile_mid_2_home">
                                                            <p>
                                                                <asp:HyperLink ID="HyperLink5" runat="server" Text='<%# Eval("nub")+"人参与" %>' ></asp:HyperLink>
                                                            </p>
                                                            <div class="block-stars">
                                                                <p>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("grade") %>'></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ribben one">
                                                        <p>
                                                            <asp:Label ID="Label4" runat="server" Text="NEW"></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="Table1" runat="server">
                                                    <tr id="Tr1" runat="server">
                                                        <td id="Td1" runat="server">
                                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                                <tr id="itemPlaceholder" runat="server">
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr2" runat="server">
                                                        <td id="Td2" runat="server" style="">
                                                            <div class="Page-nav">
                                                                <asp:DataPager ID="DataPager1" PageSize="40" runat="server">
                                                                    <Fields>
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                        <asp:NumericPagerField />
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                                    </Fields>
                                                                </asp:DataPager>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                      
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- END-main -->
    <script src="js/easy-responsive-tabs.js" type="text/javascript"></script><%--jQuery 响应式 Tab选项卡样式--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto',//auto or any width like 600px
                fit: true,// 100% fit in a container
                closed: 'accordion',
                activate: function (event) {
                    var $tab = $(this);
                    var $info = $('#tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
            $('#verticalTab').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true
            });
            $("#a1 ul a").click(function () { //菜单联动
                var buwei = $(this).attr("alt");
                var type = $("#a2 li.on a").attr("alt")
                var nandu = $("#a3 li.on a").attr("alt")
                search(this,buwei,type,nandu)
            })
            $("#a2 ul a").click(function () {
                var type = $(this).attr("alt");
                var nandu = $("#a3 li.on a").attr("alt")
                var buwei = $("#a1 li.on a").attr("alt")
                search(this, buwei, type, nandu)
            })
            $("#a3 ul a").click(function () {
                var nandu = $(this).attr("alt");
                var buwei = $("#a1 li.on a").attr("alt")
                var type = $("#a2 li.on a").attr("alt")
                search(this, buwei, type, nandu)
            })
            init()
        });
        function search(e, buwei, type, nandu) {
            $(e).parent().addClass("on")//选中样式
            $(e).parent().siblings().removeClass("on")//移除所有同胞元素的样式
            $(window).attr("location", "./video.aspx?typeid=3"+"&buwei=" + buwei + "&type=" + type + "&nandu=" + nandu)
        }
        function init() {
            var a1 = $("#ContentPlaceHolder1_Label9").text()
            var a2 = $("#ContentPlaceHolder1_Label10").text()
            var a3 = $("#ContentPlaceHolder1_Label11").text()
            $("#a1 ul a").each(function () {
                if ($(this).attr("alt") == a1) {
                    $(this).parent().addClass("on")
                    $(this).parent().siblings().removeClass("on")
                    return;
                }
            })
            $("#a2 ul a").each(function () {
                if ($(this).attr("alt") == a2) {
                    $(this).parent().addClass("on")
                    $(this).parent().siblings().removeClass("on")
                    return;
                }
            })
            $("#a3 ul a").each(function () {
                if ($(this).attr("alt") == a3) {
                    $(this).parent().addClass("on")
                    $(this).parent().siblings().removeClass("on")
                    return;
                }
            })

        }
    </script>
    <asp:Label ID="Label9" runat="server" Text="" Style="display:none"></asp:Label>
    <asp:Label ID="Label10" runat="server" Text="" Style="display:none"></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="" Style="display:none"></asp:Label>
</asp:Content>

