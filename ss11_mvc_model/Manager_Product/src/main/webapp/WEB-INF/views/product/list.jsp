<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Product</title>

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
<h1>List Product</h1>
<button ><a href="/product?action=create" style="text-decoration: none">Add new product</a></button>

<form method="post"action="/product">
    <input type="text"name="name">
    <input type="submit"value="Find">
    <input type="hidden" name="action" value="search">
</form>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Date release</th>
        <th>Category</th>
    </tr>
    <c:forEach items="${products}" var="p">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.quantity}</td>
            <td>${p.price}</td>
            <td>
                <fmt:formatDate value="${p.dateRelease}" pattern="dd/MM/yyyy"></fmt:formatDate>
            </td>
            <td>${p.category.name}</td>
            <td><button ><a href="/product?action=delete&id=${p.id}" style="text-decoration: none">Delete product</a></button></td>
            <td><button><a href="/product?action=detail&id=${p.id}" style="text-decoration: none">Detail</a></button></td>
            <td><button ><a href="/product?action=update&id=${p.id}" style="text-decoration: none">Edit</a></button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
