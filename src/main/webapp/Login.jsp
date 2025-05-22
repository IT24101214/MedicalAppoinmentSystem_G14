<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #e8fbfb;
            height: 100vh;
            overflow: hidden;
        }

        .header {
            background-color: #ffffff;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #00a0a0;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav a {
            color: #00a0a0;
            text-decoration: none;
            font-weight: 500;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            margin: 0;
        }

        .login-form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            width: 100%;
            max-width: 380px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        .login-title {
            color: #00a0a0;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            color: #00a0a0;
            font-size: 14px;
        }

        .form-input, .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #00a0a0;
            border-radius: 4px;
            font-size: 14px;
            outline: none;
        }

        .form-button {
            width: 100%;
            padding: 12px;
            background-color: #16b8c7;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-button:hover {
            background-color: #0c9aa8;
        }

        .footer {
            background-color: #16b8c7;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .error-message {
            background-color: #ffebee;
            color: #c62828;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp" class="logo">MediCare</a>
    <div class="nav">
        <a href="index.jsp">Home</a>
    </div>
</div>

<div class="login-container">
    <div class="login-form">
        <h1 class="login-title">Dashboard Login</h1>

        <!-- Display error message if any -->
        <% if(request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/adminLogin" method="post">
            <div class="form-group">
                <label for="role" class="form-label">Login As:</label>
                <select name="role" id="role" class="form-select" onchange="toggleFields()" required>
                    <option value="admin">Admin</option>
                    <option value="doctor">Doctor</option>
                </select>
            </div>

            <div class="form-group" id="adminFields">
                <label for="username" class="form-label">Admin Username:</label>
                <input type="text" id="username" name="username" class="form-input" placeholder="Enter admin username" required>
            </div>

            <div class="form-group" id="doctorFields" style="display: none;">
                <label for="doctorID" class="form-label">Doctor ID:</label>
                <input type="text" id="doctorID" name="doctorID" class="form-input" placeholder="Enter doctor ID">
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-input" placeholder="Enter password" required>
            </div>

            <button type="submit" class="form-button">Login</button>
        </form>
    </div>
</div>

<div class="footer">
    © 2025 Medicare. All Right Reserved
</div>

<script>
    function toggleFields() {
        const role = document.getElementById("role").value;
        const adminFields = document.getElementById("adminFields");
        const doctorFields = document.getElementById("doctorFields");

        if (role === "admin") {
            adminFields.style.display = "block";
            doctorFields.style.display = "none";
        } else {
            adminFields.style.display = "none";
            doctorFields.style.display = "block";
        }
    }

    // Run on page load to show correct fields
    window.onload = toggleFields;
</script>
</body>
</html>
