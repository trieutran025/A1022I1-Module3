<%--
  Created by IntelliJ IDEA.
  User: Trieu
  Date: 6/30/2023
  Time: 5:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Discount Calculator</title>
</head>
<body>
    <h1>Discount Calculator</h1>
    <form action="/amount" method="post">
        List Price: <input type="text" name="price"><br>
        Discount Percent: <input type="text" name="percent"><br>
        <input type="submit"value="Calculate Discount">
    </form>
</body>
</html>
