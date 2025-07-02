<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%@ page import="com.shop.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - ShopEase</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center; 
        }
        h1 {
            color: #333;
        }
        .logout-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String name=user.getName();
    %>

    <h1>Welcome, <%= name %>!</h1>
    <p>You're now logged into ShopEase. Enjoy your shopping experience.</p>

    <form action="logout" method="post" class="logout-btn">
        <input type="submit" value="Logout">
    </form>

</body>
</html>
