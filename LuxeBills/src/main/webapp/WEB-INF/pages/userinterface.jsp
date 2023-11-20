<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuxeBills</title>
   <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"  type="image/x-icon">
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
      
      #menu__toggle {
  opacity: 0;
}
#menu__toggle:checked + .menu__btn > span {
  transform: rotate(45deg);
}
#menu__toggle:checked + .menu__btn > span::before {
  top: 0;
  transform: rotate(0deg);
}
#menu__toggle:checked + .menu__btn > span::after {
  top: 0;
  transform: rotate(90deg);
}
#menu__toggle:checked ~ .menu__box {
  left: 0 !important;
}
.menu__btn {
  position: fixed;
  top: 25px;
  left: 20px;
  width: 35px;
  height: 26px;
  cursor: pointer;
  z-index: 1;
}
.menu__btn > span,
.menu__btn > span::before,
.menu__btn > span::after {
  display: block;
  position: absolute;
  width: 100%;
  height: 2px;
  background-color: #616161;
  transition-duration: .25s;
}
.menu__btn > span::before {
  content: '';
  top: -8px;
}
.menu__btn > span::after {
  content: '';
  top: 8px;
}
.menu__box {
  display: block;
  position: fixed;
  top: 0;
  left: -100%;
  width: 300px;
  height: 100%;
  margin: 0;
  padding: 80px 0;
  list-style: none;
  background-color: rgba(236, 239, 241, 0.9);
  box-shadow: 2px 2px 6px rgba(0, 0, 0, .4);
  transition-duration: .25s;
}
.menu__box ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }
.menu__item {
  display: block;
  padding: 12px 24px;
  color: #333;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  font-weight: 600;
  text-decoration: none;
  transition-duration: .25s;
}
.menu__item:hover {
  background-color: #82d2f5;
}
      
      .logo {
        color: #fff;
        font-size: 42px;
        margin-left: 40px;
        
      }
      .heading {
        position: fixed;
        top: 16%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #fff;
        font-size: 60px;
        font-weight: bold;
        text-align: center;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      }
       .welcome {
        position: fixed;
        top: 25px;
        right: 85px;
            color: #fff;
            font-size: 28px;
            cursor: pointer;
        }
      .profile-picture {
        position: fixed;
        top: 10px;
        right: 16px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        border: 2px solid #fff;
        overflow: hidden;
        cursor: pointer;
      }
      
       .profile-picture img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
      }
      .profile-options {
      position: fixed;
      top: 80px;
      right: 40px;
      background-color: #fff;
      border-radius: 5px;
      padding: 15px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
      display: none;
      width: auto;
      height: auto;
    }

    .profile-options ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      text-align: center;
    }

    .profile-options li {
      margin-bottom: 12px;
    }

    .profile-options a {
      color: #333;
      text-decoration: none;
      font-family: 'Roboto', sans-serif;
      font-size: 16px;
    }
   

 
    </style>
</head>

<body>
  <input id="menu__toggle" type="checkbox" />
  <label class="menu__btn" for="menu__toggle">
    <span></span>
  </label>
  <span class="logo">LuxeBills</span>

  <div class="menu__box">
    <ul>
      <li><a class="menu__item" href="./home">Home</a></li>
      <li><a class="menu__item" href="./live">Live</a></li>
      <li><a class="menu__item" href="./foods">Food Items</a></li>
      <li><a class="menu__item" href="#">Tables</a></li>
      <li><a class="menu__item" href="./history">History</a></li>
      <li><a class="menu__item" href="#">Contact</a></li>
    </ul>
  </div>
  <h1 class="heading"> ${user.shopName}</h1>
    <div class="welcome" onclick="toggleProfileOptions()">${user.userName}</div>
  <div class="profile-picture">
     <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.profile)}"alt="Profile Picture"  > 
  </div>
 

  <div class="profile-options" id="profileOptions">
    
    <ul>
      <li><a href="#">Profile</a></li>
      <li><a href="./logout">Logout</a></li>
    </ul>
  </div>

  <script>
  if(top.location != self.location){
  	top.location.href = self.location.href;
  }
  function toggleProfileOptions() {
      var profileOptions = document.getElementById("profileOptions");
      profileOptions.style.display = (profileOptions.style.display === "block") ? "none" : "block";
    }
  </script>
</body>
</html>
