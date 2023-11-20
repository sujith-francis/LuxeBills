<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Subscription Details</title>
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
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .blur-box {
      width: 400px; 
      height: 490px; 
      background-color: rgba(0, 0, 0, 0.7);
      color: #fff;
      padding: 20px;
      backdrop-filter: blur(10px);
      border-radius: 20px;
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
    
    
    h1 {
      text-align: center;
      font-size: 24px;
      color: #CAD5E2;
      margin-bottom: 20px;
    }
    input[type="email"],
    input[type="password"],
    input[type="text"],
    input[type="file"] {
      width: 100%;
      max-width: 380px;
      padding: 8px;
      margin-bottom: 10px;
      border-radius: 5px;
    }
    .upload-text {
      color: #CAD5E2;
      font-size: 20px;
      margin-bottom: 5px;
    }
    .upload-field {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }
    .upload-field input[type="file"] {
      flex-grow: 1;
      padding: 8px;
    }
    .subscription-plan {
      text-align: center;
      margin-bottom: 20px;
      font-size: 18px;
      color: #CAD5E2;
    }
    .button-container {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
    .submit-button {
      display: block;
      width: 100%;
      max-width: 70px;
      padding: 8px;
      margin-top: 10px;
      border: none;
      border-radius: 5px;
      background-color: #758283;
      color: #fff;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      font-size: 16px;
      order: 2;
    }
    .cancel-button {
      display: block;
      width: 100%;
      max-width: 50px;
      padding: 8px;
      margin-top: 10px;
      border: none;
      border-radius: 5px;
      background-color: #f44336;
      color: #fff;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      font-size: 16px;
      order: 1;
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

      <h1>Subscription Details</h1>
      <form action="./subscribe" method="post" enctype="multipart/form-data" >
        <input type="email" name="usermail" placeholder="Email" required >
        <input id="password" name="password" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" placeholder="Password" required>

<input id="password_two" name="password_two" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Confirm Password" required>
 <input type="text" name="userName" placeholder="User Name" required>
 <input type="text" name="shopName" placeholder="Shop Name" required>
        <input type="hidden" name="subscriptionduration" value="${subscriptionduration_value}">
        <input type="hidden" name="subscribedDateAndTime" value="<%=LocalDateTime.now() %>">
        <div class="upload-field">
            <label class="upload-text">ShopCertificate:</label>
          <input type="file" name="shopcertificate" accept="application/pdf" required>
          <small class="file-limit">(File size should be less than 5MB)</small>
        </div>
        
        <div class="upload-field">
          <label class="upload-text">Profile:</label>
          <input type="file" name="profile" accept="image/*" required>
          <small class="file-limit">(File size should be less than 5MB)</small>
        </div>
        <p class="subscription-plan">Subscription Plan: ${subscriptionduration_value} Months Subscription</p>
        <div class="button-container">
        <button type="submit" class="submit-button">Submit</button>
        <a href="./home" class="cancel-button">Cancel</a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
