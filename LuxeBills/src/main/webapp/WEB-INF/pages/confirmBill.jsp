<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<style>
  table {
    border-collapse: collapse;
    width: 50%;
    margin: 50px auto;
  }
  th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
  }
  th {
    background-color: #f2f2f2;
  }
  input[type="number"] {
    width: 50px;
    text-align: center;
  }
  .remove-button {
    color: red;
    cursor: pointer;
  }
</style>
</head>
<body>
<h2>Table::${newbill.tableNo}</h2>
<hr>
<form:form  action="./paybill" id="bill-form" method="post" modelAttribute="bill" >
<form:hidden path="id" value="${newbill.id}"/>
<form:hidden  path="tableNo" value="${newbill.tableNo}"/>
<form:hidden  path="status" value="payed"/>
<form:hidden  path="usermail" value="${user.usermail}"/>
    <table>
      <tr>
        <th>Qty</th>
        <th>Order</th>
        <th>Amount</th>
      </tr>
     <c:forEach var="foodEntry" items="${newbill.food}">
      <c:set var="foodName" value="${foodEntry.key}" />
      <c:set var="foodData" value="${foodEntry.value}" />
      
      <tr>
        <td><form:hidden  path="food['${foodName}'].quantity" value="${foodData.quantity}" readonly="readonly"/>${foodData.quantity}</td>
        <td><form:hidden path="food['${foodName}'].foodName" value="${foodData.foodName}"/>${foodData.foodName}</td>
        <td><span id="amount">${foodData.foodPrice}</span><form:hidden  path="food['${foodName}'].foodPrice" value="${foodData.foodPrice}"/></td>
      </tr>
      </c:forEach>
      
    </table>
      <span id="total">Total::${newbill.cost}</span> <form:hidden path="cost" value="${newbill.cost}"/>  <br>
    <label for="paymentMode">Payment Mode:</label>
  <select name="paymentMode" id="paymentMode">
    <option value="UPI">UPI</option>
    <option value="Cash">Cash</option>
    <option value="Credit Card">Credit Card</option>
    <option value="Debit Card">Debit Card</option>
    <!-- Add more payment options as needed -->
  </select>
    <input type="submit" value="Pay" >
  </form:form>
  <form action="./cancelbill" method="post" >
   <input type="hidden" name="id" value="${newbill.id}"/>
  <input type="submit" value="cancel">
  </form>

 </body> 
</html>