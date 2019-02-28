<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="NewsAdd.aspx.cs" Inherits="HouTai_NewsAdd" %>

<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>

<%@ Register Assembly="CuteEditor.ImageEditor" Namespace="CuteEditor.ImageEditor" TagPrefix="iws" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/apps/Edit.css" />
    <script src="js/mobiscroll_002.js" type="text/javascript"></script>
	<script src="js/mobiscroll_004.js" type="text/javascript"></script>
	<link href="css/mobiscroll_002.css" rel="stylesheet" type="text/css" />
	<link href="css/mobiscroll.css" rel="stylesheet" type="text/css"/>
	<script src="js/mobiscroll.js" type="text/javascript"></script>
	<script src="js/mobiscroll_003.js" type="text/javascript"></script>
	<script src="js/mobiscroll_005.js" type="text/javascript"></script>
	<link href="css/mobiscroll_003.css" rel="stylesheet" type="text/css"/>
    <!--***** NewsAdd *****-->
    <div class="d_Confirm_Order_style">
        <div class="form-item">
            <asp:Label ID="Label1" runat="server" Text="图文标题:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="请输入图文标题" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-item">
            <asp:Label ID="Label2" runat="server" Text="图文作者:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="请输入图文作者" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-item">
            <asp:Label ID="Label3" runat="server" Text="发布时间:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="appDate" runat="server" CssClass="form-input-1"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="图文类型:" CssClass="form-label-1"></asp:Label>
            <asp:DropDownList ID="DropDownList1" CssClass="form-input-2" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True"></asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" CssClass="form-input-2" runat="server"></asp:DropDownList>
        </div>

        <div class="form-item">
            <asp:Label ID="Label6" runat="server" Text="新闻封面:" CssClass="form-label"></asp:Label>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/HouTai/images/pic.png" Height="166px" Width="250px" />
            <div class="form-pic">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Button4" runat="server" Text="显示封面" CssClass="btn btn-info" OnClick="Button4_Click" />
                <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </div>

        <div class="form-item">
            <asp:Label ID="Label7" runat="server" Text="图文摘要:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-text" TextMode="MultiLine" placeholder="请输入图文摘要"></asp:TextBox>
        </div>

        <asp:Label ID="Label8" runat="server" Text="文章内容:" CssClass="form-label"></asp:Label>
        <ce:editor runat="server" id="Editor1" width="100%" height="600px"></ce:editor>

        <asp:Button ID="Button2" runat="server" Text="重置" CssClass="btn btn-danger" OnClick="Button2_Click" />
        <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn btn-primary" />
        <asp:Button ID="Button3" runat="server" Text="提交" CssClass="btn btn-success" OnClientClick="return confirm('确认提交?')" OnClick="Button3_Click" />
        <asp:Button ID="Button5" runat="server" Text="预览" CssClass="btn btn-warning" />
    </div>
    <div style="display: none">
        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
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

