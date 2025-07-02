<%@ page import="com.shop.model.Product, java.util.List" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    Integer currentPageAttr = (Integer) request.getAttribute("currentPage");
    Integer totalPagesAttr = (Integer) request.getAttribute("totalPages");

    int currentPage = (currentPageAttr != null) ? currentPageAttr : 1;
    int totalPages = (totalPagesAttr != null) ? totalPagesAttr : 1;
%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin - Product List</title>
  <link rel="stylesheet" href="css/ProductLists.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
 <div class="top-bar">
    <h2 class="page-title">
      <i class="fas fa-shopping-cart"></i> All Products
    </h2>
    
    <div class="top-bar-actions">
        <a href="Addproduct.jsp" class="add-btn">
          <i class="fas fa-plus-circle"></i> Add Product
        </a>

        <a href="logout" class="logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
</div>
  
<div class="product-grid">
<%
    if (products != null && !products.isEmpty()) {
        for (Product p : products) {
%>
    <div class="product-card">
      <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>" alt="<%= p.getProduct_name() %>">
      <h3><%= p.getProduct_name() %></h3>
      <p class="price">$<%= p.getPrice() %></p>
      <p class="desc"><%= p.getProduct_desc() %></p>
        
        <div class="actions">
         <form action="editProduct" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= p.getId() %>" />
             <button class="edit-btn" type="submit"><i class="fas fa-edit"></i> Edit</button>
        </form>

        <form action="deleteProduct" method="post" style="display:inline;" onsubmit="return confirm('Are you sure?');">
            <input type="hidden" name="id" value="<%= p.getId() %>" />
            <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
        </form>
        </div>
    </div>
<%
        }
    } else {
%>
    <p>No products available.</p>
<%
    }
%>
</div> <!-- move this outside the loop -->


<!-- Pagination Controls -->
<div class="pagination">
<%
    String baseUrl = "product-list?page=";
    if (totalPages > 1) {
        if (currentPage > 1) {
%>
            <a href="<%= baseUrl + (currentPage - 1) %>">Previous</a>
<%
        }

        for (int i = 1; i <= totalPages; i++) {
            if (i == currentPage) {
%>
                <strong class="active"><%= i %></strong>
<%
            } else {
%>
                <a href="<%= baseUrl + i %>" ><%= i %></a>
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
