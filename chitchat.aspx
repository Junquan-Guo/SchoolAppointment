<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chitchat.aspx.cs" Inherits="chitchat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style style="text/css">
        .navbar-nav > li:nth-of-type(4)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
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
                <div style="height:400px"></div>
            </div>
        </div>
    </div>
</asp:Content>

