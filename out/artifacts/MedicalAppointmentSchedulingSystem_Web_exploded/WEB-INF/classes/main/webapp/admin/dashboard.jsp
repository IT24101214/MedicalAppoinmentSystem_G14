<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        :root {
            --primary: #3498db; /* Set your primary color */
            --secondary: #2c3e50; /* Set your secondary color */
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        /* Header */
        header {
            background: var(--secondary);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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

        /* Main Dashboard Container */
        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 300px; /* Reduced width */
            background:var(--primary);
            color:white ;
            padding: 20px;
            box-sizing: border-box;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 30px; /* Reduced margin */
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 16px; /* Reduced font size */
            margin-bottom: 0px; /* Reduced margin */
            display: block;
            transition: background 0.3s;
            padding: 2px; /* Reduced padding */
            border-radius: 6px;
        }

        .sidebar a:hover {
            background: #34495e;
        }

        /* Main Content */
        .main-content {
            flex-grow: 1;
            padding: 30px;
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .main-header h1 {
            margin: 0;
            color: #2c3e50;
        }

        .logout-button {
            padding: 10px 20px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Dashboard Content Section */
        .dashboard-content {
            margin-top: 20px;
        }

        .dashboard-content h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .card {
            background: #ecf0f1;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card h3 {
            margin: 0;
            font-size: 20px;
            color: #2c3e50;
        }

        .card p {
            color: #7f8c8d;
        }

    </style>
</head>
<body>

<!-- Header -->
<header>
    <div class="navbar">
        <div class="logo">Medi<span>Care</span>|G14</div>
        <div class="nav-links">
            <!-- Add navigation links here if needed in the future -->
        </div>
    </div>
</header>

<!-- Dashboard Content -->
<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="patients.jsp">Manage Patients</a>
        <a href="<%= request.getContextPath() %>/doctor/addDoctor.jsp" class="nav-btn">Add Doctors</a>
        <a href="<%= request.getContextPath() %>/schedule/addSchedule.jsp" class="nav-btn">Add new DoctorSchedule</a>
        <a href="<%= request.getContextPath() %>/doctors" class="nav-btn">View all Doctors</a>
        <a href="<%= request.getContextPath() %>/schedules" class="nav-btn">View all DoctorSchedules</a>

        <a href="feedback.jsp">View Feedback</a>
        <a href="payments.jsp">Manage Payments</a>
        <form action="${pageContext.request.contextPath}/admin/AdminServlet" method="post">
            <input type="hidden" name="action" value="logout"/>
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="main-header">
            <h1>Welcome, Admin <%= session.getAttribute("admin") %></h1>
        </div>

        <div class="dashboard-content">
            <div class="card">
                <h3>Overview</h3>
                <p>Manage your medical appointment system easily from here.</p>
            </div>

            <div class="card">
                <h3>Upcoming Appointments</h3>
                <p>View and manage upcoming appointments scheduled for today.</p>
                <a href="appointments.jsp" class="view-link">View Appointments</a>
            </div>

            <div class="card">
                <h3>Recent Feedback</h3>
                <p>View recent feedback from patients about their experience.</p>
                <a href="feedback.jsp" class="view-link">View Feedback</a>
            </div>

            <div class="card">
                <h3>Payment Status</h3>
                <p>Track the payment status of patients for completed appointments.</p>
                <a href="payments.jsp" class="view-link">View Payments</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
