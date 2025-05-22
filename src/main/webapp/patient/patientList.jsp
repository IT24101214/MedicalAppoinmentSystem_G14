<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.patient.Patient"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Management</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
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
        }

        .btn-view {
            background: var(--primary);
            color: white;
        }

        .btn-edit {
            background: #f39c12;
            color: white;
        }

        .btn-delete {
            background: var(--danger);
            color: white;
        }

        .age-col {
            width: 80px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Patient Management</h1>
        <a href="addPatient.jsp" class="btn-add">+ Add New Patient</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            if (patients != null) {
                for (Patient patient : patients) {
        %>
        <tr>
            <td><%= patient.getId() %></td>
            <td><%= patient.getName() %></td>
            <td><%= patient.getGender() %></td>
            <td class="age-col">
                <%-- Calculate age from DOB (simplified) --%>
                <%
                    String dob = patient.getDob();
                    int birthYear = dob != null ? Integer.parseInt(dob.substring(0, 4)) : 0;
                    int currentYear = java.time.Year.now().getValue();
                    int age = birthYear > 0 ? currentYear - birthYear : 0;
                %>
                <%= age > 0 ? age + " yrs" : "" %>
            </td>
            <td>
                <%= patient.getEmail() %><br>
                <%= patient.getPhone() %>
            </td>
            <td>
                <button class="action-btn btn-view">View</button>
                <button class="action-btn btn-edit">Edit</button>
                <button class="action-btn btn-delete">Delete</button>
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