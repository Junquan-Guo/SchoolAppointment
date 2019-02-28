<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat"><h3 class="agile_w3_title">搜索到的文章</h3></div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i> &nbsp;
                    <span>当前位置：
                        <ul class="breadcrumb">
                            <li><a href="Default.aspx">主页</a></li>
                            <li class="active">搜索</li>
                        </ul> 
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-12 inner-left" role="main">
                    <article class="blog-wrap">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                            SelectCommand="SELECT  f.*, g.[growid], g.[growname]
                    FROM [dbo].[files] f 
                    INNER JOIN [dbo].[maps] m
                        ON f.[fileid] = m.[fileid]
                    INNER JOIN [dbo].[grows] g
                        ON m.[growid] = g.[growid]and g.[growname]!='全部'"></asp:SqlDataSource>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4"  GridLines="None" ShowHeader="False" AllowPaging="True" PageSize="4">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="pic" SortExpression="pic">
                                    <ItemTemplate>
                                        <div class="blog-article hentry format-image">
                                            <figure>
                                                <asp:HyperLink ID="HyperLink1" cssClass="swipebox-x" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                                    <asp:Image ID="Image1" cssClass="img-responsive" ImageUrl='<%#Eval("pic") %>' runat="server" />
                                                </asp:HyperLink>
                                            </figure>
                                            <div class="entry-summary post-summary">
                                                <header class="entry-header">
                                                    <h2 class="entry-title post-title">
                                                        <asp:HyperLink ID="HyperLink2" CssClass="swipebox-x" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  Text='<%#Eval("filename") %>' ToolTip='<%#Eval("filename") %>' runat="server">
                                                        </asp:HyperLink>
                                                     </h2>
                                                </header>
                                                <div class="entry-meta post-meta">
                                                    <ul>
                                                        <li class="entry-date date"> 
                                                            <asp:Label ID="Label1" runat="server" Text='<%#"["+ Eval("publishdate","{0:MM-dd}")+"]" %>' ></asp:Label>
                                                        </li>
                                                        <li class="tags">
                                                            <asp:HyperLink ID="HyperLink5" Text='<%#Eval("growname") %>' runat="server"></asp:HyperLink>
                                                        </li>
                                                        <li class="byline author vcard">
                                                            <asp:HyperLink ID="HyperLink3" cssClass="fn" Text='<%# "by"+Eval("radact") %>' runat="server"></asp:HyperLink>
			                                            </li>
                                                    </ul>
                                                </div>
                                                <div class="entry-content">
                                                    <p>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("abstract") %>'></asp:Label>
                                                    </p>
                                                </div>
                                                <asp:HyperLink ID="HyperLink4" cssClass="read-more-link" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  Text="查看详细" runat="server"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle Font-Size="1px" Height="1px" />
                            <PagerSettings FirstPageText="第一页" LastPageText="末   页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
                            <PagerStyle Font-Size="8px" HorizontalAlign="Center" Width="100%" CssClass="paging" />
                        </asp:GridView>
                    </article>
                    <div class="xiansi"><asp:Label ID="Label4" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

