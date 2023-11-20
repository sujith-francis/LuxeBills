<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<input type="hidden" id="objectId" value="${newbill.id}" />
	<form action="./closebill" id="bill-form" method="post"
		onsubmit=" return openPopup();">
		<input type="hidden" name="id" value="${newbill.id}"> <input
			type="hidden" name="tableNo" value="${newbill.tableNo}"> <input
			type="hidden" name="status" value="${newbill.status}">
		<table>
			<tr>
				<th>Qty</th>
				<th>Order</th>
				<th>Amount</th>
				<th>Action</th>
			</tr>
			<c:forEach var="foodEntry" items="${newbill.food}">
				<c:set var="foodName" value="${foodEntry.key}" />
				<c:set var="foodData" value="${foodEntry.value}" />

				<tr>
					<td><input type="number" id="quantity"
						name="food['${foodName}'].quantity" min="1"
						value="${foodData.quantity}" oninput="calculateAmount(this)"></td>
					<td><input type="hidden" name="food['${foodName}'].foodName"
						value="${foodData.foodName}">${foodData.foodName}</td>
					<td><span id="amount">${foodData.foodPrice * foodData.quantity}</span><input
						type="hidden" id="total" name="food['${foodName}'].foodPrice"
						value="${foodData.foodPrice}"></td>
					<td class="remove-button" onclick="removeRow(this)">X</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="Bill">
	</form>

	<script>
	 function calculateAmount(input, foodName) {
	      var quantity = input.value;
	      var amountElement = input.parentNode.nextElementSibling.nextElementSibling.firstElementChild;
	      var hiddenAmountInput = input.parentNode.nextElementSibling.nextElementSibling.lastElementChild;
	      var hiddenAmount = parseFloat(hiddenAmountInput.value);
	      var totalAmount = 0.0;

	        totalAmount = quantity * hiddenAmount;
	      

	      amountElement.textContent = totalAmount;
	     
	    }

		function removeRow(button) {
			var row = button.parentNode;
			var table = row.parentNode;
			table.removeChild(row);
		}
		function openPopup() {


			if (window.confirm('Are you sure you want to submit the form?')) {

				
				var form = document.getElementById('bill-form');
				form.submit();

				return false;
			} else {
				return false;
			}
		}
	</script>

</body>
</html>