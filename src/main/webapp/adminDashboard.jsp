<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.Admin.model.Admin" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
        }

        /* Header Styles */
        .header {
            background-color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logo {
            color: #00a2c0;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
        }

        .nav-link {
            margin-left: 30px;
            color: #00a2c0;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #007d94;
        }

        /* Layout Styles */
        .container {
            display: flex;
            min-height: calc(100vh - 60px);
        }

        .sidebar {
            width: 250px;
            background-color: #a2edf0;
            color: white;
            padding: 20px 0;
            transition: all 0.3s ease;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

        .sidebar-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #0097b2;
            text-decoration: none;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            font-size: 15px;
        }

        .sidebar-item:hover {
            background-color:	#c8f4f6;
            border-left: 4px solid white;
        }

        .sidebar-item i {
            margin-right: 15px;
            width: 20px;
            text-align: center;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        /* Dashboard Card Styles */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            color: #00a2c0;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #e6f7f9;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #00a2c0;
            font-size: 24px;
        }

        .card-value {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .card-description {
            color: #777;
            font-size: 14px;
        }

        /* Welcome Section Styles */
        .welcome-section {
            background-color: #a2edf0;
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            animation: fadeIn 0.6s ease-in-out;
        }

        .welcome-text {
            flex: 1;
        }

        .welcome-text h1 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #00a2c0;
        }

        .welcome-text p {
            color: #555;
            font-size: 16px;
            max-width: 600px;
        }

        .welcome-image {
            flex: 1;
            display: flex;
            justify-content: flex-end;
        }

        .welcome-image img {
            max-width: 300px;

        }

        /* Recent Activity Section */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 20px;
            color: #444;
            font-weight: 600;
        }

        .section-action {
            color: #00a2c0;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .section-action:hover {
            color: #007d94;
            text-decoration: underline;
        }

        .activity-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .activity-table th, .activity-table td {
            padding: 12px 20px;
            text-align: left;
        }

        .activity-table th {
            background-color: #f2f2f2;
            color: #555;
            font-weight: 600;
        }

        .activity-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .activity-table tr:hover {
            background-color: #f0f7fa;
        }

        .activity-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-completed {
            background-color: #e3f9e5;
            color: #1f9d55;
        }

        .status-pending {
            background-color: #fef5e7;
            color: #f2994a;
        }

        .status-cancelled {
            background-color: #fbe4e4;
            color: #e53e3e;
        }

        /* Footer Styles */
        .footer {
            background-color: white;
            padding: 15px 20px;
            text-align: center;
            color: #777;
            font-size: 14px;
            border-top: 1px solid #eee;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        .fade-in {
            animation: fadeIn 0.6s ease-in-out;
        }

        /* For cards animation */
        .dashboard-cards .card:nth-child(1) {
            animation: fadeIn 0.4s ease-in-out;
        }

        .dashboard-cards .card:nth-child(2) {
            animation: fadeIn 0.6s ease-in-out;
        }

        .dashboard-cards .card:nth-child(3) {
            animation: fadeIn 0.8s ease-in-out;
        }

        .dashboard-cards .card:nth-child(4) {
            animation: fadeIn 1s ease-in-out;
        }


        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 10px 0;
            }

            .welcome-section {
                flex-direction: column;
                text-align: center;
            }

            .welcome-image {
                justify-content: center;
                margin-top: 20px;
            }

            .welcome-image img {
                max-width: 200px;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header">
    <a href="adminDashboard.jsp" class="logo">MediCare</a>
    <div class="nav-links">
        <a href="index.html" class="nav-link">Home</a>
        <a href="admin" class="nav-link">Admin</a>
        <a href="doctor" class="nav-link">Doctor</a>
    </div>
</header>

<!-- Main Container -->
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <ul class="sidebar-menu">
            <li>
                <a href="adminDashboard.jsp" class="sidebar-item">
                    <i class="fas fa-user-friends"></i>
                    <span>Manage Users</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Appointment</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-user-md"></i>
                    <span>Doctor Schedules</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add Doctor Schedule</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-user-plus"></i>
                    <span>Add Doctor</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-credit-card"></i>
                    <span>Payments</span>
                </a>
            </li>
            <li>
                <a href="#" class="sidebar-item">
                    <i class="fas fa-comment"></i>
                    <span>Feedback</span>
                </a>
            </li>
            <li>
                <a href="index.jsp" class="sidebar-item">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <div class="welcome-text">
                <h1>Welcome, Admin!</h1>
                <p>Text under admin</p>
            </div>
            <div class="welcome-image">
                <img src="D:\UNI\Y2S2\OOP Project\7355082.png">
            </div>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Doctors</div>
                    <div class="card-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                </div>
                <div class="card-value">42</div>
                <div class="card-description">Active medical professionals</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Patients</div>
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="card-value">1,248</div>
                <div class="card-description">Registered in the system</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Today's Appointments</div>
                    <div class="card-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                </div>
                <div class="card-value">28</div>
                <div class="card-description">Scheduled for today</div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-title">Monthly Revenue</div>
                    <div class="card-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                </div>
                <div class="card-value">$38,450</div>
                <div class="card-description">For the current month</div>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="section-header">
            <div class="section-title">Recent Appointments</div>
            <a href="#" class="section-action">View All</a>
        </div>

        <table class="activity-table">
            <thead>
            <tr>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Date & Time</th>
                <th>Department</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>John Smith</td>
                <td>Dr. Sarah Johnson</td>
                <td>May 14, 2025 - 10:00 AM</td>
                <td>Cardiology</td>
                <td><span class="activity-status status-completed">Completed</span></td>
            </tr>
            <tr>
                <td>Emily Davis</td>
                <td>Dr. Michael Lee</td>
                <td>May 14, 2025 - 11:30 AM</td>
                <td>Neurology</td>
                <td><span class="activity-status status-pending">Pending</span></td>
            </tr>
            <tr>
                <td>Robert Wilson</td>
                <td>Dr. Lisa Taylor</td>
                <td>May 14, 2025 - 2:15 PM</td>
                <td>Orthopedics</td>
                <td><span class="activity-status status-pending">Pending</span></td>
            </tr>
            <tr>
                <td>Sophia Martinez</td>
                <td>Dr. James Anderson</td>
                <td>May 14, 2025 - 3:45 PM</td>
                <td>Pediatrics</td>
                <td><span class="activity-status status-cancelled">Cancelled</span></td>
            </tr>
            <tr>
                <td>William Brown</td>
                <td>Dr. Emma White</td>
                <td>May 15, 2025 - 9:00 AM</td>
                <td>Dermatology</td>
                <td><span class="activity-status status-pending">Pending</span></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>© 2025 MediCare. All Rights Reserved</p>
</footer>

<script>

    // Sidebar hover animation
    const sidebarItems = document.querySelectorAll('.sidebar-item');
    sidebarItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            const icon = this.querySelector('i');
            icon.style.transform = 'scale(1.1)';
        });

        item.addEventListener('mouseleave', function() {
            const icon = this.querySelector('i');
            icon.style.transform = 'scale(1)';
        });
    });

    // Animation for cards on scroll
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card');

        // Add event listener for scroll
        window.addEventListener('scroll', function() {
            cards.forEach(card => {
                const cardPosition = card.getBoundingClientRect();

                // If card is visible in viewport
                if (cardPosition.top < window.innerHeight && cardPosition.bottom > 0) {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }
            });
        });
    });
</script>
</body>
</html>