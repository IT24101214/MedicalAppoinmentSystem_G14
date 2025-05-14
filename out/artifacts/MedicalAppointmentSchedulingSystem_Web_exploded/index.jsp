<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare|G14</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --light: #ecf0f1;
            --dark: #333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: var(--dark);
        }

        header {
            background: var(--secondary);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: white;
        }

        .logo span {
            color: var(--primary);
        }

        .nav-links {
            display: flex;
            gap: 1rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: background 0.3s, transform 0.2s;
        }

        .nav-links a:hover {
            background: var(--primary);
            border-radius: 4px;
            transform: translateY(-2px);
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--secondary);
        }

        p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .cta-btn {
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .primary-btn {
            background: var(--primary);
            color: white;
        }

        .primary-btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.1);
        }

        .secondary-btn {
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .secondary-btn:hover {
            background: var(--primary);
            color: white;
        }

        footer {
            background: var(--secondary);
            color: white;
            text-align: center;
            padding: 0.5rem;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo">Medi<span>Care</span>|G14</div>
        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/index.jsp" class="nav-btn">Home</a>
            <a href="<%= request.getContextPath() %>/admin/login.jsp" class="nav-btn">Admin</a>
            <a href="<%= request.getContextPath() %>/addPayment.jsp" class="nav-btn">Payment</a>
            <a href="<%= request.getContextPath() %>/feedbackList.jsp" class="nav-btn">Feedbacks</a>
        </div>
    </div>
</header>

<main>
    <h1>Your Trusted Medical Appointment System</h1>
    <p>Streamline your healthcare experience with our comprehensive appointment scheduling platform.
        Connect with top doctors, manage your health records, and receive personalized care - all in one place.</p>

    <div class="cta-buttons">
        <a href="<%= request.getContextPath() %>/appointment/addAppointment.jsp" class="primary-btn">Book Appointment</a>
    </div>
</main>

<footer>
    <p>&copy; 2025 MediCare|G14. All rights reserved.</p>
</footer>
</body>
</html>
