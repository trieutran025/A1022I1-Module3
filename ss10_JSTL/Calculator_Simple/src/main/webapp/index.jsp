<%--
  Created by IntelliJ IDEA.
  User: Trieu
  Date: 7/4/2023
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator Simple</title>
</head>
<body>
<h1>Calculator</h1>
<form action="/calculate" method="post">
    <fieldset>
        <legend>Calculator:</legend>
        <table>
            <tr>
                <td>first operand:</td>
                <td><input name="first_operand" type="text"></td>
            </tr>
            <tr>
                <td>operator:</td>
                <td>
                    <select name="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input name="second_operand" type="text"></td>
            </tr>
            <tr>
                <td><input type="submit"value="calculate"></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
