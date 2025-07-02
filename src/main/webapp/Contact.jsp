<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="Navbar.jsp" />
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us - Shopease</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="css/contact.css" />

</head>
<body>

 
  
  <div class="heading"><i class="fas fa-envelope-open-text"></i> Get in Touch</div>

  
  <section class="contact-container">
    <div class="contact-left">
      <h2>Contact Us</h2>
      <p>Feel free to use the form or drop us an email. Old-fashioned phone calls work too.</p>
      <div class="contact-info">
        <p><i class="fas fa-phone-alt"></i> 484.324.2400</p>
        <p><i class="fas fa-envelope"></i> info@shopease.com</p>
        <p><i class="fas fa-map-marker-alt"></i> 15 West 3rd St. Media, PA 19063</p>
      </div>
    </div>

    <div class="contact-right">
      <form id="contactForm" method="post" action="send-contact">
        <div class="form-row">
          <input type="text" name="firstName" placeholder="firstName" required>
          <input type="text" name="lastName" placeholder="lastName" required>
        </div>
        <input type="email" name="email" placeholder="example@email.com" required>
        <input type="tel" name="phone" placeholder="xxx-xxx-xxxx">
        <textarea name="message" placeholder="Type your message ..." required></textarea>
        <button type="submit">Submit</button>
        <div class="success-animation" id="successAnimation">
          <div class="checkmark"></div>
          <p><i class="fas fa-check-circle"></i> Message sent!</p>
        </div>
      </form>
    </div>
  </section>

  

  <script>
    document.getElementById("contactForm").addEventListener("submit", function(e) {
     
      const success = document.getElementById("successAnimation");
      success.style.display = "flex";
      setTimeout(() => {
        success.style.display = "none";
      }, 5000);
    });
  </script>

</body>
</html>
<jsp:include page="Footer.jsp" />
