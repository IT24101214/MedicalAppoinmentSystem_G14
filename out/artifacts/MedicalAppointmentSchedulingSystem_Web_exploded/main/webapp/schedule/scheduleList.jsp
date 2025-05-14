<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.DoctorSchedule.DoctorSchedule"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Doctor Schedules</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light-gray: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        h1 {
            color: var(--secondary);
            margin: 0;
        }

        .btn-add {
            background: var(--primary);
            color: white;
            text-decoration: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light-gray);
        }

        th {
            background: var(--secondary);
            color: white;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .status-available {
            color: var(--success);
            font-weight: 500;
        }

        .status-booked {
            color: var(--danger);
            font-weight: 500;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 0.5rem;
        }

        .btn-edit {
            background: var(--primary);
            color: white;
        }

        .btn-delete {
            background: var(--danger);
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Doctor Schedules</h1>
        <a href="<%= request.getContextPath() %>/schedule/addSchedule.jsp" class="btn-add">+ Add New Schedule</a>

    </div>

    <table>
        <thead>
        <tr>
            <th>Doctor ID</th>
            <th>Date</th>
            <th>Time Slot</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<DoctorSchedule> schedules = (List<DoctorSchedule>) request.getAttribute("schedules");
            if (schedules != null) {
                for (DoctorSchedule schedule : schedules) {
        %>
        <tr>
            <td><%= schedule.getDoctorId() %></td>
            <td><%= schedule.getDate() %></td>
            <td><%= schedule.getStartTime() %> - <%= schedule.getEndTime() %></td>
            <td class="status-<%= schedule.getStatus().toLowerCase() %>">
                <%= schedule.getStatus() %>
            </td>
            <td>
                <a href="editSchedule.jsp?id=<%= schedule.getDoctorId() %>&date=<%= schedule.getDate() %>"
                   class="action-btn btn-edit">Edit</a>
                <form action="deleteSchedule" method="POST" style="display: inline;">
                    <input type="hidden" name="doctorId" value="<%= schedule.getDoctorId() %>">
                    <input type="hidden" name="date" value="<%= schedule.getDate() %>">
                    <button type="submit" class="action-btn btn-delete">Delete</button>
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