<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.CartItem, java.util.List" %>
<jsp:include page="Navbar.jsp" />

<%@ page import="com.shop.model.User" %>

    <%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);

  User user = (User) session.getAttribute("user");
  if (user == null) {
      response.sendRedirect("login.jsp");
      return;
  }
%>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart"); 
    if (cart == null || cart.isEmpty()) {
  
%>
    <h2>Your cart is empty.</h2>
<%
response.sendRedirect("user-products");
return;
    } else {
        double total = 0;
        int totalItems = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Shopease Cart</title>
  <link rel="stylesheet" href="css/Cartt.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

  <div class="cart-wrapper">
    <div class="cart-main">
      <h2>Shopping Cart</h2>

<%
    for (CartItem item : cart) {
        double price = item.getProduct().getPrice();
        int qty = item.getQuantity();
        double subtotal = price * qty;
        total += subtotal;
        totalItems += qty;
%>
      <div class="cart-item">
        <input type="checkbox" />
        <img src="<%= request.getContextPath() + "/" + item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getProduct_name() %>" class="item-img" />
        <div class="item-details">
          <h3><%= item.getProduct().getProduct_name() %></h3>
          <p>Colour: Midnight</p>
          <p class="price">₹<%= price %> <span class="sub-price"><del>(₹<%= price + 100 %>)</del></span></p>
          <p class="info">Eligible for <span class="blue-text">FREE Shipping</span> |
            <span class="fulfilled">✔ Fulfilled</span>
          </p>

          <div class="controls">
            <div class="qty-box">
              <form action="update-cart" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>"/>
                <button type="submit" name="action" value="decrease">-</button>
              </form>

              <span><%= qty %></span>

              <form action="update-cart" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>"/>
                <button type="submit" name="action" value="increase">+</button>
              </form>
            </div>

            <div class="links">
              <form action="remove-from-cart" method="post" style="display:inline;">
                <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>"/>
                <button class="link-button" type="submit">Delete</button>
              </form> |
              <a href="#">Save for later</a> |
              <a href="#">See more like this</a> |
              <a href="#">Share</a>
            </div>
          </div>
        </div>
      </div>
<%
    } // end for loop
%>

    </div> <!-- end of cart-main -->

    <!-- Cart Summary -->
    <div class="cart-summary">
      <div class="summary-card">
        <p class="green-text">Your order is eligible for <strong>FREE Delivery</strong>.</p>
        <p class="blue-text">Choose FREE Delivery option at checkout.</p>
        <hr />
        <p class="summary-line">Subtotal (<%= totalItems %> items): ₹<%= total %></p>

        <p class="summary-line gift-line">
          <label><input type="checkbox" /> This order contains a gift</label>
        </p>

        <a href="Ordersuccess.jsp" class="checkout-btn" >Proceed to Buy</a>

        <div class="emi-box">
          <label for="emi">EMI Options:</label>
          <select id="emi">
            <option>No-cost EMI</option>
            <option>Standard EMI</option>
            <option>Credit Card EMI</option>
          </select>
        </div>
      </div>
    </div>

  </div> <!-- end of cart-wrapper -->


<script>
  // Prevent back button from showing cached cart
  window.addEventListener("pageshow", function (event) {
    if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
      // Reload if coming back via browser back/forward cache
      window.location.href = "user-products";
    }
  });
</script>

</body>
</html>
<%
    }
%>
