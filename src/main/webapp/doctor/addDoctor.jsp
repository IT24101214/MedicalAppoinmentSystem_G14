<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register New Doctor</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --light-gray: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--secondary);
        }

        input, select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .btn-submit {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
            grid-column: span 2;
        }

        .btn-submit:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Register New Doctor</h1>
    <form action="${pageContext.request.contextPath}/addDoctor" method="POST" class="form-grid">

        <div class="form-group">
            <label for="doctorID">Doctor ID</label>
            <input type="text" id="doctorID" name="doctorID" required>
        </div>

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" required>
        </div>

        <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" required>
        </div>

        <div class="form-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="">Select gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" required>
        </div>

        <div class="form-group">
            <label for="specialization">Specialization</label>
            <input type="text" id="specialization" name="specialization" required>
        </div>

        <div class="form-group" style="grid-column: span 2;">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <button type="submit" class="btn-submit">Register Doctor</button>
    </form>
</div>
</body>
</html>
