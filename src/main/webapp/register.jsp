<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User Register | Shopease</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/userregiste.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="register-container">
    <h2><i class="fas fa-user-plus"></i> User Register</h2>
    <form action="register" method="post" id="registerForm">
      <div class="input-group">
        <label for="name"><i class="fas fa-user"></i> Name</label>
        <input type="text" id="name" name="name" placeholder="Enter your name" required />
      </div>

      <div class="input-group">
        <label for="email"><i class="fas fa-envelope"></i> Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required />
      </div>

      <div class="input-group">
        <label for="password"><i class="fas fa-lock"></i> Password</label>
        <div class="password-container" id="password-container">
          <input type="password" id="password" name="password" placeholder="Enter your password" required />
          <button type="button" id="togglePassword"><i class="fas fa-eye"></i></button>
        </div>
        <div id="rules-box">
          <p id="rule-length"><span></span> At least 8 characters</p>
          <p id="rule-uppercase"><span></span> At least one uppercase letter</p>
          <p id="rule-lowercase"><span></span> At least one lowercase letter</p>
          <p id="rule-number"><span></span> At least one number</p>
          <p id="rule-special"><span></span> At least one special character (!@#$%^&*)</p>
        </div>
        <div id="password-error" class="error-message"></div>
      </div>

      <% String error = (String) request.getAttribute("error"); %>
      <% if (error != null) { %>
        <div class="error-message" style="text-align:center;"><%= error %></div>
      <% } %>

      <button type="submit" class="register-btn">
        <i class="fas fa-user-plus"></i> Register
      </button>
    </form>

    <p class="login-link">Already have an account? <a href="login.jsp">Login</a></p>
  </div>

  <script>
    const password = document.getElementById("password");
    const form = document.getElementById("registerForm");
    const passwordError = document.getElementById("password-error");
    const ruleLength = document.getElementById("rule-length");
    const ruleUppercase = document.getElementById("rule-uppercase");
    const ruleLowercase = document.getElementById("rule-lowercase");
    const ruleNumber = document.getElementById("rule-number");
    const ruleSpecial = document.getElementById("rule-special");
    const rulesBox = document.getElementById("rules-box");
    const passwordContainer = document.getElementById("password-container");

    password.addEventListener("click", () => {
      rulesBox.style.display = "block";
    });

    document.addEventListener("click", function (e) {
      if (e.target.id !== "password" && !passwordContainer.contains(e.target)) {
        rulesBox.style.display = "none";
      }
    });

    password.addEventListener("input", () => {
      const val = password.value;
      const length = val.length >= 8;
      const uppercase = /[A-Z]/.test(val);
      const lowercase = /[a-z]/.test(val);
      const number = /[0-9]/.test(val);
      const special = /[!@#$%^&*]/.test(val);

      updateRule(ruleLength, length);
      updateRule(ruleUppercase, uppercase);
      updateRule(ruleLowercase, lowercase);
      updateRule(ruleNumber, number);
      updateRule(ruleSpecial, special);

      if (length && uppercase && lowercase && number && special) {
        passwordContainer.classList.add("valid-border");
        passwordError.textContent = "";
      } else {
        password.classList.remove("valid-border");
        passwordContainer.classList.remove("valid-border");
      }
    });

    form.addEventListener("submit", function (e) {
      const val = password.value;
      const length = val.length >= 8;
      const uppercase = /[A-Z]/.test(val);
      const lowercase = /[a-z]/.test(val);
      const number = /[0-9]/.test(val);
      const special = /[!@#$%^&*]/.test(val);

      if (!(length && uppercase && lowercase && number && special)) {
        e.preventDefault();
        passwordError.textContent = "Password must meet all the requirements above.";
      }
    });

    function updateRule(element, isValid) {
      element.className = isValid ? "valid" : "invalid";
    }

    const toggleBtn = document.getElementById('togglePassword');
    toggleBtn.addEventListener('click', () => {
      const type = password.type === 'password' ? 'text' : 'password';
      password.type = type;
      toggleBtn.innerHTML = type === 'password'
        ? '<i class="fas fa-eye"></i>'
        : '<i class="fas fa-eye-slash"></i>';
    });
  </script>
</body>
</html>
