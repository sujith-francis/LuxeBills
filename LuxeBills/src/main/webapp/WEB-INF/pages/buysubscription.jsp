<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Subscription</title>
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
  <style>
  body {
      margin: 0; 
      padding: 0; 
      background-image: url("${pageContext.request.contextPath}/resources/images/homebg.jpeg");
      background-size: cover;
      background-position: center;
      backdrop-filter: blur(3px); 
      height: 100vh;
      overflow: hidden; 
    }

    .navbar {
      background-color: rgba(0, 0, 0, 0.7); 
      color: #fff;
      padding: 15px;
      position: absolute; 
      top: 0; 
      width: 100%; 
      
    }

    .navbar a {
      color: #fff;
      text-decoration: none;
      margin-right: 10px;
      font-size: 18px; 
    }

    .navbar a:hover {
      text-decoration: wavy;
    }
    

    .container {
      text-align: center;
      padding-top: 50px;
      padding: 100px;
    }

    .cards-container {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .card {
      width: 300px;
      height: 180px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      padding: 20px;
      margin: 20px;
      display: inline-block;
      cursor: pointer;
    }
    .card:hover {
      transform: translateY(-20px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    }

    .card.rectangular {
      width: 400px;
      height: 200px;
    }

    .card:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('homebg.jpeg');
      background-size: cover;
      background-position: center;
      filter: blur(5px);
      z-index: -1;
    }

    .plan {
      text-align: center;
      margin-bottom: 10px;
      font-size: 24px;
      font-weight: bold;
    }

    .price {
      text-align: center;
      margin-bottom: 20px;
      font-size: 18px;
    }
  </style>
</head>
<body>
  <nav class="navbar">
    <a href="./home">Home</a>
    <a href="login">Login</a>
    <a href="#">Contact</a>
  </nav>
  <div class="container">
    <h1>Choose Your Subscription Plan</h1>
    <div class="cards-container">
      <div class="card" onclick="sendSubscriptionRequest('3months')">
        <h2>3 Months Subscription</h2>
        <p>Price: $30</p>
        <p>Benefits: Access to all premium features</p>
      </div>
      <div class="card" onclick="sendSubscriptionRequest('6months')">
        <h2>6 Months Subscription</h2>
        <p>Price: $50</p>
        <p>Benefits: Priority customer support and early access to new features</p>
      </div>
      <div class="card" onclick="sendSubscriptionRequest('12months')">
        <h2>12 Months Subscription</h2>
        <p>Price: $80</p>
        <p>Benefits: Exclusive discounts, personalized recommendations, and extended subscription validity</p>
      </div>
    </div>
    <script>
      function sendSubscriptionRequest(subscriptionType) {
        const url = './getSubscription?subscriptionduration=' + encodeURIComponent(subscriptionType);

        window.location.href = url;
      }
    </script>
  </div>
</body>
</html>
