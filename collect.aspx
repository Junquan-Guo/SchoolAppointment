<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="collect.aspx.cs" Inherits="collect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- main -->
    <style style="text/css">
        .navbar-nav > li:nth-of-type(8) > a.active {
            color: #ffffff !important;
            background-color: #E60012;
        }
        .border {
            border: 1px solid #ddd;
            padding: 5px;
            height: 50px;
            line-height: 36px;
            margin-bottom: 20px;
        }
        .l_f {
            float: left;
        }
        a, i, span {
            transition: all 0.3s;
        }
        .border span {
            display: inline-block;
            margin-right: 5px;
        }
        .r_f {
            float: right;
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

    <div class="page-container">
        <div class="container">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#Collect" data-toggle="tab">收藏
                    </a>
                </li>
                <li><a href="#History" data-toggle="tab">历史</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="Collect">

                    <div class="border clearfix">
                        <span class="l_f">
                            <asp:Button ID="Button5" runat="server" Text="批量删除" CssClass="btn btn-danger" OnClientClick="return confirm('是否批量删除')" />
                        </span>
                        <span class="r_f">共：<b><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></b>条</span>
                    </div>
                    <!--收藏列表 -->
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                        SelectCommand="select c.fileid,pic,filename,publishdate,abstract,reading,amount,love from [dbo].[collect] c
                        INNER JOIN [dbo].[files] f
	                    ON f.[fileid] = c.[fileid]
	                    where userid=1 ORDER BY [collectid] DESC"></asp:SqlDataSource>
                    <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    <div class="news">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 right-content">
                                    <div class="news-list">
                                        <asp:ListView ID="ListView4" runat="server" DataKeyField="growid" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-4 news-pic">
                                                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>'>
                                                            <asp:Image ID="Image2" ImageUrl='<%# Eval("pic") %>' alt='<%# Eval("filename") %>' CssClass="img-responsive center-block" runat="server" />
                                                        </asp:HyperLink>
                                                    </div>
                                                    <div class="col-lg-8 col-md-8 col-sm-8 news-text">
                                                        <h3>
                                                            <asp:HyperLink ID="HyperLink2" title='<%# Eval("filename") %>' Text='<%# Eval("filename") %>' NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                                            </asp:HyperLink>
                                                        </h3>
                                                        <p>
                                                            <asp:HyperLink ID="HyperLink1" title='<%# Eval("abstract") %>' Text='<%# Eval("abstract") %>' NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                                            </asp:HyperLink>
                                                        </p>
                                                        <asp:HyperLink ID="HyperLink3" cssClass="readmore hidden-xs"  Text="阅读全文" NavigateUrl='<%# "~/news_detail.aspx?fileid="+Eval("fileid")%>' runat="server">
                                                        </asp:HyperLink>
                                                        <div>
                                                            <span><i class="fa fa-comment-o"></i>
                                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                                            </span>
                                                            <span class=""><i class="fa fa-eye"></i>
                                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("reading") %>'></asp:Label>
                                                            </span>
                                                            <span class="pull-right"><i class="fa fa-clock-o"></i><asp:Label ID="Label1" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd}") %>' ></asp:Label></span>
                                                        </div>
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
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="History">
                    <div style="height:400px"></div>
                </div>
            </div>

        </div>
    </div>
    <!-- END-main -->

</asp:Content>

