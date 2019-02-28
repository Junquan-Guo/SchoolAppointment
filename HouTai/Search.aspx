<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="HouTai_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/pages/search.css" />

    <!--***** CONTENT *****-->
    <div class="chart-cont">
        <div class="card p-4">
            <div class="row">
                <hgroup class="mb20">
                    <h1>搜索结果</h1>
                    <h2 class="lead"><strong class="cl-blue">
                        <asp:Label ID="Label4" runat="server" Text="0"></asp:Label></strong> 个搜索  <strong class="cl-blue">结果</strong>
                    </h2>
                </hgroup>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                    SelectCommand="SELECT  f.*, g.[growid], g.[growname]
                    FROM [dbo].[files] f 
                    INNER JOIN [dbo].[maps] m
                        ON f.[fileid] = m.[fileid]
                    INNER JOIN [dbo].[grows] g
                        ON m.[growid] = g.[growid]and g.[growname]!='全部'"></asp:SqlDataSource>

                <section class="col-xs-12 col-sm-6 col-md-12">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="None" ShowHeader="False" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="pic" SortExpression="pic">
                                <ItemTemplate>
                                    <article class="search-result row">
                                        <div class="col-xs-12 col-sm-12 col-md-3">
                                            <asp:HyperLink ID="HyperLink1" CssClass="thumbnail" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                                <asp:Image ID="Image1" CssClass="img-fluid" ImageUrl='<%#Eval("pic") %>' runat="server" />
                                            </asp:HyperLink>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-2">
                                            <ul class="meta-search">
                                                <li><i class="fa fa-calendar"></i><span><asp:Label ID="Label1" runat="server" Text='<%#"["+ Eval("publishdate","{0:yyyy-MM-dd}")+"]" %>' ></asp:Label></span></li>
                                                <li><i class="fa fa-clock-o"></i><span><asp:Label ID="Label2" runat="server" Text='<%#"["+ Eval("publishdate","{0:hh:mm tt}")+"]" %>' ></asp:Label></span></li>
                                                <li><i class="fa fa-tags"></i><span><asp:HyperLink ID="HyperLink5" Text='<%#Eval("growname") %>' runat="server"></asp:HyperLink></span></li>
                                            </ul>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                                            <h3><asp:HyperLink ID="HyperLink4"  NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'  Text='<%#Eval("filename") %>' runat="server"></asp:HyperLink></h3>
                                            <p><asp:Label ID="Label3" runat="server" Text='<%# Eval("abstract") %>'></asp:Label></p>
                                        </div>
                                        <span class="clearfix borda"></span>
                                    </article>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Font-Size="1px" Height="1px" />
                        <PagerSettings FirstPageText="第一页" LastPageText="末   页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
                        <PagerStyle Font-Size="8px" HorizontalAlign="Center" Width="100%" CssClass="paging" />
                    </asp:GridView>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

