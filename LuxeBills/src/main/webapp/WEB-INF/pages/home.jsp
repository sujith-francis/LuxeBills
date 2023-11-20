<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Café Bill Management</title>
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
  <style>
    body{
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
    .blur-box {
      width: 400px; 
      height: 400px; 
      background-color: rgba(0, 0, 0, 0.7);
      color: #fff;
      padding: 20px;
      backdrop-filter: blur(10px);
      border-radius: 20px;
      margin-left: auto;
    }


    h1 {
      text-align: center;
      font-size: 48px;
      color:#CAD5E2;
      margin-bottom: 20px;
    }
    p {
      text-align: center;
      font-size: 32px;
      color:#CAD5E2;
      margin-bottom: 20px;
    }

   
  </style>
</head>
<body>
  <nav class="navbar">
    
    <a href="login">Login</a>
    <a href="buySubscription">Buy</a>
    <a href="#">Contact</a>
  </nav>
 
  <div class="container">
    <div class="blur-box">
      <h1>LuxeBills</h1>
      <p>Savor the Love Blend of Coffee and Bills</p>
    </div>
    
  </div>
</body>
</html>
