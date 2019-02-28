<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="HouTai_NewsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/apps/List.css" />
    <script src="js/mobiscroll_002.js" type="text/javascript"></script>
	<script src="js/mobiscroll_004.js" type="text/javascript"></script>
	<link href="css/mobiscroll_002.css" rel="stylesheet" type="text/css" />
	<link href="css/mobiscroll.css" rel="stylesheet" type="text/css"/>
	<script src="js/mobiscroll.js" type="text/javascript"></script>
	<script src="js/mobiscroll_003.js" type="text/javascript"></script>
	<script src="js/mobiscroll_005.js" type="text/javascript"></script>
	<link href="css/mobiscroll_003.css" rel="stylesheet" type="text/css"/>
    <style>
        .news_list tbody tr:not(:first-child) td:nth-child(6) {
            text-indent: 0em;
        }
    </style>
    <!--***** NewsList *****-->
    <div class="d_Confirm_Order_style">
        <div class="search_style">
            <ul class="search_content clearfix">
                <li>
                    <label class="l_f">图文查询:</label>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="请输入关键字" CssClass="text_add"></asp:TextBox>
                </li>
                <li>
                    <label class="l_f">添加时间:</label>
                    <input class="inline laydate-icon" readonly="readonly" name="appDate" id="appDate" type="text" value="" />
                </li>
                <li style="width: 90px;">
                    <asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn_search " />
                </li>
            </ul>
        </div>
        <div class="border clearfix">
            <span class="l_f">
                <asp:Button ID="Button2" runat="server" Text="待发布" CssClass="btn btn-warning" />
                <asp:Button ID="Button3" runat="server" Text="添加图文" CssClass="btn btn-primary" OnClick="Button3_Click" />
                <asp:Button ID="Button5" runat="server" Text="批量删除" CssClass="btn btn-danger" OnClick="Button5_Click" OnClientClick="return confirm('是否批量删除')" />
            </span>
            <span class="r_f">共：<b><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></b>条</span>
        </div>

        <div class="boot-form news_list" id="page">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>"
                DeleteCommand="DELETE FROM [files] WHERE [fileid] = @fileid" InsertCommand="INSERT INTO [files] ([filename],[publishdate], [filecontent], [radact], [abstract], [pic]) VALUES (@filename, @filecontent, @publishdate, @filecontent, @radact, @abstract, @pic)" SelectCommand="SELECT * FROM [files]"
                UpdateCommand="UPDATE [files] SET [filename] = @filename, [filecontent] = @filecontent, [publishdate] = @publishdate, [filecontent] = @filecontent, [radact] = @radact, [abstract] = @abstract, [pic] = @pic WHERE [fileid] = @fileid">
                <DeleteParameters>
                    <asp:Parameter Name="fileid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="filename" Type="String" />
                    <asp:Parameter Name="filecontent" Type="String" />
                    <asp:Parameter Name="publishdate" Type="DateTime" />
                    <asp:Parameter Name="filecontent" Type="Int32" />
                    <asp:Parameter Name="radact" Type="String" />
                    <asp:Parameter Name="abstract" Type="String" />
                    <asp:Parameter Name="pic" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="filename" Type="String" />
                    <asp:Parameter Name="filecontent" Type="String" />
                    <asp:Parameter Name="publishdate" Type="DateTime" />
                    <asp:Parameter Name="filecontent" Type="Int32" />
                    <asp:Parameter Name="radact" Type="String" />
                    <asp:Parameter Name="abstract" Type="String" />
                    <asp:Parameter Name="pic" Type="String" />
                    <asp:Parameter Name="fileid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanged="GridView1_PageIndexChanged" BorderColor="#E4E3E0" Width="100%" PageSize="7">
                <Columns>
                    <asp:TemplateField HeaderText="全选">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" ToolTip='<%# Bind("fileid") %>' OnCheckedChanged="CheckBox1_CheckedChanged" />
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Height="120px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="封面" SortExpression="pic">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pic") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pic") %>' Width="100px" />
                        </ItemTemplate>
                        <HeaderStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="filename" HeaderText="图文标题" SortExpression="filename">
                        <HeaderStyle Width="12%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="publishdate" HeaderText="发布时间" SortExpression="publishdate">
                        <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="radact" HeaderText="发布人" SortExpression="radact">
                        <HeaderStyle Width="5%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="abstract" HeaderText="摘要" SortExpression="abstract">
                        <HeaderStyle Width="40%" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success links_edit" CausesValidation="False" OnClick="LinkButton1_Click" ToolTip='<%# Eval("fileid") %>'><i class="fa fa-edit"></i>编辑</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger links_del" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('是否删除')"><i class="fa fa-trash"></i>&nbsp;删除</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="13%" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Font-Size="10px" Height="10px" />
                <PagerStyle Font-Size="8px" HorizontalAlign="Center" Width="100%" CssClass="bubufxPagerCss" />
            </asp:GridView>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var currYear = (new Date()).getFullYear();
            var opt = {};
            opt.date = { preset: 'date' };
            opt.datetime = { preset: 'datetime' };
            opt.time = { preset: 'time' };
            opt.default = {
                theme: 'android-ics light', //皮肤样式
                display: 'modal', //显示方式 
                mode: 'scroller', //日期选择模式
                dateFormat: 'yyyy-mm-dd',
                lang: 'zh',
                showNow: true,
                nowText: "今天",
                startYear: currYear - 10, //开始年份
                endYear: currYear + 10 //结束年份
            };

            $("#appDate").mobiscroll($.extend(opt['date'], opt['default']));
        });
    </script>
</asp:Content>

