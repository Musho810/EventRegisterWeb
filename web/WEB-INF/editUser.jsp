<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 03.09.2022
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>

<body>
<%
    User user = (User) request.getAttribute("user");

    List<Event> events = (List<Event>) request.getAttribute("events");

%>

<h1> Please edit user`s data:</h1>
<form action="/users/edit" method="post">
    <input type="hidden" name="userId" value="<%=user.getId()%>"/>
    <input type="text" name="name" value="<%=user.getName()%>"/><br>
    <input type="text" name="surname" value="<%=user.getSurname()%>"/><br>
    <input type="text" name="email" value="<%=user.getEmail()%>"/><br>
    Event ID
    <select name="eventId">
        <% for (Event event : events) {
            if (event.equals(user.getEvent())) {
        %>
        <option selected value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)>
        </option>
        <%
        } else { %>
        <option value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)>
        </option>
        <%
            }
        %>
        <%
            }
        %>

    </select> <br>
    <input type="submit" value="Update">

</form>


</body>
</html>
