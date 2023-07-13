<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>Users Manager</h1>
    <h2><a href="/users?action=list">List All Users</a></h2>
</center>
<div align="center">
    <form method="post" action="/users?action=delete&id=${users.id}">
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>${users.id}</td>
                <td>${users.name}</td>
                <td>${users.email}</td>
                <td>${users.country}</td>
                <td colspan="2" align="center">
                    <input type="submit" value="delete"/>
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="delete">
    </form>
</div>
</body>
</html>
