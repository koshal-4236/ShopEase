<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    

<jsp:include page="Navbar.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Shopease | Home</title>
  <link rel="stylesheet" href="css/home.css">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

  <!-- Hero Banner -->
  <section class="hero-section">
    <img class="hero-image" src="./image/homebackground.jpg" alt="Mac for Students">
    <div class="hero-overlay">
        <h1>Welcome to Shopease</h1>
        <p>Your one-stop destination for the latest gadgets, top brands, and unbeatable deals.</p>
        <a href="#smartphones" class="hero-btn">Start Shopping</a>
   </div>     
        
  </section>

  <!-- Product Sections -->
  <section class="section animate" id="smartphones">
    <h2>Smartphones</h2>
    <div class="product-grid">
      <div class="product-card"><img src="./image/16pro.jpg" alt=""><h3>iPhone 16 Pro</h3><p>₹1,29,900</p></div>
      <div class="product-card"><img src="./image/s24.jpg" alt=""><h3>Samsung S24 Ultra</h3><p>₹1,19,000</p></div>
      <div class="product-card"><img src="./image/onplus12.jpg" alt=""><h3>OnePlus 13</h3><p>₹69,999</p></div>
      <div class="product-card"><img src="./image/googlepixel.jpg" alt=""><h3>Google Pixel 9 pro</h3><p>₹75,000</p></div>
    </div>
  </section>

  <section class="section animate" id="laptops">
    <h2>Laptops</h2>
    <div class="product-grid">
      <div class="product-card"><img src="./image/applemackbook.jpg" alt=""><h3>MacBook Pro M3</h3><p>₹1,99,000</p></div>
      <div class="product-card"><img src="./image/dellxps.jpg" alt=""><h3>Dell XPS</h3><p>₹1,49,999</p></div>
      <div class="product-card"><img src="./image/asusrog.jpg" alt=""><h3>Asus ROG</h3><p>₹1,29,000</p></div>
      <div class="product-card"><img src="./image/hplaptop.jpg" alt=""><h3>HP Spectre</h3><p>₹1,09,000</p></div>
    </div>
  </section>

  <section class="section animate" id="headphones">
    <h2>Headphones</h2>
    <div class="product-grid">
      <div class="product-card"><img src="./image/appleAirpods.jpg" alt=""><h3>AirPods Pro 2</h3><p>₹24,900</p></div>
      <div class="product-card"><img src="./image/boat.jpg" alt=""><h3>Boat Rockerz</h3><p>₹2,999</p></div>
      <div class="product-card"><img src="./image/sony.jpg" alt=""><h3>Sony WH-1000XM5</h3><p>₹29,990</p></div>
      <div class="product-card"><img src="./image/jbl.jpg" alt=""><h3>JBL Tune 750</h3><p>₹5,499</p></div>
    </div>
  </section>

  <section class="section animate" id="smartwatches">
    <h2>Smartwatches</h2>
    <div class="product-grid">
      <div class="product-card"><img src="./image/applewatch.jpg" alt=""><h3>Apple Watch 9</h3><p>₹44,990</p></div>
      <div class="product-card"><img src="./image/samsungwatch.jpg" alt=""><h3>Galaxy Watch</h3><p>₹25,999</p></div>
      <div class="product-card"><img src="./image/noisewatch.jpg" alt=""><h3>Noise Colorfit</h3><p>₹2,999</p></div>
      <div class="product-card"><img src="./image/firebolt.jpg" alt=""><h3>Fire-Boltt Ninja</h3><p>₹3,499</p></div>
    </div>
  </section>

  <section class="section animate" id="playstation">
    <h2>PlayStation</h2>
    <div class="product-grid">
      <div class="product-card"><img src="./image/ps5.jpg" alt=""><h3>PS5 Disc Edition</h3><p>₹54,990</p></div>
      <div class="product-card"><img src="./image/dualsense.jpg" alt=""><h3>DualSense Controller</h3><p>₹5,990</p></div>
      <div class="product-card"><img src="./image/ps5vr.jpg" alt=""><h3>PS VR2 Headset</h3><p>₹49,990</p></div>
      <div class="product-card"><img src="./image/spiderman.jpg" alt=""><h3>Spider-Man 2</h3><p>₹4,999</p></div>
    </div>
  </section>

  <!-- Counters -->
  <section class="section counters-section animate">
    <h2>Why Choose Shopease?</h2>
    <div class="counters">
      <div><h3><span class="count" data-target="50000">0</span>+</h3><p>Happy Customers</p></div>
      <div><h3><span class="count" data-target="1000">0</span>+</h3><p>Top Products</p></div>
      <div><h3><span class="count" data-target="100">0</span>+</h3><p>Brands</p></div>
    </div>
  </section>

  <!-- Newsletter -->
  <section class="newsletter animate">
    <h2>Subscribe for Updates</h2>
    <p>Get the latest deals and updates straight to your inbox.</p>
    <form id="newsletter-form">
      <input type="email" placeholder="Enter your email" required />
      <button type="submit">Subscribe</button>
    </form>
  </section>

  <!-- Testimonials -->
  <section class="testimonial-section animate">
    <h2>What Our Customers Say</h2>
    <div class="testimonial-grid">
      <div class="testimonial-card"><p>"The best shopping experience I've ever had! Highly recommend!"</p><h4>- John Doe</h4></div>
      <div class="testimonial-card"><p>"Amazing products and fast delivery. Will shop again!"</p><h4>- Jane Smith</h4></div>
      <div class="testimonial-card"><p>"Great customer service and fantastic deals!"</p><h4>- Alex Johnson</h4></div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="Footer.jsp" />

  <script>
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("show");
        }
      });
    }, { threshold: 0.15 });

    document.querySelectorAll(".animate").forEach(section => {
      observer.observe(section);
    });

    const counters = document.querySelectorAll('.count');
    let started = false;
    window.addEventListener('scroll', () => {
      const trigger = document.querySelector('.counters-section');
      if (!started && trigger.getBoundingClientRect().top < window.innerHeight) {
        counters.forEach(counter => {
          const update = () => {
            const target = +counter.getAttribute('data-target');
            const current = +counter.innerText;
            const increment = target / 150;
            if (current < target) {
              counter.innerText = Math.ceil(current + increment);
              setTimeout(update, 10);
            } else {
              counter.innerText = target;
            }
          };
          update();
        });
        started = true;
      }
    });

    document.getElementById('newsletter-form').addEventListener('submit', e => {
      e.preventDefault();
      alert("Thanks for subscribing!");
    });
  </script>
</body>
</html>
