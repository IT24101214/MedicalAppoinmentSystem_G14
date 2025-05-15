<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.appointment.Appointment" %>
<%@ page import="com.medicalsystem.patient.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment List - MediCare|G14</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 95%;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
            background-color: white;
        }

        thead tr {
            background-color: #3498db;
            color: white;
        }

        th, td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f6fc;
        }

        tbody tr:hover {
            background-color: #eaf2fd;
        }

        select, input[type="text"] {
            width: 95%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .action-btn {
            padding: 6px 12px;
            margin: 2px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s ease;
        }

        .btn-update {
            background-color: #28a745;
            color: white;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-cancel {
            background-color: #dc3545;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #c82333;
        }

        .priority-high { color: #e74c3c; font-weight: bold; }
        .priority-medium { color: #f39c12; font-weight: bold; }
        .priority-low { color: #27ae60; font-weight: bold; }
        .status-pending { color: #6c757d; }
        .status-completed { color: #28a745; font-weight: bold; }
        .status-cancelled { color: #e74c3c; font-weight: bold; }
    </style>
</head>
<body>
<header>
    <jsp:include page="/header.jsp" />
</header>

<div class="container">
    <h1>Appointment Management</h1>
    <table>
        <thead>
        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Gender</th>
            <th>Phone</th>
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
                    Patient p = a.getPatient();
        %>
        <form action="updateAppointment" method="POST">
            <tr>
                <td>
                    <%= a.getAppointmentId() %>
                    <input type="hidden" name="appointmentId" value="<%= a.getAppointmentId() %>">
                </td>
                <td><%= p.getName() %></td>
                <td><%= p.getGender() %></td>
                <td><%= p.getPhone() %></td>
                <td>
                    <input type="text" name="doctorId" value="<%= a.getDoctorId() %>" required>
                </td>
                <td>
                    <select name="priority">
                        <option value="High" <%= "High".equals(a.getPriority()) ? "selected" : "" %>>High</option>
                        <option value="Medium" <%= "Medium".equals(a.getPriority()) ? "selected" : "" %>>Medium</option>
                        <option value="Low" <%= "Low".equals(a.getPriority()) ? "selected" : "" %>>Low</option>
                    </select>
                </td>
                <td>
                    <input type="text" name="reason" value="<%= a.getReason() %>" required>
                </td>
                <td>
                    <select name="status">
                        <option value="Pending" <%= "Pending".equals(a.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Completed" <%= "Completed".equals(a.getStatus()) ? "selected" : "" %>>Completed</option>
                        <option value="Cancelled" <%= "Cancelled".equals(a.getStatus()) ? "selected" : "" %>>Cancelled</option>
                    </select>
                </td>
                <td>
                    <button type="submit" class="action-btn btn-update">Save</button>
        </form>
        <form action="deleteAppointment" method="POST" style="display:inline;" onsubmit="return confirm('Delete this appointment?');">
            <input type="hidden" name="appointmentId" value="<%= a.getAppointmentId() %>">
            <button type="submit" class="action-btn btn-cancel">Delete</button>
        </form>
        </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" style="text-align:center;">No appointments found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<footer>
    <p style="text-align:center; margin-top:30px;">&copy; 2025 MediCare|G14. All rights reserved.</p>
</footer>
</body>
</html>
