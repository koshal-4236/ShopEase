<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Placed</title>
  <link rel="stylesheet" href="css/ordersucess.css" />
</head>
<body>
  <div class="success-container">
    <div class="checkmark-circle">
      <div class="checkmark"></div>
    </div>
    <h2>Order Placed Successfully!</h2>
    <p>Thank you for shopping with Shopease.</p>
    <div class="countdown">Redirecting to home in <span id="counter">10</span> seconds...</div>
  </div>

  <script>
    let count = 10;
    const counter = document.getElementById('counter');

    const interval = setInterval(() => {
      count--;
      counter.textContent = count;

      if (count === 0) {
        clearInterval(interval);
        // Use window.location.replace to prevent user from going "back" to success page
        window.location.replace("clear-cart");
      }
    }, 1000);
  </script>
</body>
</html>
