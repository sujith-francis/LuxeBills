<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Sign In</title>
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
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .blur-box {
      width: 400px;
      height: 400px;
      background-color: rgba(0, 0, 0, 0.7);
      color: #fff;
      padding: 20px;
      backdrop-filter: blur(10px);
      border-radius: 20px;
    }

    h1 {
      font-size: 24px;
      margin-top: 0;
    }

    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .form-group {
      margin-bottom: 20px;
      width: 100%;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      border: none;
      border-radius: 5px;
      background-color: rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
      color: #fff;
    }

    .button {
      background-color: #242B2E;
      border: none;
      color: white;
      padding: 12px 24px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      cursor: pointer;
      border-radius: 20px;
      backdrop-filter: blur(10px); 
    }

    .link-container {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    .link {
      color: #fff;
      text-decoration: none;
      font-size: 14px;
    }

  </style>
</head>
<body>
<nav class="navbar">
    <a href="./home">Home</a>
  
    <a href="#">Contact</a>
  </nav>
  <div class="container">
    <div class="blur-box">
      <h1>Sign In to LuxeBills</h1>
      <form  action="./login" method="POST">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" placeholder="User Mail" name="usermail" required>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" placeholder="password" name="password" required>
        </div>
        <button type="submit" class="button">Sign In</button>
      </form>
      <div class="link-container">
        <a href="#" class="link">Forgot password?</a>
        <a href="buySubscription" class="link">Buy Subscription</a>
      </div>
    </div>
  </div>
</body>
</html>
