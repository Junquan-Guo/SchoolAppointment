<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yanzhengma.aspx.cs" Inherits="yanzhengma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .yanzhengma {
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src="./GenerateCheckCode.aspx" class="yanzhengma" />
    </div>
    </form>
</body>
<script src="js/jquery.js"></script>
<script>
    $("img").click(function () {
        $("img").attr("src", "./GenerateCheckCode.aspx?"+new Date())
    })
</script>
</html>
