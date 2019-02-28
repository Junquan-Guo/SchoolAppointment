<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <!-- main -->
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <h3 class="agile_w3_title">修改密码</h3>
                </div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;
                    <span>当前位置： 
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

    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <aside class="sidebar col-md-1 inner-left" role="complementary">
                </aside>
                <div class="main col-md-10 inner-left" role="main">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">修改密码</h3>
                        </div>
                        <div class="panel-body">
                            <div class="update_screen">
                                <div id="Form1" class="layui-form changePwd" runat="server">
                                    <div style="color: #f00; margin-bottom: 15px;">
                                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入密码!" ControlToValidate="password1" ForeColor="Red">请输入要更改的密码!</asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入新密码!" ControlToValidate="oldPwd" ForeColor="Red">请输入新密码!</asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入确认密码!" ControlToValidate="password2" ForeColor="Red">请输入确认密码!</asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp; 
                                    </div>
                                    <div style="color: #f00; margin-bottom: 15px;">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入6~18位数!" ControlToValidate="oldPwd" ForeColor="Red" ValidationExpression="\w{6,18}">输入6~18位数!</asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" ControlToCompare="oldPwd" ControlToValidate="password2" ForeColor="Red">确认密码与新密码不一致!</asp:CompareValidator>&nbsp;&nbsp;&nbsp;
                                        </div>
                                    <div class="layui-form-item">
                                        <asp:Label ID="Label1" runat="server" Text="用户名:" CssClass="layui-form-label"></asp:Label>
                                        <div class="layui-input-block">
                                            <asp:TextBox ID="managename1" runat="server" Text="登录后显示用户名！" disabled="disabled" CssClass="layui-input layui-disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <asp:Label ID="Label2" runat="server" Text="旧密码:" CssClass="layui-form-label"></asp:Label>
                                        <div class="layui-input-block">
                                            <asp:TextBox ID="password1" runat="server" TextMode="Password" placeholder="请输入旧密码" CssClass="layui-input pwd"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <asp:Label ID="Label3" runat="server" Text="新密码:" CssClass="layui-form-label"></asp:Label>
                                        <div class="layui-input-block">
                                            <asp:TextBox ID="oldPwd" runat="server" TextMode="Password" placeholder="请输入新密码" CssClass="layui-input pwd"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <asp:Label ID="Label4" runat="server" Text="确认密码:" CssClass="layui-form-label"></asp:Label>
                                        <div class="layui-input-block">
                                            <asp:TextBox ID="password2" runat="server" TextMode="Password" placeholder="请确认密码" CssClass="layui-input pwd"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block2">
                                            <asp:Button ID="Button1" runat="server" Text="立即修改" CssClass="btn btn-primary" OnClick="Button1_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button2" runat="server" Text="重置" CssClass="btn" OnClick="Button2_Click"/>
                                        </div>
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
</asp:Content>

