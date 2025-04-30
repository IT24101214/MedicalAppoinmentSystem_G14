<%@ page import="com.medicalsystem.appointment.Appointment" %>
<%
    Appointment appointment = (Appointment) request.getAttribute("appointment");
%>
<html>
<head>
    <title>Reschedule</title>
</head>
<body>
<h2>Reschedule Appointment for <%= appointment.getPatientName() %></h2>
<form method="post" action="appointments?action=update">
    <input type="hidden" name="appointmentID" value="<%= appointment.getAppointmentID() %>">
    New Date: <input type="date" name="newDate" required><br>
    New Time: <input type="time" name="newTime" required><br>
    <button type="submit">Save Changes</button>
</form>
</body>
</html>
