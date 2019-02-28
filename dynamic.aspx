<%@ Page Title=""  validaterequest="false"  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dynamic.aspx.cs" Inherits="dynamic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="dist/summernote.css" rel="stylesheet" />
    <script src="dist/summernote.js"></script>
    <script src="dist/lang/summernote-zh-CN.js"></script><!-- 中文-->

    <style>
        .navbar-nav > li:nth-of-type(5)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
        .m {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        .modal-backdrop {
            background-color: #fff;
            z-index: 0;
        }
        .display {
            display:none;
        }
        .filecontentLabel {
            padding:10px 0;
        }
        .s-font {
            font-size:20px;
            line-height:50px;
        }
        .rp_font {
            font-size:14px;
        }
    </style>
    <script>
        $(function () {
            $('.summernote').summernote({
                height: 200,
                tabsize: 2,
                lang: 'zh-CN'
            });
        });

    </script>
    <!-- main -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
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

    <!--动态列表 -->
    <div class="find">
        <div class="container">
            <div class="row">
                <div class="m-cmmt">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="title_area clearfix">
                                <div class="title">
                                    <p class="W_swficon ficon_swtxt">
                                        <em class="spac1">有什么新</em>
                                        <em class="spac2">鲜</em>
                                        <em class="spac3">事告诉大家</em>
                                        <em class="spac4">?</em>
                                    </p>
                                </div>
                            </div>
                            <div class="m">
                                <div class="summernote" id="sd"></div>
                            </div>
                            <asp:Label ID="filecontentLabe2" CssClass="display" runat="server"></asp:Label>
                            <div class="fabu">
                                <input name="content" type="hidden" id="content"/>
                                <asp:Button ID="myButton4" class="btn btn-primary right"  data-complete-text="正在上传中..." runat="server" Text="发布" OnClick="myButton4_Click" />          
                            </div>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                        SelectCommand="SELECT i.*, u.[picture], u.[username] 
                        FROM [dbo].[issues] i  
                        INNER JOIN [dbo].[users] u
                            ON i.[userid] = u.[userid]
                        WHERE ([typeid] = @typeid)
                        ORDER BY i.[publishdate] DESC">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="5" Name="typeid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">动态
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="page-container">
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <div class="cmmts j-flag">
                                            <div class="clearfix">
                                                <div class="itm">
                                                    <div class="head">
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:void(0);">
                                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("picture") %>' runat="server" Width="50px" Height="50px" />
                                                        </asp:HyperLink>
                                                    </div>
                                                    <div class="cntwrap">
                                                        <div class="cnt f-brk">
                                                            <asp:HyperLink ID="HyperLink2" CssClass="s-fc7 s-font" Text='<%# Eval("username")+"：" %>' runat="server"></asp:HyperLink>
                                                        </div>
                                                        <div class="cnt f-brk">
                                                            <div class="filecontentLabel">
                                                                <asp:Label ID="filecontentLabel" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="rp rp_font">
                                                            <asp:Label ID="Label1" CssClass="time s-fc4 rp_font" runat="server" Text='<%# Eval("publishdate","{0:yyyy-MM-dd hh:mm:ss}") %>'></asp:Label>
                                                            <asp:HyperLink ID="HyperLink3" runat="server">
                                                                <i class="zan fa fa-thumbs-o-up"></i>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# "("+Eval("love")+")" %>'></asp:Label>
                                                            </asp:HyperLink>
                                                            <span class="sep">|</span>
                                                            <asp:HyperLink ID="HyperLink4" CssClass="s-fc3" Text="回复" runat="server"></asp:HyperLink>
                                                        </div>
                                                    </div>
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
    </div>
    <!-- END-main -->
    <script type="text/javascript">
        $(function () {
            $("#ContentPlaceHolder1_myButton4").click(function () {
                $("#content").val(document.getElementById("Editor1").innerHTML)
            });
        });
    </script>
    <script type="text/javascript">
        $(".m").mouseleave(function () {
            //alert($("#Editor1").html())
            //document.getElementById("ContentPlaceHolder1_filecontentLabe2").innerHTML = document.getElementById("Editor1").innerHTML;
            $("#ContentPlaceHolder1_filecontentLabe2").text(document.getElementById("Editor1").innerHTML)
        });

    </script>
</asp:Content>

