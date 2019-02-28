<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="ManageList.aspx.cs" Inherits="HouTai_NameList" %>

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
        .border span {
            display: inline-block;
            margin-right: 5px;
        }
    </style>
    <!--***** ManageList *****-->
    <div class="search_style">
        <ul class="search_content clearfix">
            <li>
                <label class="l_f">管理员名称:</label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="请输入用户名关键字" class="text_add"></asp:TextBox>
            </li>
            <li>
                <label class="l_f">添加时间:</label>
                <asp:TextBox ID="appDate" CssClass="inline laydate-icon" runat="server"></asp:TextBox>
            </li>
            <li style="width: 90px;">
                <asp:Button ID="Button" runat="server" Text="查询" CssClass="btn_search " OnClick="Button6_Click" />
            </li>
        </ul>
    </div>
    <div class="border clearfix">
        <span class="l_f">
            <asp:Button ID="Button2" runat="server" Text="权限管理" CssClass="btn btn-warning" />
            <asp:Button ID="Button6" runat="server" Text="添加管理员" CssClass="btn btn-primary" />
            <asp:Button ID="Button3" runat="server" Text="批量删除" CssClass="btn btn-danger" OnClick="Button3_Click" OnClientClick="return confirm('是否批量删除')" />
        </span>
        <span class="r_f">共：<b><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></b>条</span>
    </div>
    <div class="boot-form news_list">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [manage]" DeleteCommand="DELETE FROM [manage] WHERE [manageid] = @manageid" InsertCommand="INSERT INTO [manageid] ([managename], [password], [sex], [email], [phone], [birthday], [introduce], [region], [picture]) VALUES (@managename, @password, @sex, @email, @phone, @birthday, @introduce, @region, @picture)" UpdateCommand="UPDATE [users] SET [username] = @username, [password] = @password, [sex] = @sex, [email] = @email, [phone] = @phone, [birthday] = @birthday, [introduce] = @introduce, [region] = @region, [grouping] = @grouping WHERE [userid] = @userid">
            <DeleteParameters>
                <asp:Parameter Name="manageid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="managename" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="birthday" Type="DateTime" />
                <asp:Parameter Name="introduce" Type="String" />
                <asp:Parameter Name="region" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="birthday" Type="DateTime" />
                <asp:Parameter Name="introduce" Type="String" />
                <asp:Parameter Name="region" Type="String" />
                <asp:Parameter Name="manageid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="manageid" DataSourceID="SqlDataSource1" AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" BorderColor="#E4E3E0" Width="100%" PageSize="7">
            <Columns>
                <asp:TemplateField HeaderText="全选">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" ToolTip='<%# Bind("manageid") %>' OnCheckedChanged="CheckBox1_CheckedChanged" />
                    </ItemTemplate>
                    <HeaderStyle Height="50px" Width="5%" />
                    <ItemStyle Height="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="managename" HeaderText="管理员名" SortExpression="username">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="phone" HeaderText="手机号" SortExpression="phone">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex">
                    <HeaderStyle Width="5%" />
                </asp:BoundField>
                <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="introduce" HeaderText="介绍" SortExpression="introduce">
                    <HeaderStyle Width="35%" />
                </asp:BoundField>
                <asp:BoundField DataField="region" HeaderText="所在地" SortExpression="region">
                    <HeaderStyle Width="15%" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False" HeaderText="删除操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-danger links_del" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('是否删除')"><i class="fa fa-trash"></i>删除</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="编辑操作">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary links_edit" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success links_edit" OnClick="LinkButton1_Click" ToolTip='<%# Bind("manageid") %>'><i class="fa fa-edit"></i>编辑</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle Font-Size="10px" Height="10px" CssClass="test" />
            <PagerStyle Font-Size="8px" HorizontalAlign="Center" Width="100%" CssClass="bubufxPagerCss" />
        </asp:GridView>
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="返回第一页" class="btn btn-outline-success" Visible="False" />
        <asp:Button ID="Button5" runat="server" Text="返回上一页" class="btn btn-outline-info" OnClick="Button5_Click" Visible="False" />
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
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

            $("#ContentPlaceHolder1_appDate").mobiscroll($.extend(opt['date'], opt['default']));
        });
    </script>
</asp:Content>

