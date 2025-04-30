<%@ page import="java.util.*, com.medicalsystem.appointment.Appointment" %>
<html>
<head>
    <title>Appointments List</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h2>Appointments</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Patient</th>
        <th>Doctor</th>
        <th>Date</th>
        <th>Time</th>
        <th>Actions</th>
    </tr>
    <%
        List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
        for (Appointment a : appointments) {
    %>
    <tr>
        <td><%= a.getAppointmentID() %></td>
        <td><%= a.getPatientName() %></td>
        <td><%= a.getDoctorName() %></td>
        <td><%= a.getDate() %></td>
        <td><%= a.getTime() %></td>
        <td>
            <a href="appointments?action=cancel&appointmentID=<%=a.getAppointmentID()%>">Cancel</a> |
            <a href="appointments?action=reschedule&appointmentID=<%=a.getAppointmentID()%>">Reschedule</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
