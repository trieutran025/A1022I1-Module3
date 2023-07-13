<%--
  Created by IntelliJ IDEA.
  User: Trieu
  Date: 7/11/2023
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Users Manager</h1>
    <h2><a href="/users?action=list">List All Users</a></h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <tr>
            <td>${users.id}</td>
            <td>${users.name}</td>
            <td>${users.email}</td>
            <td>${users.country}</td>
        </tr>
    </table>
</div>
</body>
</html>
