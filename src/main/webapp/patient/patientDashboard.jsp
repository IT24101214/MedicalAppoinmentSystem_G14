<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Dashboard | MediCare</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --light: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: #333;
        }

        .dashboard {
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            background: var(--secondary);
            color: white;
            padding: 1.5rem;
        }

        .sidebar-header {
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 1.5rem;
        }

        .sidebar-nav {
            list-style: none;
            padding: 0;
        }

        .sidebar-nav li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 0.75rem 0;
            transition: all 0.3s;
        }

        .sidebar-nav li a:hover {
            color: var(--primary);
            padding-left: 10px;
        }

        /* Main Content */
        .main-content {
            padding: 2rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .welcome-banner {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 1.5rem;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
            color: var(--secondary);
        }

        .upcoming-appointments {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light);
        }

        th {
            background: var(--light);
        }

        .status-confirmed {
            color: var(--success);
            font-weight: 500;
        }

        .status-pending {
            color: var(--warning);
            font-weight: 500;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-danger {
            background: var(--danger);
            color: white;
        }

        .logout-btn {
            background: var(--danger);
            color: white;
            margin-top: auto;
        }

        .quick-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Patient Portal</h2>
            <p>Welcome, <%= session.getAttribute("patientName") %></p>
        </div>
        <ul class="sidebar-nav">
            <li><a href="patientDashboard.jsp">Dashboard</a></li>
            <li><a href="appointments.jsp">My Appointments</a></li>
            <li><a href="doctors.jsp">Find Doctors</a></li>
            <li><a href="medicalRecords.jsp">Medical Records</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="../logout" class="logout-btn">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Dashboard</h1>
            <p>Today: <%= new java.text.SimpleDateFormat("MMMM dd, yyyy").format(new java.util.Date()) %></p>
        </div>

        <div class="welcome-banner">
            <h2>Welcome back to your health portal!</h2>
            <p>You have 2 upcoming appointments this week. Don't forget to check your medical records for recent test results.</p>
            <div class="quick-actions">
                <a href="appointments.jsp" class="btn btn-primary">Book Appointment</a>
                <a href="medicalRecords.jsp" class="btn">View Records</a>
            </div>
        </div>

        <div class="cards">
            <div class="card">
                <h3>Upcoming Appointments</h3>
                <p>You have <strong>2</strong> scheduled appointments</p>
                <a href="appointments.jsp" class="btn btn-primary">View All</a>
            </div>

            <div class="card">
                <h3>Medical Records</h3>
                <p><strong>3</strong> new test results available</p>
                <a href="medicalRecords.jsp" class="btn btn-primary">View Records</a>
            </div>

            <div class="card">
                <h3>Prescriptions</h3>
                <p><strong>1</strong> active prescription</p>
                <a href="prescriptions.jsp" class="btn btn-primary">View Details</a>
            </div>
        </div>

        <div class="upcoming-appointments">
            <h2>Recent Appointments</h2>
            <table>
                <thead>
                <tr>
                    <th>Doctor</th>
                    <th>Date & Time</th>
                    <th>Purpose</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Dr. Smith (Cardiology)</td>
                    <td>May 15, 2023 - 10:00 AM</td>
                    <td>Follow-up</td>
                    <td class="status-confirmed">Confirmed</td>
                    <td><a href="#" class="btn btn-primary">Details</a></td>
                </tr>
                <tr>
                    <td>Dr. Johnson (General)</td>
                    <td>May 18, 2023 - 2:30 PM</td>
                    <td>Annual Checkup</td>
                    <td class="status-pending">Pending</td>
                    <td><a href="#" class="btn btn-danger">Cancel</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>