<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medical System - Admin Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        /* Wrapper to center content below the header */
        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Adjust based on actual header height */
        }

        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        h3 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 2rem;
        }

        label {
            display: block;
            margin-top: 1rem;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        input:focus {
            outline: none;
            border-color: #3498db;
        }

        button {
            margin-top: 1.5rem;
            width: 100%;
            padding: 0.75rem;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #2980b9;
        }

        .error-message {
            color: #e74c3c;
            text-align: center;
            margin-top: 1rem;
        }
    </style>
</head>
<body>

<!-- Include your header -->
<jsp:include page="/header.jsp" />

<!-- Wrapper to center the login box -->
<div class="wrapper">
    <div class="login-container">
        <h3>Admin Login</h3>
        <form id="loginForm" action="${pageContext.request.contextPath}/admin/AdminServlet" method="post">
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <div class="error-message"><%= error %></div>
            <% } %>

            <input type="hidden" name="action" value="login"/>
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required />

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required />

            <button type="submit">Login</button>
        </form>
    </div>
</div>

<script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
            e.preventDefault();
            alert('Please fill in all fields');
        }
    });
</script>

</body>
</html>
