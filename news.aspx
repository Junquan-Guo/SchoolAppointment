<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <style style="text/css">
        .navbar-nav > li:nth-of-type(2)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
    </style>
    <!-- main -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT f.*, g.[growname],g.[growid],c.[classname],t.[typename],t.[typeurl]
        FROM [dbo].[files] f 
        INNER JOIN [dbo].[maps] m
            ON f.[fileid] = m.[fileid]
        INNER JOIN [dbo].[grows] g
            ON m.[growid] = g.[growid]
        INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
        INNER JOIN [dbo].[types] t
            ON c.[typeid] = t.[typeid]and g.[growname]='全部' 
        WHERE (g.[growid] = @growid)
        ORDER BY [publishdate] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="growid" QueryStringField="growid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT f.*, g.[growname],g.[growid],c.[classname],t.[typename],t.[typeurl]
        FROM [dbo].[files] f 
        INNER JOIN [dbo].[maps] m
            ON f.[fileid] = m.[fileid]
        INNER JOIN [dbo].[grows] g
            ON m.[growid] = g.[growid]
        INNER JOIN [dbo].[class] c
            ON g.[classid] = c.[classid]
        INNER JOIN [dbo].[types] t
            ON c.[typeid] = t.[typeid]and g.[growname]!='全部' 
        WHERE (g.[growid] = @growid)
        ORDER BY [publishdate] DESC ">
        <SelectParameters>
            <asp:QueryStringParameter Name="growid" QueryStringField="growid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <article class="blog-wrap">

                        <asp:ListView ID="ListView4" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="blog-article hentry format-image">
                                    <figure>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'>
                                            <asp:Image ID="Image2" ImageUrl='<%# Eval("pic") %>' alt='<%# Eval("filename") %>' cssClass="img-responsive" runat="server" />
                                        </asp:HyperLink> 
                                    </figure>
                                    <div class="entry-summary post-summary">
                                        <header class="entry-header">
                                            <h2 class="entry-title post-title">
                                                <asp:HyperLink ID="HyperLink2"  title='<%# Eval("filename") %>' Text='<%# Eval("filename") %>' NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  runat="server">
                                                </asp:HyperLink>
                                            </h2>
                                        </header>
                                        <div class="entry-meta post-meta">
                                            <ul>
                                                <li class="entry-date date">
                                                    <asp:Label ID="Label1" cssClass="entry-date" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>' ></asp:Label>
                                                </li>
                                                <li class="tags">
                                                    <asp:HyperLink ID="HyperLink5" href="javascript:;" Text='<%# Eval("growname") %>'  runat="server"></asp:HyperLink>
                                                </li>
                                                <li class="byline author vcard">by
                                                    <asp:HyperLink ID="HyperLink6" href="javascript:;" CssClass="fn" Text='<%# Eval("radact") %>' runat="server"></asp:HyperLink>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="entry-content">
                                            <p>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("abstract") %>'></asp:Label>
                                            </p>
                                        </div>
                                        <asp:HyperLink ID="HyperLink7" class="read-more-link" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">查看详细</asp:HyperLink>
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

                        <asp:ListView ID="ListView3" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <div class="blog-article hentry format-image">
                                    <figure>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'>
                                            <asp:Image ID="Image2" ImageUrl='<%# Eval("pic") %>' alt='<%# Eval("filename") %>' cssClass="img-responsive" runat="server" />
                                        </asp:HyperLink> 
                                    </figure>
                                    <div class="entry-summary post-summary">
                                        <header class="entry-header">
                                            <h2 class="entry-title post-title">
                                                <asp:HyperLink ID="HyperLink2"  title='<%# Eval("filename") %>' Text='<%# Eval("filename") %>' NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  runat="server">
                                                </asp:HyperLink>
                                            </h2>
                                        </header>
                                        <div class="entry-meta post-meta">
                                            <ul>
                                                <li class="entry-date date">
                                                    <asp:Label ID="Label1" cssClass="entry-date" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>' ></asp:Label>
                                                </li>
                                                <li class="tags">
                                                    <asp:HyperLink ID="HyperLink5" href="javascript:;" Text='<%# Eval("growname") %>'  runat="server"></asp:HyperLink>
                                                </li>
                                                <li class="byline author vcard">by
                                                    <asp:HyperLink ID="HyperLink6" href="javascript:;" CssClass="fn" Text='<%# Eval("radact") %>' runat="server"></asp:HyperLink>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="entry-content">
                                            <p>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("abstract") %>'></asp:Label></p>
                                        </div>
                                        <asp:HyperLink ID="HyperLink7" class="read-more-link" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">查看详细</asp:HyperLink>
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
                    </article>
                 
                </div>
                <aside class="sidebar col-md-3 inner-right" role="complementary">
                    <%--搜索--%>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">搜索</span>
                        </h3>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <span class="panel-collapse">站内搜索</span>
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
                     <%--推荐--%>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand=" SELECT top 7 f.*, g.[growname],g.[growid],c.[classname],t.[typename],t.[typeurl]
                        FROM [dbo].[files] f 
                        INNER JOIN [dbo].[maps] m
                            ON f.[fileid] = m.[fileid]
                        INNER JOIN [dbo].[grows] g
                            ON m.[growid] = g.[growid]
                        INNER JOIN [dbo].[class] c
                            ON g.[classid] = c.[classid]
                        INNER JOIN [dbo].[types] t
                            ON c.[typeid] = t.[typeid]and g.[growname]='全部' 
                        WHERE (g.[growid] = @growid) ORDER BY [reading] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="growid" QueryStringField="growid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
                        SelectCommand=" SELECT top 7 f.*, g.[growname],g.[growid],c.[classname],t.[typename],t.[typeurl]
                        FROM [dbo].[files] f 
                        INNER JOIN [dbo].[maps] m
                            ON f.[fileid] = m.[fileid]
                        INNER JOIN [dbo].[grows] g
                            ON m.[growid] = g.[growid]
                        INNER JOIN [dbo].[class] c
                            ON g.[classid] = c.[classid]
                        INNER JOIN [dbo].[types] t
                            ON c.[typeid] = t.[typeid]and g.[growname]!='全部' 
                        WHERE (g.[growid] = @growid) ORDER BY [reading] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="growid" QueryStringField="growid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="u-title">
                        <h3>
                            <span class="f-ff2">热搜文章</span>
                        </h3>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">热搜文章</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tabbed custom-tabbed">
                                <div class="block current">
                                    <ul class="widget-list">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource3">
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

                                        <asp:ListView ID="ListView2" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource4">
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
    <script type="text/javascript"> //菜单点击效果
        var oLis = $(".conSerUl li")
        $(".conSerUl li").click(function () {
            $(this).addClass("serActive")
            $(this).siblings().removeClass("serActive")//同胞元素
            $(this).siblings().children().removeClass("serActiveA")//子元素
            $(this).children().addClass("serActiveA")
        })
        var List = $(".conSerBoxUl li")
        $(".conSerBoxUl li").click(function () {
            $(this).addClass("active")
            $(this).siblings().removeClass("active")
            $(this).children().children("span").addClass("bgBlue")
            $(this).siblings().children().children("span").removeClass("bgBlue")
        })
</script>
    <!-- END-main -->
</asp:Content>

