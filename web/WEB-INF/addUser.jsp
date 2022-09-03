<%@ page import="model.Event" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 01.09.2022
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
</head>
<body>
<% List<Event> events = (List<Event>) request.getAttribute("events");

%>

<h1> Please input user`s data:</h1>
<form action="/users/add" method="post">
    <input type="text" name="name" placeholder="Please inpute user name"/><br>
    <input type="text" name="surname" placeholder="Please inpute user surname"/><br>
    <input type="text" name="email" placeholder="Please inpute user email"/><br>
    Event ID
    <select name="eventId">
        <% for (Event event : events) {
        %>
        <option value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)</option>
        <%
            }
        %>
    </select> <br>
    <input type="submit" value="Register">

</form>
</body>
</html>
