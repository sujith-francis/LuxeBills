<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${user.shopName}- Foods</title>
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
      overflow-x:hidden; 
      scrollbar-color: rgba(255, 255, 255, 0.5) transparent;
    scrollbar-width: 12px;
    }
    ::-webkit-scrollbar {
    width: 12px;
  }

  ::-webkit-scrollbar-track {
    background-color: transparent; 
}
  ::-webkit-scrollbar-thumb {
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 6px;
    background-clip: padding-box;
  }

  ::-webkit-scrollbar-thumb:hover {
    background-color: rgba(255, 255, 255, 0.7);
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
    a {
  color: blue;
  text-decoration: none;
}

a:hover {
  color: red;
}



a:focus {
  outline: 2px solid orange;
}

a:active {
  color: green;
}
    

    .container {
      text-align: center;
      padding-top: 50px;
      padding: 100px;
    }

    .cards-container {
      display: flex;
      flex-wrap :wrap;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      overflow-y:hidden;
    }

    .card {
      width: 200px;
      height: 180px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      padding: 20px;
      margin: 20px;
      margin-bottom:20px;
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
          .food-options {
      position: fixed;
      top: 80px;
      right: 40px;
      background-color: #fff;
      border-radius: 5px;
      padding: 15px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
      display: none;
      width: 40px;
      height: 40px;
    }

    .food-options ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      text-align: center;
    }

    .food-options li {
      margin-bottom: 12px;
    }

    .food-options a {
      color: #333;
      text-decoration: none;
      font-family: 'Roboto', sans-serif;
      font-size: 16px;
    }
   
    
  </style>
</head>
<body>
  <nav class="navbar">
    <a href="./home">Home</a>
    <a href="./live">Live</a>
  </nav>
 
  <div class="container">
    <h1 style="color: white;">Foods</h1>
    <div class="cards-container">
    
    <c:if test="${foodItems ne null }">
    <c:forEach var="food" items="${foodItems}">
      <div class="card">
        <h2> ${food.foodName} </h2>
        <p>Price: ${food.foodPrice} </p>
        <p>Food-Category: ${food.foodCategory} </p>
        <a href="./updatefood?id=${food.id}" >Update</a> | <a href="./deletefood?id=${food.id}">Delete</a>
      </div>
    </c:forEach>
    </c:if>
     <div class="card" onclick="sendRequest()">
        <p>Add Food Item</p>
        <p style="font-size: 30px">+</p>
      </div>
    </div>
  </div>
    <script>
   
    function sendRequest() {
        var form = document.createElement('form');

        form.method = 'GET';
        form.action = './addfood'; 

        document.body.appendChild(form);

        form.submit();
      }
    </script>
    
</body>
</html>
