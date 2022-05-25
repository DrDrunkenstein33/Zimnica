﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
        </p>

        <p>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" class="input" TextMode="Email" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </p>

        <p>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        </p>

        <p>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" class="input"></asp:TextBox>
        </p>

        <asp:Button ID="Button1" runat="server" Text="Log in" OnClick="Button1_Click" />
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
