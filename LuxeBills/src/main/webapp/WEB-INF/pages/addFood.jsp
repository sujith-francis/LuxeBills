<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Café Bill Management</title>
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
  <style>
    body {
      margin: 0; 
      padding: 0; 
      background-image: url("${pageContext.request.contextPath}/resources/images/billbg.jpg");
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
    label {
      font-size: 18px;
    }

    select#foodCategory {
      font-size: 16px;
    }
 
    input[type="text"],
    input[type="number"] {
      width: 100%;
      max-width: 380px;
      padding: 8px;
      margin-bottom: 10px;
      border-radius: 5px;
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
      <h1>Food Details</h1>
      <form:form action="./submitfood" method="post" enctype="multipart/form-data" modelAttribute="food" >
      <form:hidden path="id"/> 
        <label for="foodName">Food Name:</label>
    <form:input type="text" id="foodName" path="foodName" /><br><br>

    <label for="foodCategory">Food Category:</label>
    <form:select id="foodCategory" path="foodCategory" >
      <form:option value="Beverages">Beverages</form:option>
      <form:option value="Appetizers">Appetizer</form:option>
      <form:option value="Snack">Snack</form:option>
      <form:option value="Starter">Starter</form:option>
      <form:option value="Main Course">Main Course</form:option>
      <form:option value="Desserts">Desserts</form:option>
      <form:option value="Others">Others</form:option>
    </form:select><br><br>

    <label for="foodPrice">Food Price:</label>
    <form:input type="number" step="0.01" id="foodPrice" path="foodPrice" /><br><br>

       
       
        <div class="button-container">
        <form:button type="submit" class="submit-button">Submit</form:button>
        <a href="./home" class="cancel-button">Cancel</a>
        </div>
      </form:form>
    </div>
  </div>
</body>
</html>
