<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Appointment</title>

    <!-- Bootstrap 5 CDN (Optional but recommended for consistent design) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .center-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 600px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button[type="submit"] {
            background-color: #328eca;
            color: white;
            border: none;
            padding: 10px 18px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<jsp:include page="/header.jsp" />

<div class="center-wrapper">
    <div class="form-container">
        <h2 class="text-center mb-4">Schedule New Appointment</h2>

        <% if (request.getAttribute("success") != null) { %>
        <p style="color: green; font-weight: bold; text-align: center;"><%= request.getAttribute("success") %></p>
        <% } %>

        <form action="<%= request.getContextPath() %>/addAppointment" method="POST">

            <div class="form-group">
                <label for="patientName">Patient Name</label>
                <input type="text" id="patientName" name="patientName" required>
            </div>

            <div class="form-group">
                <label for="gender">Patient Gender</label>
                <select id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="phone">Patient Phone</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="doctorId">Doctor ID</label>
                <input type="text" id="doctorId" name="doctorId" required>
            </div>

            <div class="form-group">
                <label for="specialization">Doctor Specialization</label>
                <select id="specialization" name="specialization" required>
                    <option value="Cardiology">Cardiology</option>
                    <option value="Neurology">Neurology</option>
                    <option value="Dermatology">Dermatology</option>
                    <option value="Pediatrics">Pediatrics</option>
                    <option value="General">General</option>
                </select>
            </div>

            <div class="form-group">
                <label for="priority">Priority</label>
                <select id="priority" name="priority" required>
                    <option value="High">High</option>
                    <option value="Medium" selected>Medium</option>
                    <option value="Low">Low</option>
                </select>
            </div>

            <div class="form-group">
                <label for="reason">Reason</label>
                <textarea id="reason" name="reason" rows="3" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit">Schedule Appointment</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
