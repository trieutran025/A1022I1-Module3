<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<form method="post" action="/product">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id"value="${products.getId()}"readonly></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${products.getName()}"readonly></td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td><input type="text" name="quantity"value="${products.getQuantity()}"readonly></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="text" name="price"value="${products.getPrice()}"readonly></td>
        </tr>
        <tr>
            <td>Date release</td>
            <td><input type="text"name="dateRelease"value="<fmt:formatDate value="${products.getDateRelease()}" pattern="dd/MM/yyyy"></fmt:formatDate>"readonly></td>
        </tr>
        <tr>
            <td>Category</td>
            <td>
                <select name="categoryId">
<%--                    <c:forEach items="${categories}" var="c">--%>
                        <option value="${products.category.id}">${products.category.name}</option>
                </select>
<%--            <td><input type="text"value="${products.category.getName()}"readonly></td>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="delete">
            </td>
        </tr>
        <input type="hidden" name="action" value="delete">
    </table>
</form>
</body>
</html>
