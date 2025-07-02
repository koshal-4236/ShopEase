<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.Product" %>
<%
    Product p = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Edit Product | Shopease Admin</title>
    <link rel="stylesheet" href="css/addproducts.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div class="form-container">
    <h2><i class="fas fa-edit"></i> Edit Product</h2>
    <form action="editProduct" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= p.getId() %>"/>
        <input type="hidden" name="existingImage" value="<%= p.getImageUrl() %>"/>

        <div class="input-group">
            <label><i class="fas fa-box"></i> Product Name</label>
            <input type="text" name="name" value="<%= p.getProduct_name() %>" required />
        </div>

        <div class="input-group">
            <label><i class="fas fa-align-left"></i> Description</label>
            <input type="text" name="description" value="<%= p.getProduct_desc() %>" required />
        </div>

        <div class="input-group">
            <label><i class="fas fa-tag"></i> Price</label>
            <input type="text" name="price" value="<%= p.getPrice() %>" required />
        </div>

        <div class="input-group">
            <label><i class="fas fa-image"></i> New Image (optional)</label>
            <input type="file" name="image" id="image" />
            <p>Current: <%= p.getImageUrl() %></p>
        </div>

        <button type="submit" class="submit-btn">
            <i class="fas fa-upload"></i> Update Product
        </button>
    </form>
</div>
</body>
</html>
