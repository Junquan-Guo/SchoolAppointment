<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="discover.aspx.cs" Inherits="discover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- main -->
    <style style="text/css">
        .navbar-nav > li:nth-of-type(7)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
    </style>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT * FROM [activity] WHERE ([introduce] = '展会/新闻/赛事') ORDER BY [publishdate] DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT * FROM [activity] WHERE ([introduce] = '校园活动') ORDER BY [publishdate] DESC">
    </asp:SqlDataSource>
    <div class="page-container">
        <div class="container">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#Competition" data-toggle="tab">展会/新闻/赛事
                    </a>
                </li>
                <li><a href="#Activity" data-toggle="tab">校园活动</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="Competition">
                    <asp:ListView ID="ListView4" runat="server"  DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="main col-md-6 inner-left" role="main">
                                <article class="blog-wrap">
                                    <div class="blog-article hentry format-image">
                                        <figure>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>'>
                                                <asp:Image ID="Image2" ImageUrl='<%# Eval("pic") %>' alt='<%# Eval("activityname") %>' CssClass="img-responsive" runat="server" />
                                            </asp:HyperLink>
                                        </figure>
                                        <div class="entry-summary post-summary">
                                            <header class="entry-header">
                                                <h2 class="entry-title post-title">
                                                    <asp:HyperLink ID="HyperLink2" title='<%# Eval("activityname") %>' Text='<%# Eval("activityname") %>' NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>' runat="server">
                                                    </asp:HyperLink>
                                                </h2>
                                            </header>
                                            <div class="entry-meta post-meta">
                                                <ul>
                                                    <li class="entry-date date">
                                                        <asp:Label ID="Label1" CssClass="entry-date" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:Label>
                                                    </li>
                                                    <li class="tags">
                                                        <asp:HyperLink ID="HyperLink5" href="javascript:;" Text='<%# Eval("introduce") %>' runat="server"></asp:HyperLink>
                                                    </li>
                                                    <li class="byline author vcard">by
                                                    <asp:HyperLink ID="HyperLink6" href="javascript:;" CssClass="fn" Text='<%# Eval("activityredact") %>' runat="server"></asp:HyperLink>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="entry-content">
                                                <p>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("abstract") %>'></asp:Label></p>
                                            </div>
                                            <asp:HyperLink ID="HyperLink7" class="read-more-link" NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>' Text="查看详细" runat="server"></asp:HyperLink>
                                        </div>
                                    </div>
                                </article>
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
                                            <asp:DataPager ID="DataPager1" PageSize="5" runat="server">
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
                </div>

                <div class="tab-pane fade" id="Activity">
                    <asp:ListView ID="ListView1" runat="server"  DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <div class="main col-md-6 inner-left" role="main">
                                <article class="blog-wrap">
                                    <div class="blog-article hentry format-image">
                                        <figure>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>'>
                                                <asp:Image ID="Image2" ImageUrl='<%# Eval("pic") %>' alt='<%# Eval("activityname") %>' CssClass="img-responsive" runat="server" />
                                            </asp:HyperLink>
                                        </figure>
                                        <div class="entry-summary post-summary">
                                            <header class="entry-header">
                                                <h2 class="entry-title post-title">
                                                    <asp:HyperLink ID="HyperLink2" title='<%# Eval("activityname") %>' Text='<%# Eval("activityname") %>' NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>' runat="server">
                                                    </asp:HyperLink>
                                                </h2>
                                            </header>
                                            <div class="entry-meta post-meta">
                                                <ul>
                                                    <li class="entry-date date">
                                                        <asp:Label ID="Label1" CssClass="entry-date" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>'></asp:Label>
                                                    </li>
                                                    <li class="tags">
                                                        <asp:HyperLink ID="HyperLink5" href="javascript:;" Text='<%# Eval("introduce") %>' runat="server"></asp:HyperLink>
                                                    </li>
                                                    <li class="byline author vcard">by
                                                    <asp:HyperLink ID="HyperLink6" href="javascript:;" CssClass="fn" Text='<%# Eval("activityredact") %>' runat="server"></asp:HyperLink>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="entry-content">
                                                <p>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("abstract") %>'></asp:Label></p>
                                            </div>
                                            <asp:HyperLink ID="HyperLink7" class="read-more-link" NavigateUrl='<%# "~/news_detail.aspx?activityid="+Eval("activityid")%>' Text="查看详细" runat="server"></asp:HyperLink>
                                        </div>
                                    </div>
                                </article>
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
                                            <asp:DataPager ID="DataPager1" PageSize="5" runat="server">
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
                </div>
            </div>

        </div>
    </div>
    <!-- END-main -->

</asp:Content>

