<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>${user.shopName}- Live</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico"
	type="image/x-icon">
<style>
body {
	margin: 0;
	padding: 0;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/billbg.jpg");
	background-size: cover;
	background-position: center;
	backdrop-filter: blur(3px);
	height: 100vh;
	overflow: hidden;
}

.header {
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header-left {
	font-weight: bold;
	font-size: 36px;
}

.header-right {
	font-style: italic;
	font-weight: bold;
}

.navbar ul {
	color: #fff;
	list-style: none;
	padding: 0;
	margin: 0;
}

.navbar li {
	color: #fff;
	display: inline-block;
	margin: 0 10px;
}

.navbar a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}

.navbar a:hover {
	color: #555;
}

.boxes {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.box {
	width: 150px;
	height: 150px;
	background-color: #e0e0e0;
	border-radius: 10px;
	margin: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: transform 0.2s;
	overflow: auto;
}

.box:hover {
	background-color: #ccc;
	transform: translateY(-5px);
}

.box span {
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

/* Popup styles */
.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	font-size: large;
	z-index: 1;
}

.popup {
	display: none;
	position: fixed;
	top: 48%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #7ea9c3;
	border-radius: 10px;
	padding: 20px;
	z-index: 10000;
	width: 75%;
	height: 90%;
	padding-top: 40px;
	box-sizing: border-box;
}

.content {
	flex: 1; 
	overflow: inherit; 
	height: 100%;
}


.frame-small {
	width: 200px;
	height: 580px;
}

.frame-medium {
	width: 300px;
	height: 580px;
}

.frame-large {
	width: 600px;
	height: 580px;
}
.frame-content {
border: 2px solid #333;
box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  background-color: #fff;
  overflow: auto;
}

</style>
<script>
	function createFrame(src,id) {
		var frame = document.createElement("iframe");
		frame.src = src;
		frame.id = id;
		frame.classList.add("frame-content"); 
		return frame;
	}

	  function showPopup(tableNumber) {
	    var popup = document.getElementById("popup");
	    var content = document.getElementById("content");
	    content.innerHTML = ""; 

	    var frame1 = createFrame("food_category");
	    frame1.classList.add("frame-small");
	    content.appendChild(frame1);

	    var frame2 = createFrame("food_items","foodss");
	    frame2.classList.add("frame-large");
	    content.appendChild(frame2);

	    var frame3 = createFrame("table_bill?table=" + tableNumber,"bill"); 
	    frame3.classList.add("frame-medium");
	    content.appendChild(frame3);

	    popup.style.display = "block";
	  }

	 



	function closePopup() {
		var frame = document.getElementById("bill");

		  var frameDocument = frame.contentWindow.document;


		 var form = frameDocument.getElementById("bill-form");
		    var formData = new FormData(form);

		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "./update_bill", true); 
		    xhr.onreadystatechange = function () {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		        }
		    };
		    xhr.send(formData);
		var popup = document.getElementById("popup");
		popup.style.display = "none";
	}

	setInterval(function() {
		var clockElement = document.getElementById("clock");
		var now = new Date();
		clockElement.innerHTML = now.toLocaleString();
	}, 1000);
</script>
</head>
<body>
	<header class="header">
		<div class="header-left">LuxeBills</div>
		<nav class="navbar">
			<ul>
				<li><a href="./home">Home</a></li>
				<li><a href="./foods">Food Items</a></li>
			</ul>
		</nav>
		<div class="header-right">
			<div id="clock">
				<%=new java.util.Date()%>
			</div>
		</div>
	</header>

	<div class="boxes">
		<div class="box" onclick="showPopup(1)">
			<span>Table 1</span>
		</div>
		<div class="box" onclick="showPopup(2)">
			<span>Table 2</span>
		</div>
		<div class="box" onclick="showPopup(3)">
			<span>Table 3</span>
		</div>
		<div class="box" onclick="showPopup(4)">
			<span>Table 4</span>
		</div>
		<div class="box" onclick="showPopup(5)">
			<span>Table 5</span>
		</div>
	</div>
	<div id="overlay" class="overlay"></div>
	<div id="popup" class="popup">
		<span class="close-btn" onclick="closePopup()">Close</span>
		<div id="content" class="content"></div>
	</div>

</body>
</html>
