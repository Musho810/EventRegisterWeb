<%@ page import="model.Event" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 03.09.2022
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Event</title>
</head>
<body>
<%
    Event event = (Event) request.getAttribute("event");
    List<Event> events = (List<Event>) request.getAttribute("events");

%>

<h1> Please edit event`s data:</h1>
<form action="/events/edit" method="post">
    <input type="hidden" name="eventId" value="<%=event.getId()%>"/>
    <input type="text" name="name" value="<%=event.getName()%>"/><br>
    <input type="text" name="place" value="<%=event.getPlace()%>"/><br>
    <input type="number" name="price" value="<%=event.getPrice()%>"/><br>
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
    <input type="submit" value="UpDate">

</form>

</body>
</html>
