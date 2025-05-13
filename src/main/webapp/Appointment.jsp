<%@ page import="com.medicalsystem.appointment.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body { padding-top: 70px; }
</style>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Medical System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Appointment.jsp">Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="doctor.jsp">Doctor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="patient.jsp">Patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="feedback.jsp">Feedback</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <div class="row mb-4">
        <!-- Appointment Form -->
        <div class="col-md-5">
            <h3>Schedule New Appointment</h3>
            <form method="post" action="appointments?action=book">
                <div class="mb-3">
                    <label class="form-label">Patient Name</label>
                    <input type="text" class="form-control" name="patientName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Doctor Name</label>
                    <input type="text" class="form-control" name="doctorName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <input type="date" class="form-control" name="date" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Time</label>
                    <input type="time" class="form-control" name="time" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Urgency</label>
                    <label>
                        <select class="form-select" name="urgency" required>
                            <option value="1">High</option>
                            <option value="2">Medium</option>
                            <option value="3">Low</option>
                        </select>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary">Schedule Appointment</button>
            </form>
        </div>

        <!-- Appointment Table -->
        <div class="col-md-7">
            <h3>Appointments</h3>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Urgency</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                    if (appointments != null) {
                        for (Appointment a : appointments) {
                %>
                <tr>
                    <td><%= a.getAppointmentID() %></td>
                    <td><%= a.getPatientName() %></td>
                    <td><%= a.getDoctorName() %></td>
                    <td><%= a.getDate() %></td>
                    <td><%= a.getTime() %></td>
                    <td><%= a.getUrgency() == 1 ? "High" : a.getUrgency() == 2 ? "Medium" : "Low" %></td>
                    <td>
                        <a href="appointments?action=cancel&appointmentID=<%=a.getAppointmentID()%>" class="btn btn-danger btn-sm">Cancel</a>
                        <a href="appointments?action=reschedule&appointmentID=<%=a.getAppointmentID()%>" class="btn btn-warning btn-sm">Reschedule</a>
                    </td>
                </tr>
                <%   }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
