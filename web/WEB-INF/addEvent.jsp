<%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 01.09.2022
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add event</title>
</head>
<body>
<h1> Please input event`s data:</h1>
<form action="/events/add" method="post">
    <input type="text" name="name" placeholder="Please inpute event name"/><br>
    <input type="text" name="place" placeholder="Please inpute event place"/><br>
    <input type="number" name="price" placeholder="Please input price"><br>
    Is Online ? <br>
    Yes <input type="radio" name="isOnline" value="TRUE">
    NO <input type="radio" name="isOnline" value="FALSE"> <br>
    Event Type
    <select name="eventType">
        <option value="FILM"> FILM</option>
        <option value="SPORT"> SPROT</option>
        <option value="GAME"> GAME</option>
    </select> <br>
    Event Date
    <input type="date" name="eventDate"><br>
    <input type="submit" value="ADD">

</form>


</body>
</html>
