<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <h2><a href="/users?action=list">List All Users</a></h2>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th colspan="3">Action</th>
        </tr>
        <c:forEach items="${users}" var="us">
            <tr>
                <td>${us.id}</td>
                <td>${us.name}</td>
                <td>${us.email}</td>
                <td>${us.getCountry()}</td>
                <td><a href="/users?action=detail&id=${us.id}">detail</a></td>
                <td><a href="/users?action=edit&id=${us.id}">Edit</a></td>
                <td><a href="/users?action=delete&id=${us.id}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
