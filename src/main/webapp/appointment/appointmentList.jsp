<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.Appointment.Appointment" %>
<%@ page import="com.medicalsystem.Doctor.Doctor" %>
<%@ page import="com.medicalsystem.Patient.Patient" %>
<%@ page import="com.medicalsystem.Appointment.AppointmentManager" %>
<%
    String filePath = application.getRealPath("/data/appointments.txt");
    AppointmentManager manager = new AppointmentManager();
    List<Appointment> appointments = manager.getSortedAppointments();
    request.setAttribute("appointments", appointments);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Appointment List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Appointment List</h2>

    <% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success"><%= request.getAttribute("success") %></div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>

    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Appointment ID</th>
            <th>Patient ID</th>
            <th>Doctor ID</th>
            <th>Specialization</th>
            <th>Priority</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Appointment a : appointments) {
                Patient patient = a.getPatient();
                Doctor doctor = a.getDoctor();
        %>
        <tr>
            <form action="<%= request.getContextPath() %>/updateAppointment" method="POST">
                <td>
                    <%= a.getAppointmentID() %>
                    <input type="hidden" name="appointmentId" value="<%= a.getAppointmentID() %>" />
                </td>
                <td><%= patient.getId() %></td>
                <td><input type="text" name="doctorId" class="form-control" value="<%= doctor.getId() %>" required></td>
                <td><input type="text" name="specialization" class="form-control" value="<%= doctor.getSpecialization() %>" required></td>
                <td>
                    <select name="priority" class="form-control">
                        <option value="High" <%= "High".equals(a.getPriority()) ? "selected" : "" %>>High</option>
                        <option value="Medium" <%= "Medium".equals(a.getPriority()) ? "selected" : "" %>>Medium</option>
                        <option value="Low" <%= "Low".equals(a.getPriority()) ? "selected" : "" %>>Low</option>
                    </select>
                </td>
                <td><input type="text" name="reason" class="form-control" value="<%= a.getReason() %>" required></td>
                <td>
                    <select name="status" class="form-control">
                        <option value="Pending" <%= "Pending".equals(a.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Approved" <%= "Approved".equals(a.getStatus()) ? "selected" : "" %>>Approved</option>
                        <option value="Rejected" <%= "Rejected".equals(a.getStatus()) ? "selected" : "" %>>Rejected</option>
                    </select>
                </td>
                <td>
                    <button type="submit" class="btn btn-sm btn-primary">Update</button>
                </td>
            </form>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
