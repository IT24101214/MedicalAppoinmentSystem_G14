<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Add New Appointment</title>
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
            padding-bottom: 60px; /* Space for footer */
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
        .center-wrapper {
            display: flex;
            justify-content: center;
            padding-top: 40px;
            padding-bottom: 40px;
            box-sizing: border-box;
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
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button[type="submit"] {
            background-color: #20b2c0;
            color: white;
            border: none;
            padding: 15px 35px;
            font-size: 18px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button[type="submit"]:hover {
            background-color: #0090a0;
            transform: translateY(-2px);
        }

        h2 {
            color: #00a0b0;
            text-align: center;
            margin-bottom: 20px;
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
        <a href="<%= request.getContextPath() %>/schedule/ViewAvailability.jsp">Availability</a>
        <a href="<%= request.getContextPath() %>/payment/addPayment.jsp">Payment</a>
        <a href="<%= request.getContextPath() %>/feedback/addFeedback.jsp">Feedback</a>
        <a href="<%= request.getContextPath() %>/Login.jsp">Login</a>
    </nav>
</header>

<div class="center-wrapper">
    <div class="form-container">
        <h2>Schedule New Appointment</h2>

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
                    <option value="Emergency">Emergency</option>
                    <option value="High-priority" selected>High-priority</option>
                    <option value="General">General</option>
                </select>
            </div>

            <div class="form-group">
                <label for="reason">Reason</label>
                <textarea id="reason" name="reason" rows="3" required></textarea>
            </div>

            <div style="text-align: center; margin-top: 20px;">
                <button type="submit">Schedule Appointment</button>
            </div>
        </form>
    </div>
</div>

<footer>
    <p>© 2025 Medicare. All Right Reserved</p>
</footer>
</body>
</html>