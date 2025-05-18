<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.Appointment.Appointment" %>
<%@ page import="com.medicalsystem.Patient.Patient" %>
<%@ page import="com.medicalsystem.Doctor.Doctor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment List - MediCare|G14</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 40px;
        }
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
        .form-control, .form-select {
            font-size: 14px;
            padding: 0.375rem 0.5rem;
        }
    </style>
</head>
<body>

<jsp:include page="/header.jsp" />

<div class="container">
    <h2 class="text-center mb-4 text-primary">Appointment Management</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-primary text-center">
            <tr>
                <th>Appointment ID</th>
                <th>Patient Name</th>
                <th>Gender</th>
                <th>Phone</th>
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
                List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                if (appointments != null && !appointments.isEmpty()) {
                    for (Appointment a : appointments) {
            %>
            <tr>
                <form action="updateAppointment" method="POST">
                    <td>
                        <%= a.getAppointmentID() %>
                        <input type="hidden" name="appointmentId" value="<%= a.getAppointmentID() %>">
                    </td>
                    <td><%= a.getPatient().getName() %></td>
                    <td><%= a.getPatient().getGender() %></td>
                    <td><%= a.getPatient().getPhone() %></td>
                    <td>
                        <input type="text" class="form-control" name="doctorId" value="<%= a.getDoctor().getId() %>" required>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="specialization" value="<%= a.getDoctor().getSpecialization() %>" required>
                    </td>
                    <td>
                        <select name="priority" class="form-select">
                            <option value="High" <%= "High".equals(a.getPriority()) ? "selected" : "" %>>High</option>
                            <option value="Medium" <%= "Medium".equals(a.getPriority()) ? "selected" : "" %>>Medium</option>
                            <option value="Low" <%= "Low".equals(a.getPriority()) ? "selected" : "" %>>Low</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="form-control" name="reason" value="<%= a.getReason() %>" required>
                    </td>
                    <td>
                        <select name="status" class="form-select">
                            <option value="Pending" <%= "Pending".equals(a.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Completed" <%= "Completed".equals(a.getStatus()) ? "selected" : "" %>>Completed</option>
                            <option value="Cancelled" <%= "Cancelled".equals(a.getStatus()) ? "selected" : "" %>>Cancelled</option>
                        </select>
                    </td>
                    <td class="text-nowrap">
                        <button type="submit" class="btn btn-success btn-sm me-1">Save</button>
                </form>
                <form action="deleteAppointment" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this appointment?');">
                    <input type="hidden" name="appointmentId" value="<%= a.getAppointmentID() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="10" class="text-center text-muted">No appointments found.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<footer class="text-center mt-5 mb-3 text-muted">
    &copy; 2025 MediCare | G14. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
