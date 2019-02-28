<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="assist_detail.aspx.cs" Inherits="assist_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/index.css" media="screen" />
    <!-- main -->
    <style>
        .btn {
            padding: 0 5px;
            margin: 0 12px 10px 0;
        }
        .prompt {
            display:none;
        }
        .navbar-nav > li:nth-of-type(6)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
    </style>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">一分钟了解自己</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tools_detail">
                                <div><img src="images/icons-sprt1.png" /></div>
                                <p>1分钟彻底了解自己的标准体重，健康体重范围，BMI指数（即身体质量指数），基础代谢率和燃脂运动中低强度运动心率，看看自己是否需要减肥了。</p>
                                <p>女性：19岁到69岁，身高在152cm到176cm。</p>
                                <p>男性：19岁到69岁，身高在152cm到188cm。</p>
                            </div>
                            <div class="blank25"></div>
                            <div class="line_01"></div>
                            <div class="blank20"></div>
                            <div class="tools_screen">
                                <from method="post" id="bmiform" action="/tool/batchcalc">
                                    <input type="hidden" name="is_post" value="1"/>
                                    <h3>请输入您的性别、年龄、身高和体重：</h3>
                                    <span>
						                <h4>性别：</h4>
						                <input class="radio" type="radio" name="sex" checked="checked" value="男"/><label>男</label>
						                <input class="radio" type="radio" name="sex" value="女"/><label>女</label>
					                </span>
                                    <span><h4>年龄：</h4><input class="txt1" type="text" id="age" name="age" value="0"/><h5>岁</h5></span>
                                    <span><h4>身高：</h4><input class="txt1" type="text" id="height" name="height" value="0"/><h5>CM(厘米)</h5></span>
                                    <span class="last"><h4>体重：</h4><input class="txt1" type="text" id="weight" name="weight" value="0" /><h5>KG(1KG=2斤)</h5></span>
                                    <button type="button" id="button" class="btn btn-primary">确定</button>
                                </from>
                                <div class="prompt">
                                    <p class="ts1">输入年龄不在范围内!,请重新输入!</p>
                                    <p class="ts2">请输入合法的身高!</p>
                                    <p class="ts3">输入体重不在范围内!,请重新输入!</p>
                                </div>
                            </div>
                            <div class="tools_result">
                                <div class="blank10"></div>
                                <h3>您的身体质量指数(BMI)为<font>
                                    <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
                                </font></h3>
                                <p>身体质量指数(BMI)：评估体重与身高比例的常用工具，适用范围：18至65岁的人士。 儿童、发育中的青少年、孕妇、乳母、老人及身型健硕的运动员除外。</p>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th colspan="4">成年人身体质量指数</th>
                                        </tr>
                                        <tr class="addb">
                                            <td>轻体重BMI</td>
                                            <td>健康体重BMI</td>
                                            <td>超重BMI</td>
                                            <td>肥胖BMI</td>
                                        </tr>
                                        <tr class="last">
                                            <td>BMI&lt;18.5</td>
                                            <td>18.5≤BMI&lt;24</td>
                                            <td>24≤BMI&lt;28</td>
                                            <td>28≤BMI</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h3>您的健康体重范围为<font>
                                    <asp:Label ID="Label4" runat="server" Text="0~0"></asp:Label>
                                </font>&nbsp;KG(1KG=2斤)</h3>
                                <h3>您的年龄身高对应标准体重为<font>
                                    <asp:Label ID="Label6" runat="server" Text="0"></asp:Label>
                                </font>&nbsp;KG(1KG=2斤)</h3>
                                <p>
                                    计算适用范围：<br>
                                    女性：19岁到69岁，身高在152cm到176cm。<br>
                                    男性：19岁到69岁，身高在152cm到188cm。
                                </p>
                                <h3>您的基础代谢率为<font>
                                    <asp:Label ID="Label5" runat="server" Text="0"></asp:Label>
                                </font> 大卡</h3>
                                <p>基础代谢率(BMR)：在安静状态下(通常为静卧状态)消耗的最低热量。</p>
                                <h3>您的中低强度运动心率是
                                    <font><asp:Label ID="Label7" runat="server" Text="0"></asp:Label></font>&nbsp;次/分钟&nbsp;&nbsp;&nbsp;&nbsp;到
                                    <font><asp:Label ID="Label8" runat="server" Text="0"></asp:Label></font>&nbsp;次/分钟</h3>
                                <p>
                                    人体要燃烧脂肪，需要满足三个必要条件：<br>
                                    1、该运动要达到中低强度的运动心率；<br>
                                    2、这种中低强度运动心率的运动要持续20分钟以上；<br>
                                    3、这种运动必须是大肌肉群的运动，如慢跑、游泳、健身操等。<br>
                                    低于或高于这个范围，都不算中低强度运动心率，燃烧的也就不是脂肪了~
                                </p>
                                <div class="blank10"></div>
                            </div>
                        </div>
                    </div>

                </div>
                <%--辅助工具--%>
                <asp:SqlDataSource ID="SqlDataSource_Headline1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="labelid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <aside class="sidebar col-md-3 inner-right" role="complementary">
                    <ul id="myTab" class="nav nav-tabs tool_bg">
                        <li class="active">
                            <a href="#home" data-toggle="tab">正在使用
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" id="myTabDrop1" class="dropdown-toggle"
                                data-toggle="dropdown">更多辅助工具 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                <li><a href="#tools1" tabindex="-1" data-toggle="tab">一分钟了解自己</a></li>
                                <li><a href="#tools2" tabindex="-1" data-toggle="tab">标准体重计算</a></li>
                                <li><a href="#tools3" tabindex="-1" data-toggle="tab">健康体重范围</a></li>
                                <li><a href="#tools4" tabindex="-1" data-toggle="tab">身体质量指数(BMI)</a></li>
                                <li><a href="#tools5" tabindex="-1" data-toggle="tab">卡路里计算器</a></li>
                                <li><a href="#tools6" tabindex="-1" data-toggle="tab">食物热量查询</a></li>
                                <li><a href="#tools7" tabindex="-1" data-toggle="tab">基础代谢计算</a></li>
                                <li><a href="#tools8" tabindex="-1" data-toggle="tab">燃脂运动计算</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="blank10"></div>
                        <div class="tab-pane fade in active" id="home">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource6">
                                    <ItemTemplate>
                                        <i class="icon1"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools1">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <i class="icon1"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools2">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource7">
                                    <ItemTemplate>
                                        <i class="icon2"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools3">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="3" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <i class="icon3"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools4">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="4" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource9">
                                    <ItemTemplate>
                                        <i class="icon4"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="tools5">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="5" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <i class="icon5"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools6">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="6" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <i class="icon6"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools7">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="7" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <i class="icon7"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tools8">
                            <div class="feature-grid">
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="8" Name="toolid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <i class="icon8"></i>
                                        <h3>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("toolname") %>'></asp:Label>
                                        </h3>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                                        </p>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <script>
        window.onload = function () {
            var val;
            var sex = document.getElementsByName('sex');
            var button = document.getElementById('button');
            button.addEventListener('click', function () {

                var age = document.getElementById("age").value;
                var height = document.getElementById("height").value;
                var weight = document.getElementById("weight").value;
                var Bmi = (weight / (height * height / 10000)).toFixed(2);
                var MinRate = ((220 - age) * 60 / 100).toFixed(2);
                var ManRate = ((200 - age) * 80 / 100).toFixed(2);
                var Bni; var MinBni; var ManBni; var Bmr;
                for (var i = 0; i < sex.length; i++) {
                    if (sex[i].checked == true) {
                        val = sex[i].value;
                        break;
                    }    
                }
                
                if (age>18 && age<70) {
                    if (height > 10 && height < 300) {
                        if (weight > 10 && weight < 300) {
                            
                            if (val == "男") {
                                Bni = ((height - 80) * 0.7).toFixed(2);
                                MinBni = (Bni * 0.9).toFixed(2);
                                ManBni = (Bni * 1.1).toFixed(2);
                                Bmr = ((13.7 * weight) + (5.0 * height) - (6.8 * age) + 66).toFixed(2);
                            }
                            else if (val == "女") {
                                Bni = ((height - 70) * 0.6).toFixed(2);
                                MinBni = (Bni * 0.9).toFixed(2);
                                ManBni = (Bni * 1.1).toFixed(2);
                                Bmr = ((9.6 * weight) + (1.8 * height) - (4.7 * age) + 655).toFixed(2);
                            }
                            document.getElementById("ContentPlaceHolder1_Label3").innerHTML = Bmi;
                            document.getElementById("ContentPlaceHolder1_Label4").innerHTML = MinBni + "~" + ManBni;
                            document.getElementById("ContentPlaceHolder1_Label5").innerHTML = Bmr;
                            document.getElementById("ContentPlaceHolder1_Label6").innerHTML = Bni;
                            document.getElementById("ContentPlaceHolder1_Label7").innerHTML = MinRate;
                            document.getElementById("ContentPlaceHolder1_Label8").innerHTML = ManRate;
                            $(".prompt").hide();
                            
                        }
                        else {
                            $(".prompt").show();
                            $(".prompt .ts3").show();
                            $(".prompt .ts1").hide();
                            $(".prompt .ts2").hide();
                        }
                    }
                    else {
                        $(".prompt").show();
                        $(".prompt .ts2").show();
                        $(".prompt .ts1").hide();
                        $(".prompt .ts3").hide();
                    }
                }
                else {
                    $(".prompt").show();
                    $(".prompt .ts1").show();
                    $(".prompt .ts2").hide();
                    $(".prompt .ts3").hide();

                }
                    
            }, false);
        }
    </script>
    <!-- END-main -->
</asp:Content>

