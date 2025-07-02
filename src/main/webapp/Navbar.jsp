<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.Product, com.shop.model.User, com.shop.model.CartItem" %>
<%@ page import="java.util.List, java.util.ArrayList" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String name = user.getName();

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    int cartCount = 0;
    for (CartItem item : cart) {
        cartCount += item.getQuantity();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shopease Cart with Nav</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" href="css/navbar.css">
</head>
<body>

 
  <div class="navbar">
    <h1>Shopease</h1>
    <div class="hamburger" id="hamburger">
      <div></div>
      <div></div>
      <div></div>
    </div>
    <div class="navbar-links" id="navbar-links">
      <a href="Home.jsp">Home</a>
      <a href="user-products">Products</a>
      <a href="Contact.jsp">Contact</a>
      <a href="view-cart" class="cart-icon"><i class="fa-solid fa-cart-shopping"></i><sup><%= cartCount %></sup></a>
      
      <div class="profile-wrapper">
        <div class="k-button" id="k-button"><%= name.charAt(0) %></div>
        <a href="userlogout"class="logout-btn" id="logout-btn">Logout</a>
      </div>
    </div>
  </div>

  
  <script>
    const hamburger = document.getElementById('hamburger');
    const navbarLinks = document.getElementById('navbar-links');
    const kButton = document.getElementById('k-button');
    const logoutBtn = document.getElementById('logout-btn');

    hamburger.addEventListener('click', () => {
      hamburger.classList.toggle('active');
      navbarLinks.classList.toggle('active');
    });

    kButton.addEventListener('click', () => {
      logoutBtn.style.display = logoutBtn.style.display === 'block' ? 'none' : 'block';
    });

    logoutBtn.addEventListener('click', () => {
      window.location.href = 'login.html'; 
    });
  </script>

</body>
</html>
