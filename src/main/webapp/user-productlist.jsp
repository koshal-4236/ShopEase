<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.Product, com.shop.model.CartItem, com.shop.model.User" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<jsp:include page="Navbar.jsp" />
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Product> products = (List<Product>) request.getAttribute("products");
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");

    if (currentPage == null) currentPage = 1;
    if (totalPages == null) totalPages = 1;

    int cartCount = 0;
    for (CartItem item : cart) {
        cartCount += item.getQuantity();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User - Product List</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="css/UserProducts.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<div class="top-bar">
  <h2 class="page-title"><i class="fas fa-shopping-cart"></i> Shop Products</h2>
</div>

<div class="product-grid">
<%
    if (products != null && !products.isEmpty()) {
        for (Product p : products) {
            CartItem matchedItem = null;
            for (CartItem item : cart) {
                if (item.getProduct().getId() == p.getId()) {
                    matchedItem = item;
                    break;
                }
            }
%>
    <div class="product-card">
      <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>" alt="<%= p.getProduct_name() %>">
      <h3><%= p.getProduct_name() %></h3>
      <p class="price">₹<%= p.getPrice() %></p>
      <p class="desc"><%= p.getProduct_desc() %></p>

<% if (matchedItem != null) { %>
      <div class="quantity-controls">
        <form action="update-cart" method="post" style="display:inline;">
          <input type="hidden" name="productId" value="<%= p.getId() %>" />
          <input type="hidden" name="action" value="decrease" />
          <button type="submit">-</button>
        </form>

        <span><%= matchedItem.getQuantity() %></span>

        <form action="update-cart" method="post" style="display:inline;">
          <input type="hidden" name="productId" value="<%= p.getId() %>" />
          <input type="hidden" name="action" value="increase" />
          <button type="submit">+</button>
        </form>
      </div>
<% } else { %>
      <form action="add-to-cart" method="post">
        <input type="hidden" name="productId" value="<%= p.getId() %>" />
        <button type="submit"><i class="fas fa-cart-plus"></i>Add to Cart</button>
      </form>
<% } %>
    </div>
<%
        }
    } else {
%>
    <p>No products found.</p>
<%
    }
%>
</div>

<!-- Pagination -->
<div class="pagination">
<%
    String baseUrl = "user-products?page=";
    if (totalPages > 1) {
        if (currentPage > 1) {
%>
        <a href="<%= baseUrl + (currentPage - 1) %>">Previous</a>
<%
        }

        for (int i = 1; i <= totalPages; i++) {
            if (i == currentPage) {
%>
        <a class="active" href="#"><%= i %></a>
<%
            } else {
%>
        <a href="<%= baseUrl + i %>"><%= i %></a>
<%
            }
        }

        if (currentPage < totalPages) {
%>
        <a href="<%= baseUrl + (currentPage + 1) %>">Next</a>
<%
        }
    }
%>
</div>

</body>
</html>
<jsp:include page="Footer.jsp" />
