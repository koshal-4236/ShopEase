<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User Login | Shopease</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/UserrLogins.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="bg-overlay"></div>

  <div class="user-container">
    <h2><i class="fas fa-user"></i> User Login</h2>
    <form action="login" method="post">
      <div class="input-group">
        <label for="email"><i class="fas fa-envelope"></i> Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required />
      </div>

      <div class="input-group">
        <label for="password"><i class="fas fa-lock"></i> Password</label>
        
        <div class="password-container">
    <input type="password" name="password" id="password" placeholder="Enter your password" required />
    <button type="button" id="togglePassword" class="toggle-btn">
      <i class="fas fa-eye"></i>
    </button>
  </div>
      </div>

      <div class="form-options">
        <label><input type="checkbox" name="remember" /> Remember Me</label>
        <a href="#" class="forgot">Forgot Password?</a>
      </div>

      <button type="submit" class="login-btn" >
        <i class="fas fa-sign-in-alt"></i> Login
      </button>
    </form>

    <p class="register-link">
      Don't have an account? <a href="register.jsp">Register</a>
    </p>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error-message"><%= error %></div>
    <%
        }
    %>
  </div>
  
   <script>
  const toggleBtn = document.getElementById('togglePassword');
  const passwordField = document.getElementById('password');
  toggleBtn.addEventListener('click', () => {
    const type = passwordField.type === 'password' ? 'text' : 'password';
    passwordField.type = type;
    toggleBtn.innerHTML = type === 'password'
      ? '<i class="fas fa-eye"></i>'
      : '<i class="fas fa-eye-slash"></i>';
  });
</script>

</body>
</html>
