<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

th, td {
  text-align: left;
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #f5f5f5;
}
.bill-name,p {
  font-weight: bold;
  font-size: 24px;
  color: white;
}

.bill-info {
  font-size: 18px;
  color: #555;
  margin-left: 20px;
}
.bill-box {
  display: inline-block;
  background-color: #008080;
  color: white;
  padding: 8px;
  border-radius: 4px;
}
.th-label {
  font-weight: bold;
  margin-right: 5px;
  color: #008080;
}

.th-value {
  color: black;
}




</style>

</head>
<script>
  if(top.location != self.location){
  	top.location.href = self.location.href;
  }
  </script>
<body>
	<header class="header">
		<div class="header-left">LuxeBills</div>
		<nav class="navbar">
			<ul>
				<li><a href="./home">Home</a></li>
				<li><a href="./live">Live</a></li>
			</ul>
		</nav>
		<div class="header-right">
			<div id="clock">
				<%=new java.util.Date()%>
			</div>
		</div>
	</header>
<c:forEach items="${bills}" var="bill">
<table>
				<tr>
					<th>
  <div class="bill-box">
    <span class="bill-id">Bill ID:${bill.id}</span>
  </div>
  <span class="bill-info">
    
    <span class="th-label">Bill Date:</span>
    <span class="th-value">${bill.billDate}</span>
    <span class="th-label">Cost:</span>
    <span class="th-value">${bill.cost}</span>
    <span class="th-label">Payment Mode:</span>
    <span class="th-value">${bill.paymentMode}</span>
  </span>
</th>
</tr>
</table>

	</c:forEach>

</body>
</html>
