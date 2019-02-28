<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="assist.aspx.cs" Inherits="assist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/index.css" media="screen" />
    <style style="text/css">
        .navbar-nav > li:nth-of-type(6)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
    </style>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"  ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" 
        SelectCommand="SELECT * FROM [types]  WHERE (typeid = @typeid) ">
        <SelectParameters>
            <asp:QueryStringParameter Name="typeid" QueryStringField="typeid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="typeid" DataSourceID="SqlDataSource5">
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
    <%--met-index-tool--%>
    <asp:SqlDataSource ID="SqlDataSource_Headline1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [label] WHERE ([labelid] = @labelid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="labelid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="met-index-tool">
        <!--container-->
        <div class="container">
            <div class="feature-grids">
                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource6">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon1"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource7">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon2"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView9" runat="server" DataSourceID="SqlDataSource8">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon3"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource9">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon4"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="5" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon5"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="6" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon6"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="7" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon7"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-3 feature-grid">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [tool] WHERE ([toolid] = @toolid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="8" Name="toolid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="assist_detail.aspx">
                                <i class="icon8"></i>
                            </asp:HyperLink>
                            <h3>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="assist_detail.aspx" Text='<%# Eval("toolname")%>'>
                                </asp:HyperLink> 
                            </h3>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("toolabstract").ToString().Length>31 ? Eval("toolabstract").ToString().Substring(0,30)+"...":Eval("toolabstract") %>'></asp:Label>
                            </p>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="clearfix"></div>

            </div>
		</div>
        
        <!--END_container-->
        
    </div>
    <%--END_met-index-tool--%>
</asp:Content>

