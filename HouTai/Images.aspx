<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="Images.aspx.cs" Inherits="HouTai_Images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="8">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" Width="120" ImageUrl='<%#"images/" +Eval("Name")%>' />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

