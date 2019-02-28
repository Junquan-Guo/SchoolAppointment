<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user_update.aspx.cs" Inherits="update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/index.css" media="screen" />
    <style type="text/css">
        .touxian {
            display:none;

        }
    </style>
    <!-- main -->
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <h3 class="agile_w3_title">个人信息编辑</h3>
                </div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;
                    <span>当前位置： 
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" PathSeparator="/ ">
                            <CurrentNodeStyle ForeColor="#777777" Font-Size="13px" />
                            <NodeStyle Font-Bold="True" ForeColor="#777777" Font-Size="13px" />
                            <PathSeparatorStyle Font-Bold="True" Font-Size="8px" ForeColor="#777777"  CssClass="separator"/>
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
                            <h3 class="panel-title">个人设置</h3>
                        </div>
                        <div class="panel-body">
                            <div class="update_screen">
                                <div id="bmiform">
                                    <div class="col-md-7  col-sm-7 inner-left m-frm">
                                        <input type="hidden" name="is_post" value="1" />
                                        <div class="itm">
                                            <asp:Label ID="Label1" CssClass="lab" runat="server" Text="昵称："></asp:Label>
                                            <asp:TextBox ID="TextBox1" CssClass="u-txt txt" Text="不就是名字吗?" maxlength="18" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="itm f-cb">
                                            <asp:Label ID="Label2" CssClass="lab" runat="server" Text="介绍："></asp:Label>
                                            <div class="u-txtwrap f-pr">
                                                <asp:TextBox ID="Signature" CssClass="u-txt area" Text="这里是一个帅气的介绍!!!" TextMode="MultiLine" Rows="6" runat="server"></asp:TextBox>
                                                <span class="zs s-fc2" id="remain">165</span>
                                            </div>
                                        </div>
                                        <div class="itm">
                                            <asp:Label ID="Label7" CssClass="lab" runat="server" Text="电话："></asp:Label>
                                            <asp:TextBox ID="TextBox3" CssClass="u-txt txt" Text="不就是个手机号吗?" maxlength="11" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="itm f-cb">
                                            <asp:Label ID="Label3" CssClass="lab" runat="server" Text="性别："></asp:Label>
                                            <div class="f-pr">
                                                <asp:RadioButton ID="radSex" runat="server" CssClass="check" GroupName="sex" Text="男" ></asp:RadioButton>
                                                <asp:RadioButton ID="radSex2" runat="server" CssClass="check" GroupName="sex" Text="女"></asp:RadioButton>
                                                <asp:RadioButton ID="radSex3" runat="server" CssClass="check" GroupName="sex" Text="保密"></asp:RadioButton>
                                            </div>
                                        </div>
                                        <div class="itm f-cb">
                                            <asp:Label ID="Label4" CssClass="lab" runat="server" Text="生日："></asp:Label>
                                            <div class="f-pr">
                                                <div class="list_edit">
                                                    <asp:DropDownList ID="year" OnSelectedIndexChanged="year_SelectedIndexChanged" runat="server" AutoPostBack="True"></asp:DropDownList>年&nbsp;&nbsp;
                                                    <asp:DropDownList ID="month" OnSelectedIndexChanged="month_SelectedIndexChanged" runat="server" AutoPostBack="True"></asp:DropDownList>月&nbsp;&nbsp;
                                                    <asp:DropDownList ID="day" runat="server" AutoPostBack="True"></asp:DropDownList>日&nbsp;&nbsp;
                                                </div>
                                            </div>
                                        </div>
                                        <div class="itm f-cb">
                                            <asp:Label ID="Label5" CssClass="lab" runat="server" Text="地区："></asp:Label>
                                            <div class="f-pr">
                                                <select name="provs" style="margin-right:15px;">
                                                    <option>—请选择—</option>
                                                    <option>北京市</option>
                                                    <option>天津市</option>
                                                    <option>河北省</option>
                                                </select>
                                                <select name="cities" class="hide">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-sm-5 media-right avatar">
                                        <div style=" display: block;">
                                            <div style="float: left;">
                                                <asp:Image ID="avatar" runat="server" ImageUrl="~/images/user.png" Width="140px" Height="140px" />
                                                <span class="btm"><a href="javascript:;" class="upload" id="upload">更换头像</a></span>
                                            </div>
                                            <div style="float: right;">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="images/user.gif" Height="144px" Width="144px" />
                                            </div>
                                        </div>
                                        <div class="touxian">
                                            <br />
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <br />
                                            <asp:Button ID="Button4" runat="server" Text="显示封面" CssClass="btn btn-info" OnClick="Button4_Click" />
                                            <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="Label12" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div id="myButtons1" class="bs-example u-btn">
                                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="确定" OnClick="Button1_Click" />
                                        </div>
                                        <div id="myButtons2" class="bs-example u-btn">
                                            <asp:Button ID="Button2" CssClass="btn" runat="server" Text="取消" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <aside class="sidebar col-md-1 inner-right" role="complementary">
                   
                </aside>
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <script>
        /*实现“省”和“市”的级联下拉列表*/
        var cities = [
          [{ "name": '东城区', "value": 101 },
           { "name": '西城区', "value": 102 },
           { "name": '海淀区', "value": 103 },
           { "name": '朝阳区', "value": 104 }],//0
          [{ "name": '河东区', "value": 201 },
           { "name": '河西区', "value": 202 },
           { "name": '南开区', "value": 303 }],
          [{ "name": '石家庄市', "value": 301 },
           { "name": '廊坊市', "value": 302 },
           { "name": '保定市', "value": 303 },
           { "name": '唐山市', "value": 304 },
           { "name": '秦皇岛市', "value": 304 }]
        ];
        //查找两个select
        var selProvs =
          document.getElementsByName(
            "provs"
          )[0];
        var selCts =
          document.getElementsByName(
            "cities"
          )[0];
        //为selProvs绑定选中项改变事件
        selProvs.onchange = function () {
            //获得当前select选中项的下标
            var i = this.selectedIndex;
            if (i > 0) {
                //获得cities数组中i-1位置的子数组
                var cts = cities[i - 1];
                //清空selCts的内容:
                selCts.innerHTML = "";
                //创建文档片段
                var frag =
                 document.createDocumentFragment();
                //创建一个option，内容为-请选择-,追加到selCts下
                var opt =
                  document.createElement("option");
                opt.innerHTML = "-请选择-";
                frag.appendChild(opt);
                //遍历cts中每个城市
                for (var i = 0; i < cts.length; i++) {
                    //创建一个option，设置其内容为当前城市的name属性，设置其value为当前城市的value属性,追加到selCts中
                    var opt =
                      document.createElement("option");
                    //cts[i]:
                    // {"name":'东城区',"value":101}
                    opt.innerHTML = cts[i]["name"];
                    opt.value = cts[i]["value"];
                    frag.appendChild(opt);
                }
                //将frag整体追加到selCts中
                selCts.appendChild(frag);
                //清除selCts的class
                selCts.className = "";
            } else
                selCts.className = "hide";
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".avatar .upload").click(function () {
                $(".touxian").toggle();
            });
        });
    </script>
    <!-- END-main -->
</asp:Content>

