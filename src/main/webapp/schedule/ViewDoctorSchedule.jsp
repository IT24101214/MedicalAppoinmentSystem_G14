<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.medicalsystem.DoctorSchedule.DoctorSchedule"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Doctor Schedules</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --light-gray: #ecf0f1;
            --error: #e74c3c;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: var(--secondary);
            border-bottom: 1px solid var(--light-gray);
            padding-bottom: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: var(--light-gray);
            font-weight: 600;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.9rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-edit {
            background: var(--primary);
            color: white;
            border: none;
        }

        .btn-edit:hover {
            background: #2980b9;
        }

        .btn-add {
            display: inline-block;
            background: #2ecc71;
            color: white;
            margin-bottom: 1.5rem;
            padding: 0.75rem 1.5rem;
        }

        .btn-add:hover {
            background: #27ae60;
        }

        .status-active {
            color: #2ecc71;
            font-weight: 500;
        }

        .status-inactive {
            color: #e74c3c;
            font-weight: 500;
        }

        .status-leave {
            color: #f39c12;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Doctor Schedules</h1>

    <a href="${pageContext.request.contextPath}/schedule/addDoctorSchedule.jsp" class="btn btn-add">Add New Schedule</a>

    <table>
        <thead>
        <tr>
            <th>Doctor ID</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Status</th>
            <th>Available Days</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% DoctorSchedule[] schedules = (DoctorSchedule[]) request.getAttribute("scheduleList");
            if (schedules != null) {
                for (DoctorSchedule schedule : schedules) { %>
        <tr>
            <td><%= schedule.getDoctorId() %></td>
            <td><%= schedule.getStartTime() %></td>
            <td><%= schedule.getEndTime() %></td>
            <td class="status-<%= schedule.getStatus().toLowerCase().replace(" ", "-") %>">
                <%= schedule.getStatus() %>
            </td>
            <td><%= String.join(", ", schedule.getAvailableDays()) %></td>
            <td>
                <form action="${pageContext.request.contextPath}/schedule/editDoctorSchedule.jsp" method="GET" style="display: inline;">
                    <input type="hidden" name="doctorId" value="<%= schedule.getDoctorId() %>">
                    <input type="hidden" name="startTime" value="<%= schedule.getStartTime() %>">
                    <input type="hidden" name="endTime" value="<%= schedule.getEndTime() %>">
                    <input type="hidden" name="status" value="<%= schedule.getStatus() %>">
                    <input type="hidden" name="availableDays" value="<%= String.join(",", schedule.getAvailableDays()) %>">
                    <button type="submit" class="btn btn-edit">Edit</button>
                </form>
            </td>
        </tr>
        <%   }
        } %>
        </tbody>
    </table>
</div>
</body>
</html>