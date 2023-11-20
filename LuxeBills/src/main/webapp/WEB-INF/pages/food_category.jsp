<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
  .card {
      width: 90px;
      height: 60px;
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
      width: 200px;
      height: 100px;
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
function sendRequest(foodCategory) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
    	var parentDocument = window.parent.document;

        var frame2 = parentDocument.getElementById("foodss");

        frame2.contentWindow.document.open();
        frame2.contentWindow.document.write(xhr.responseText);
        frame2.contentWindow.document.close();
    }
  };

  xhr.open("GET", "./fetchFoods?foodCategory=" + foodCategory, true);
  xhr.send();
  
}

	</script>

<body>
<div class="card" onclick="sendRequest('Beverages')">
        <h2>Beverages</h2>
</div>
<div class="card" onclick="sendRequest('Appetizers')">
        <h2>Appetizer</h2>
</div>
<div class="card" onclick="sendRequest('Snack')">
        <h2>Snack</h2>
</div>
<div class="card" onclick="sendRequest('Starter')">
        <h2>Starter</h2>
</div>
<div class="card" onclick="sendRequest('Main Course')">
        <h2>Main Course</h2>
</div>
<div class="card" onclick="sendRequest('Desserts')">
        <h2>Desserts</h2>
</div>
<div class="card" onclick="sendRequest('Others')">
        <h2>Others</h2>
</div>

</body>
</html>