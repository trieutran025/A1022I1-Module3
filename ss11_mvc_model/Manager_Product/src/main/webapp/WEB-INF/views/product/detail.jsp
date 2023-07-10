<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Detail</title>
    <style>
        table{
            border: 1px solid black;
        }
        tr,th,td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1>View Detail</h1>
    <table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Date release</th>
        <th>Category</th>
    </tr>
    <tr>
        <td>${products.getId()}</td>
        <td>${products.getName()}</td>
        <td>${products.getQuantity()}</td>
        <td>${products.getPrice()}</td>
        <td>
            <fmt:formatDate value="${products.getDateRelease()}" pattern="dd/MM/yyyy"></fmt:formatDate>
        </td>
        <td>${requestScope["products"].category.name}</td>
    </tr>
    </table>
</body>
</html>
