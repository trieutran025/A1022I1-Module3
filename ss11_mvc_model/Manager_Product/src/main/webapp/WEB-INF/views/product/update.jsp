<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <form action="/product" method="post">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id"value="${products.getId()}"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${products.getName()}"></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input type="text" name="quantity"value="${products.getQuantity()}"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price"value="${products.getPrice()}"></td>
            </tr>
            <tr>
                <td>Date release</td>
                <td><input type="text"name="dateRelease"value="<fmt:formatDate value="${products.getDateRelease()}" pattern="dd/MM/yyyy"></fmt:formatDate>"></td>
            </tr>
            <tr>
                <td>Category</td>
                <td>
                    <select name="categoryId">
                        <option value="${products.category.id}">${products.category.name}</option>
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="update">
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="update">
    </form>
</head>
<body>
</body>
</html>
