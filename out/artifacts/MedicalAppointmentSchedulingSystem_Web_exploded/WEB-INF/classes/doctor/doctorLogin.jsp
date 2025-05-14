<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medical System - Doctor Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
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
<div class="login-container">
    <h2>Doctor Login</h2>
    <form id="doctorLoginForm" action="${pageContext.request.contextPath}/doctor/doctorLogin" method="post">
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="error-message"><%= error %></div>
        <% } %>

        <label for="doctorId">Doctor ID</label>
        <input type="text" name="doctorId" id="doctorId" required />

        <button type="submit">Login</button>
    </form>
</div>

<script>
    document.getElementById('doctorLoginForm').addEventListener('submit', function(e) {
        const doctorId = document.getElementById('doctorId').value.trim();

        if (!doctorId) {
            e.preventDefault();
            alert('Please enter Doctor ID');
        }
    });
</script>

</body>
</html>
