<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Appointments</title>
</head>
<body>
<h1>Appointments</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Patient</th>
        <th>Doctor</th>
        <th>Date</th>
        <th>Time</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${appointments}" var="appointment">
        <tr>
            <td>${appointment.appointmentID}</td>
            <td>${appointment.patientName}</td>
            <td>${appointment.doctorName}</td>
            <td>${appointment.date}</td>
            <td>${appointment.time}</td>
            <td>
                <form action="appointments" method="get">
                    <input type="hidden" name="action" value="cancel">
                    <input type="hidden" name="appointmentID" value="${appointment.appointmentID}">
                    <input type="submit" value="Cancel">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<h2>Book New Appointment</h2>
<form action="appointments" method="post">
    <input type="hidden" name="action" value="book">
    Patient Name: <input type="text" name="patientName"><br>
    Doctor Name: <input type="text" name="doctorName"><br>
    Date: <input type="text" name="date"><br>
    Time: <input type="text" name="time"><br>
    <input type="submit" value="Book Appointment">
</form>
</body>
</html>