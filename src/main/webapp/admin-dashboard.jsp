<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin-dashboard.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

    <div class="top-right">
        <a href="#" class="logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </div>
  <div class="login-wrapper">
    <div class="login-container">
      <h2><i class="fas fa-sign-in-alt"></i> Admin Portal</h2>
      <form>
        <div class="login-actions">
          <button class="login-btn" type="button">
            <i class="fas fa-eye"></i> <a href="Addproduct.jsp">Add Product in List</a>
          </button>
          <button class="login-btn" type="button">
            <i class="fas fa-plus"></i> <a href="${pageContext.request.contextPath}/product-list">View All Products</a>
          </button>
        </div>
      </form>
    </div>
  </div>

</body>
</html>