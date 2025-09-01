<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="FoodMart_Pro.Admin.adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="adminloginform.css" rel="stylesheet" />
    <title>Admin Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMsg" runat="server" CssClass="error"></asp:Label><br />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter Username"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="aspNetButton" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
