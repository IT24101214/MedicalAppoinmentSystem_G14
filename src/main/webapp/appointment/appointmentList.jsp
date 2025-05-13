<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.appointment.Appointment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment List - MediCare|G14</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary: #3498db;
            --secondary: #343f50;
            --light: #ecf0f1;
            --dark: #333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: var(--dark);
        }

        header {
            background: var(--secondary);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: white;
        }

        .logo span {
            color: var(--primary);
        }

        .nav-links {
            display: flex;
            gap: 1rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: background 0.3s, transform 0.2s;
        }

        .nav-links a:hover {
            background: var(--primary);
            border-radius: 4px;
            transform: translateY(-2px);
        }

        .container {
            flex: 1;
            max-width: 1400px;
            margin: 2rem auto;
            padding: 20px;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h1 {
            color: var(--secondary);
            margin-bottom: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background: white;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            font-size: 1.05rem;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: var(--primary);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f6f9;
        }

        tr:hover {
            background-color: #ecf0f1;
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
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-update {
            background: #3498db;
            color: white;
        }

        .btn-update:hover {
            background: #2980b9;
        }

        .btn-cancel {
            background: #e74c3c;
            color: white;
        }

        .btn-cancel:hover {
            background: #c0392b;
        }

        footer {
            background: var(--secondary);
            color: white;
            text-align: center;
            padding: 0.5rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
            }
        }
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
        } else {
        %>
        <tr>
            <td colspan="7" style="text-align:center;">No appointments found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<footer>
    <p>&copy; 2025 MediCare|G14. All rights reserved.</p>
</footer>
</body>
</html>
