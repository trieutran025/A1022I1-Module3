<%--
  Created by IntelliJ IDEA.
  User: Trieu
  Date: 6/30/2023
  Time: 6:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amount Old</title>
    <% float price = Integer.parseInt(request.getParameter("price"));
        float percent = Integer.parseInt(request.getParameter("percent")); %>
    Discount Amount : <b><%=price*percent*0.01%></b>
</head>
<body>

</body>
</html>
