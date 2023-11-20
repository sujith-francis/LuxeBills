<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">

.card {
      width: 100px;
      height: 90px;
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
      background-size: cover;
      background-position: center;
      filter: blur(5px);
      z-index: -1;
    }


</style>
</head>
<script type="text/javascript">
function sendRequest(foodID) {
  var xhr = new XMLHttpRequest();
    	var parentDocument = window.parent.document;
        var frame2 = parentDocument.getElementById("bill");
        var objectId = frame2.contentWindow.document.getElementById("objectId").value;
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {


        frame2.contentWindow.document.open();
        frame2.contentWindow.document.write(xhr.responseText);
        frame2.contentWindow.document.close();

    }
  };
  xhr.open("GET", "./bill?food=" + foodID+"&billID="+objectId, true);
  xhr.send();
  
}

	</script>
<body>
<c:choose>
<c:when test="${foods ne null }">
<c:forEach var="food" items="${foods}">
<div class="card" onclick="sendRequest('${food.id}')">
   
        <p>${food.foodName} </p>
      </div>
</c:forEach>
</c:when>
<c:when test="${foods eq null}">

<h2>No Foods</h2>
</c:when>

</c:choose>
</body>
</html>