<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.Appointment.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Appointment List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #3498db;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .priority-high {
            color: #e74c3c;
            font-weight: bold;
        }
        .priority-medium {
            color: #f39c12;
        }
        .priority-low {
            color: #2ecc71;
        }
        .status-pending {
            color: #f39c12;
        }
        .status-completed {
            color: #2ecc71;
        }
        .status-cancelled {
            color: #e74c3c;
        }
        .action-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn-update {
            background: #3498db;
            color: white;
        }
        .btn-cancel {
            background: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Appointment Management</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Patient ID</th>
            <th>Doctor ID</th>
            <th>Priority</th>
            <th>Reason</th>
            <th>Status</th>
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
            <td><%= a.getAppointmentId() %></td>
            <td><%= a.getPatientId() %></td>
            <td><%= a.getDoctorId() %></td>
            <td class="priority-<%= a.getPriority().toLowerCase() %>">
                <%= a.getPriority() %>
            </td>
            <td><%= a.getReason() %></td>
            <td class="status-<%= a.getStatus().toLowerCase() %>">
                <%= a.getStatus() %>
            </td>
            <td>
                <form action="updateAppointmentStatus" method="POST" style="display: inline;">
                    <input type="hidden" name="appointmentId" value="<%= a.getAppointmentId() %>">
                    <input type="hidden" name="status" value="Completed">
                    <button type="submit" class="action-btn btn-update">Complete</button>
                </form>
                <form action="updateAppointmentStatus" method="POST" style="display: inline;">
                    <input type="hidden" name="appointmentId" value="<%= a.getAppointmentId() %>">
                    <input type="hidden" name="status" value="Cancelled">
                    <button type="submit" class="action-btn btn-cancel">Cancel</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>