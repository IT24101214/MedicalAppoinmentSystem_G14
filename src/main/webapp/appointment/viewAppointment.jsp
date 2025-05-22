<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.appointment.Appointment" %>
<%@ page import="com.medicalsystem.Doctor.Doctor" %>
<%@ page import="com.medicalsystem.patient.Patient" %>
<% List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Appointment List</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #e6ffff;
            min-height: 100vh;
            position: relative;
            padding-bottom: 60px;
            /* Space for footer */
        }

        /* Header */
        header {
            background-color: #ffffff;
            padding: 15px 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #00a0b0;
            text-decoration: none;
        }

        nav {
            display: flex;
        }

        nav a {
            margin-left: 25px;
            text-decoration: none;
            color: #0096b1;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #00a0b0;
        }

        /* Main Content */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        h2 {
            color: #00a0b0;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        th {
            background-color: #00a0b0;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        /* Form Controls */
        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* Button Styles */
        button {
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            margin-right: 5px;
            color: white;
            font-weight: 500;
        }

        button[type="submit"] {
            background-color: #20b2c0;
        }

        button[type="submit"]:hover {
            background-color: #0090a0;
        }

        .btn-primary {
            background-color: #20b2c0;
        }

        .btn-primary:hover {
            background-color: #0090a0;
        }

        .btn-danger {
            background-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .d-flex {
            display: flex;
        }

        /* Alert Styles */
        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Footer */
        footer {
            background-color: #00a0b0;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
<header>
    <a href="<%= request.getContextPath() %>/index.jsp" class="logo">MediCare</a>
    <nav>
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/Login.jsp">Login</a>
    </nav>
</header>

<div class="container">
    <h2>Appointment List</h2>

    <% if (request.getAttribute("success") !=null) { %>
    <div class="alert alert-success">
        <%= request.getAttribute("success") %>
    </div>
    <% } else if (request.getAttribute("error") !=null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <table>
        <thead>
        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Doctor ID</th>
            <th>Specialization</th>
            <th>Priority</th>
            <th>Reason</th>
        </tr>
        </thead>
        <tbody>
        <% if (appointments !=null && !appointments.isEmpty()) { for
        (Appointment a : appointments) { Patient
                patient=a.getPatient(); Doctor doctor=a.getDoctor(); %>
        <tr>
            <form
                    action="<%= request.getContextPath() %>/updateAppointment"
                    method="POST">
                <td>
                    <%= a.getAppointmentID() %>
                    <input type="hidden" name="appointmentId"
                           value="<%= a.getAppointmentID() %>">
                </td>
                <td>
                    <%= patient.getName() %>
                </td>
                <td>
                    <input type="text" name="doctorId"
                           value="<%= doctor.getId() %>" required>
                </td>
                <td>
                    <input type="text" name="specialization"
                           value="<%= doctor.getSpecialization() %>"
                           required>
                </td>
                <td>
                    <select name="priority">
                        <option value="Emergency" <%="Emergency"
                                .equals(a.getPriority()) ? "selected"
                                : "" %>>Emergency</option>
                        <option value="High-priority"
                                <%="High-priority"
                                        .equals(a.getPriority()) ? "selected"
                                        : "" %>>High-priority</option>
                        <option value="General" <%="General"
                                .equals(a.getPriority()) ? "selected"
                                : "" %>>General</option>
                    </select>
                </td>
                <td>
                    <input type="text" name="reason"
                           value="<%= a.getReason() %>" required>
                </td>
            </form>
            <form
                    action="<%= request.getContextPath() %>/deleteAppointment"
                    method="POST"
                    onsubmit="return confirm('Are you sure you want to delete this appointment?');">
                <input type="hidden" name="appointmentId"
                       value="<%= a.getAppointmentID() %>">
                <button type="submit"
                        class="btn-danger">Delete</button>
            </form>
            </td>
        </tr>
        <% } // end for } else { %>
        <tr>
            <td colspan="8" style="text-align: center;">No
                appointments found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<footer>
    <p>© 2025 Medicare. All Right Reserved</p>
</footer>
</body>

</html>