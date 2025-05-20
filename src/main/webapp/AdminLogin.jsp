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
            min-height: calc(100vh - 130px);
            padding-bottom: 70px; /* Add padding to prevent content from being hidden by fixed footer */
        }

        .login-form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        .login-title {
            color: #00a0a0;
            font-size: 28px;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 10px;
            color: #00a0a0;
            font-size: 16px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #00a0a0;
            border-radius: 4px;
            font-size: 16px;
            outline: none;
        }

        .form-button {
            width: 100%;
            padding: 14px;
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
    <a href="#" class="logo">MediCare</a>
    <div class="nav">
        <a href="#">Home</a>
    </div>
</div>

<div class="login-container">
    <div class="login-form">
        <h1 class="login-title">Admin Login</h1>

        <!-- Display error message if any -->
        <% if(request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
            <!-- Added hidden field to identify login action -->
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-input" required>
            </div>

            <button type="submit" class="form-button">Login</button>
        </form>
    </div>
</div>

<div class="footer">
    © 2025 Medicare. All Right Reserved
</div>
</body>
</html>