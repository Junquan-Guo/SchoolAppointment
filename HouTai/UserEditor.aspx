<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="UserEditor.aspx.cs" Inherits="HouTai_UserEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="../css/dase.css" media="screen" />
    <style>
        input[type="text"] {
            margin-left: 0;
        }

        ul, menu {
            margin-block-start: 0em;
        }

        input[type="text"], input[type="text"], textarea, input[type=radio] {
            cursor: not-allowed;
        }
    </style>
    <!--***** UserEditor *****-->
    <div class="update_screen">
        <div id="bmiform">
            <div class="col-md-7  col-sm-7 inner-left m-frm">
                <input type="hidden" name="is_post" value="1" />
                <div class="itm">
                    <asp:Label ID="Label5" CssClass="lab" runat="server" Text="昵称："></asp:Label>
                    <asp:TextBox ID="TextBox1" CssClass="u-txt txt" Text="不就是名字吗?" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
                <div class="itm f-cb">
                    <asp:Label ID="Label7" CssClass="lab" runat="server" Text="介绍："></asp:Label>
                    <div class="u-txtwrap f-pr">
                        <asp:TextBox ID="TextBox3" CssClass="u-txt area" Text="暂无介绍!" TextMode="MultiLine" Rows="6" runat="server" ReadOnly="True"></asp:TextBox>
                        <span class="zs s-fc2" id="remain">165</span>
                    </div>
                </div>
                <div class="itm">
                    <asp:Label ID="Label8" CssClass="lab" runat="server" Text="电话："></asp:Label>
                    <asp:TextBox ID="TextBox2" CssClass="u-txt txt" Text="不就是个手机号吗?" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
                <div class="itm">
                    <asp:Label ID="Label1" CssClass="lab" runat="server" Text="邮箱："></asp:Label>
                    <asp:TextBox ID="TextBox4" CssClass="u-txt txt" Text="" ReadOnly="True" runat="server"></asp:TextBox>
                </div>
                <div class="itm f-cb">
                    <asp:Label ID="Label9" CssClass="lab" runat="server" Text="性别："></asp:Label>
                    <div class="f-pr">
                        <asp:RadioButton ID="radSex" runat="server" CssClass="check" GroupName="sex" Text="男" ReadOnly="True"></asp:RadioButton>
                        <asp:RadioButton ID="radSex2" runat="server" CssClass="check" GroupName="sex" Text="女" ReadOnly="True"></asp:RadioButton>
                        <asp:RadioButton ID="radSex3" runat="server" CssClass="check" GroupName="sex" Text="保密" ReadOnly="True"></asp:RadioButton>
                    </div>
                </div>
                <div class="itm f-cb">
                    <asp:Label ID="Label10" CssClass="lab" runat="server" Text="生日："></asp:Label>
                    <div class="f-pr">
                        <asp:TextBox ID="TextBox5" CssClass="u-txt txt" Text="" ReadOnly="True" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="itm f-cb">
                    <asp:Label ID="Label11" CssClass="lab" runat="server" Text="等级："></asp:Label>
                    <div class="f-pr">
                        <asp:TextBox ID="TextBox6" CssClass="u-txt txt" Text="" ReadOnly="True" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" style="margin-right: 15px;">
                            <asp:ListItem Value="普通会员">普通会员</asp:ListItem>
                            <asp:ListItem Value="初级会员">初级会员</asp:ListItem>
                            <asp:ListItem Value="中级会员">中级会员</asp:ListItem>
                            <asp:ListItem Value="高级会员">高级会员</asp:ListItem>
                            <asp:ListItem Value="超级管理员">超级管理员</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-sm-5 media-right avatar">
                <asp:Image ID="Avatar" runat="server" ImageUrl="~/images/user.png" Width="140px" Height="140px" />
            </div>
            <div class="col-md-12 col-sm-12">
                <div id="myButtons1" class="bs-example u-btn">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="修改" OnClick="Button1_Click" />
                </div>
                <div id="myButtons2" class="bs-example u-btn">
                    <asp:Button ID="Button2" CssClass="btn" runat="server" Text="返回" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

