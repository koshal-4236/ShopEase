<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  <title>Add Product | Shopease Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" href="css/addproducts.css" />
</head>
<body>
  <div class="form-container">
    <h2><i class="fas fa-plus-circle"></i> Add Product</h2>
    <form action="addProduct" method="post" enctype="multipart/form-data">
      <div class="input-group">
        <label for="name"><i class="fas fa-box"></i> Product Name</label>
        <input type="text" name="name" id="name" placeholder="Enter product name" required />
      </div>

      <div class="input-group">
        <label for="description"><i class="fas fa-align-left"></i> Description</label>
        <input type="text" name="description" id="description" placeholder="Enter product description" required />
      </div>

      <div class="input-group">
        <label for="price"><i class="fas fa-tag"></i> Price</label>
        <input type="text" name="price" id="price" placeholder="Enter price in ₹" required />
      </div>

      <div class="input-group">
        <label for="image"><i class="fas fa-image"></i> Product Image</label>
        <div class="custom-file-wrapper">
          <input type="file" name="image" id="image" required onchange="updateFileName()" />
          <label for="image" class="custom-file-label">
            <i class="fas fa-folder-open"></i> Choose File
          </label>
          <span id="file-name">No file chosen</span>
        </div>
      </div>

      <button type="submit" class="submit-btn">
        <i class="fas fa-upload"></i> Add Product
      </button>
    </form>
  </div>

  <script>
    function updateFileName() {
      const input = document.getElementById('image');
      const fileName = document.getElementById('file-name');
      fileName.textContent = input.files.length ? input.files[0].name : 'No file chosen';
    }
  </script>
</body>
</html>
