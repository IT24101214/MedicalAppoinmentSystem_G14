<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Doctor Dashboard | MediCare</title>
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
    }

    .card h3 {
      margin-top: 0;
      color: var(--secondary);
    }

    .stat {
      font-size: 2rem;
      font-weight: bold;
      margin: 1rem 0;
    }

    .stat.appointments {
      color: var(--primary);
    }

    .stat.patients {
      color: var(--success);
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

    .status-pending {
      color: var(--warning);
      font-weight: 500;
    }

    .status-confirmed {
      color: var(--success);
      font-weight: 500;
    }

    .btn {
      padding: 0.5rem 1rem;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: 500;
    }

    .btn-primary {
      background: var(--primary);
      color: white;
    }

    .logout-btn {
      background: var(--danger);
      color: white;
      margin-top: auto;
    }
  </style>
</head>
<body>
<div class="dashboard">
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-header">
      <h2>Doctor Portal</h2>
      <p>Dr. <%= session.getAttribute("doctorName") != null ? session.getAttribute("doctorName") : "Unknown" %></p>
    </div>
    <ul class="sidebar-nav">
      <li><a href="doctorDashboard.jsp">Dashboard</a></li>
      <li><a href="appointments.jsp">Appointments</a></li>
      <li><a href="schedule.jsp">My Schedule</a></li>
      <li><a href="patients.jsp">Patients</a></li>
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

    <div class="cards">
      <div class="card">
        <h3>Today's Appointments</h3>
        <div class="stat appointments">12</div>
        <p>5 pending confirmation</p>
      </div>

      <div class="card">
        <h3>Total Patients</h3>
        <div class="stat patients">87</div>
        <p>+3 this week</p>
      </div>

      <div class="card">
        <h3>Available Slots</h3>
        <div class="stat">9</div>
        <p>For next 3 days</p>
      </div>
    </div>

    <div class="upcoming-appointments">
      <h2>Upcoming Appointments</h2>
      <table>
        <thead>
        <tr>
          <th>Patient</th>
          <th>Time</th>
          <th>Reason</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>John Smith</td>
          <td>10:00 AM</td>
          <td>Follow-up</td>
          <td class="status-confirmed">Confirmed</td>
          <td><button class="btn btn-primary">View</button></td>
        </tr>
        <tr>
          <td>Sarah Johnson</td>
          <td>11:30 AM</td>
          <td>Consultation</td>
          <td class="status-confirmed">Confirmed</td>
          <td><button class="btn btn-primary">View</button></td>
        </tr>
        <tr>
          <td>Michael Brown</td>
          <td>2:15 PM</td>
          <td>Check-up</td>
          <td class="status-pending">Pending</td>
          <td><button class="btn btn-primary">Confirm</button></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
