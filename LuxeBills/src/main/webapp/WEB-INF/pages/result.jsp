<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
  <title>LuxeBills - Café Bill Management</title>
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
      margin-left: 35%;
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
<script>
  setTimeout(function() {
    window.location.href = "./home";
  }, 2500); 
</script>

<body>
 
 
  <div class="container">
    <div class="blur-box">
      <h1>LukeBills</h1>
      <p>${message}</p>
    </div>
    
  </div>
</body>
</html>
