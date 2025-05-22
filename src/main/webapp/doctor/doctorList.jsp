<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.Doctor.Doctor"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Doctor Management</title>
    <style>
        /* Your existing styles here ... */
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
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
            max-width: 1200px;
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
            vertical-align: top;
        }
        th {
            background: var(--secondary);
            color: white;
        }
        tr:hover {
            background-color: #f8f9fa;
        }
        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 0.5rem;
            text-decoration: none;
            display: inline-block;
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
        <h1>Doctor Management</h1>
        <a href="doctor/addDoctor.jsp" class="btn-add">+ Add New Doctor</a>

    </div>

    <table>
        <thead>
        <tr>
            <th>Doctor ID</th>
            <th>Name</th>
            <th>Specialization</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
            if (doctors != null) {
                for (Doctor doctor : doctors) {
        %>
        <tr>
            <td><%= doctor.getDoctorID() %></td>
            <td><%= doctor.getName() %></td>
            <td><%= doctor.getSpecialization() %></td>
            <td>
                <%= doctor.getEmail() %><br>
                <%= doctor.getPhone() %>
            </td>
            <td>
                <a href="editDoctor?id=<%= doctor.getDoctorID() %>" class="action-btn btn-edit">Edit</a>
                <form action="deleteDoctor" method="POST" style="display: inline;">
                    <input type="hidden" name="id" value="<%= doctor.getDoctorID() %>">
                    <button type="submit" class="action-btn btn-delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">No doctors found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
