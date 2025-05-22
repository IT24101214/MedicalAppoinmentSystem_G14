<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        /* Header (Assuming header.jsp already styles it) */
        header {
            background: var(--secondary);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .dashboard-container {
            display: flex;
            height: calc(100vh - 80px); /* Adjust if header is taller/shorter */
        }

        .sidebar {
            width: 280px;
            background: var(--primary);
            color: white;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
        }

        .sidebar h2 {
            font-size: 22px;
            margin-bottom: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            margin: 8px 0;
            display: block;
            padding: 6px;
            border-radius: 6px;
        }

        .sidebar a:hover {
            background: #2980b9;
        }

        .logout-button {
            margin-top: 20px;
            padding: 10px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .main-content {
            flex-grow: 1;
            padding: 30px;
            background: white;
            overflow-y: auto;
        }

        .main-header h1 {
            margin: 0 0 20px 0;
            color: var(--secondary);
        }

        .dashboard-content .card {
            background: #ecf0f1;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .card h3 {
            margin: 0 0 10px 0;
            color: var(--secondary);
        }

        .view-link {
            display: inline-block;
            margin-top: 10px;
            color: var(--primary);
            text-decoration: underline;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- ✅ Include the full header (logo + nav) from a separate file -->
<jsp:include page="/header.jsp" />

<div class="dashboard-container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="patients.jsp">Manage Patients</a>
        <a href="<%= request.getContextPath() %>/doctor/addDoctor.jsp" class="nav-btn">Add Doctors</a>
        <a href="<%= request.getContextPath() %>/schedule/addSchedule.jsp" class="nav-btn">Add new DoctorSchedule</a>
        <a href="<%= request.getContextPath() %>/doctors" class="nav-btn">View all Doctors</a>
        <a href="<%= request.getContextPath() %>/schedules" class="nav-btn">View all DoctorSchedules</a>

        <form action="${pageContext.request.contextPath}/admin/AdminServlet" method="post">
            <input type="hidden" name="action" value="logout"/>
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="main-header">
            <h1>Welcome, <%= session.getAttribute("admin") %></h1>
        </div>

        <div class="dashboard-content">
            <div class="card">
                <h3>Overview</h3>
                <p>Manage your medical appointment system easily from here.</p>
            </div>

            <div class="card">
                <h3>Upcoming Appointments</h3>
                <p>View and manage upcoming appointments scheduled for today.</p>
                <a href="<%= request.getContextPath() %>/appointments" class="nav-btn">View All Appointments</a>



            </div>

            <div class="card">
                <h3>Recent Feedback</h3>
                <p>View recent feedback from patients about their experience.</p>
                <a href="<%= request.getContextPath() %>/feedbacks" class="nav-btn">View Feedbacks</a>

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
