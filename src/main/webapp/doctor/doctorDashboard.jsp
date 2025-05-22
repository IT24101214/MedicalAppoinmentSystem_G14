<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.medicalsystem.Doctor.DoctorManager" %>
<%@page import="com.medicalsystem.Doctor.Doctor" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Doctor Dashboard | MediCare</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    /* Reset & base */
    * {
      box-sizing: border-box;
    }
    body, html {
      margin: 0; padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f4f7fa;
      color: #333;
      height: 100%;
    }

    a {
      text-decoration: none;
      color: inherit;
    }

    /* Dashboard layout */
    .dashboard {
      display: flex;
      height: 100vh;
      overflow: hidden;
    }

    /* Sidebar */
    .sidebar {
      width: 280px;
      background-color: #2C3E50;
      color: #ecf0f1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 20px;
    }

    .sidebar-header h2 {
      margin: 0 0 1rem;
      font-weight: 700;
      font-size: 1.6rem;
      letter-spacing: 2px;
      border-bottom: 1px solid #34495e;
      padding-bottom: 10px;
    }

    .doctor-info {
      display: flex;
      align-items: center;
      margin-bottom: 2rem;
    }

    .doctor-avatar {
      background-color: #1abc9c;
      width: 56px;
      height: 56px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 1.8rem;
      color: white;
      margin-right: 15px;
      user-select: none;
      box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    }

    .doctor-details h3 {
      margin: 0 0 0.3rem;
      font-weight: 600;
      font-size: 1.2rem;
    }

    .doctor-details p {
      margin: 0;
      font-size: 0.9rem;
      color: #a7b1c2;
      font-style: italic;
    }

    /* Sidebar navigation */
    .sidebar-nav {
      list-style: none;
      padding: 0;
      margin: 0;
      flex-grow: 1;
    }

    .sidebar-nav li {
      margin-bottom: 15px;
    }

    .sidebar-nav a {
      display: flex;
      align-items: center;
      padding: 10px 15px;
      border-radius: 6px;
      font-size: 1rem;
      transition: background-color 0.3s ease;
      color: #ecf0f1;
    }

    .sidebar-nav a i {
      margin-right: 12px;
      font-size: 1.2rem;
      width: 24px;
      text-align: center;
    }

    .sidebar-nav a:hover,
    .sidebar-nav a.active {
      background-color: #1abc9c;
      color: white;
    }

    /* Sidebar footer */
    .sidebar-footer {
      margin-top: auto;
    }

    .btn-logout {
      width: 100%;
      padding: 12px 0;
      background-color: transparent;
      border: 2px solid #e74c3c;
      border-radius: 6px;
      color: #e74c3c;
      font-weight: 700;
      cursor: pointer;
      font-size: 1rem;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .btn-logout i {
      margin-right: 8px;
      font-size: 1.2rem;
    }

    .btn-logout:hover {
      background-color: #e74c3c;
      color: white;
    }

    /* Main content */
    .main-content {
      flex-grow: 1;
      background-color: white;
      padding: 30px 40px;
      overflow-y: auto;
      display: flex;
      flex-direction: column;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }

    .header h1 {
      margin: 0;
      font-weight: 700;
      font-size: 2rem;
      color: #34495e;
    }

    .header-date {
      display: flex;
      align-items: center;
      font-size: 1rem;
      color: #7f8c8d;
    }

    .header-date i {
      margin-right: 8px;
      font-size: 1.2rem;
    }

    /* Cards container */
    .cards {
      display: flex;
      gap: 20px;
      margin-bottom: 35px;
    }

    /* Individual cards */
    .card {
      background-color: #f8f9fa;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      flex: 1;
      padding: 25px 30px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      opacity: 0;
      transform: translateY(20px);
      transition: opacity 0.4s ease, transform 0.4s ease;
    }

    .card-icon {
      font-size: 2.5rem;
      margin-bottom: 15px;
      color: #3498db;
      user-select: none;
    }

    .card-icon.appointments {
      color: #3498db;
    }
    .card-icon.patients {
      color: #9b59b6;
    }
    .card-icon.slots {
      color: #e67e22;
    }

    .card h3 {
      margin: 0 0 10px;
      font-weight: 700;
      color: #2c3e50;
      font-size: 1.25rem;
    }

    .stat {
      font-size: 2.5rem;
      font-weight: 700;
      color: #34495e;
      margin-bottom: 10px;
      user-select: none;
    }

    .card-footer {
      font-size: 0.85rem;
      color: #7f8c8d;
      user-select: none;
    }

    /* Section */
    .section {
      margin-bottom: 40px;
    }

    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .section-header h2 {
      margin: 0;
      font-weight: 700;
      font-size: 1.6rem;
      color: #34495e;
    }

    .badge {
      background-color: #1abc9c;
      color: white;
      font-weight: 600;
      font-size: 0.9rem;
      padding: 5px 12px;
      border-radius: 50px;
      user-select: none;
    }

    .btn-view-all {
      background-color: transparent;
      border: none;
      color: #1abc9c;
      font-weight: 600;
      font-size: 0.95rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 6px;
      user-select: none;
      padding: 0;
      transition: color 0.3s ease;
    }

    .btn-view-all:hover {
      color: #16a085;
    }

    /* Tables */
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.95rem;
      user-select: none;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ecf0f1;
      vertical-align: middle;
    }

    thead {
      background-color: #ecf0f1;
    }

    tbody tr:hover {
      background-color: #f1f5f8;
    }

    /* Status labels */
    .status {
      display: inline-block;
      padding: 4px 10px;
      border-radius: 12px;
      font-size: 0.8rem;
      font-weight: 600;
      color: white;
      user-select: none;
    }

    .status-confirmed {
      background-color: #27ae60;
    }

    .status-pending {
      background-color: #e67e22;
    }

    /* Buttons in table */
    .btn-action {
      border: none;
      padding: 6px 12px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 600;
      font-size: 0.85rem;
      transition: background-color 0.3s ease;
      user-select: none;
    }

    .btn-primary {
      background-color: #1abc9c;
      color: white;
    }

    .btn-primary:hover {
      background-color: #16a085;
    }

    .btn-outline {
      background-color: transparent;
      border: 2px solid #1abc9c;
      color: #1abc9c;
    }

    .btn-outline:hover {
      background-color: #1abc9c;
      color: white;
    }

  </style>
</head>
<body>
<div class="dashboard">
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-header">
      <h2>Doctor Portal</h2>
      <%
        // Fetch doctorName and specialization safely from session
        String doctorName = (String) session.getAttribute("doctorName");
        String doctorSpecialization = (String) session.getAttribute("doctorSpecialization");
        char doctorInitial = (doctorName != null && !doctorName.isEmpty()) ? doctorName.charAt(0) : '?';
      %>
      <div class="doctor-info">
        <div class="doctor-avatar">
          <%= doctorInitial %>
        </div>
        <div class="doctor-details">
          <h3><%= doctorName != null ? "Dr. " + doctorName : "Doctor" %></h3>
          <p><%= doctorSpecialization != null ? doctorSpecialization : "" %></p>
        </div>
      </div>
    </div>

    <ul class="sidebar-nav">
      <li><a href="doctorDashboard.jsp" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
      <li><a href="appointments.jsp"><i class="fas fa-calendar-check"></i> Appointments</a></li>
      <li><a href="schedule.jsp"><i class="fas fa-calendar-alt"></i> My Schedule</a></li>
      <li><a href="patients.jsp"><i class="fas fa-user-injured"></i> Patients</a></li>
      <li><a href="profile.jsp"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>

    <div class="sidebar-footer">
      <form action="${pageContext.request.contextPath}/logout" method="post">
        <button type="submit" class="btn-logout"><i class="fas fa-sign-out-alt"></i> Logout</button>
      </form>
    </div>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h1>Dashboard</h1>
      <div class="header-date">
        <i class="far fa-calendar-alt"></i>
        <%= new java.text.SimpleDateFormat("EEEE, MMMM dd, yyyy").format(new java.util.Date()) %>
      </div>
    </div>

    <div class="cards">
      <div class="card">
        <div class="card-icon appointments">
          <i class="fas fa-calendar-check"></i>
        </div>
        <h3>Today's Appointments</h3>
        <div class="stat appointments">8</div>
        <div class="card-footer">2 pending confirmation</div>
      </div>

      <div class="card">
        <div class="card-icon patients">
          <i class="fas fa-user-injured"></i>
        </div>
        <h3>Total Patients</h3>
        <div class="stat patients">42</div>
        <div class="card-footer">+3 this week</div>
      </div>

      <div class="card">
        <div class="card-icon slots">
          <i class="fas fa-clock"></i>
        </div>
        <h3>Available Slots</h3>
        <div class="stat slots">5</div>
        <div class="card-footer">For next 2 days</div>
      </div>
    </div>

    <div class="section">
      <div class="section-header">
        <h2>Today's Schedule</h2>
        <span class="badge">Today</span>
      </div>

      <table>
        <thead>
        <tr>
          <th>Time</th>
          <th>Patient</th>
          <th>Type</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>09:00 AM</td>
          <td>John Smith</td>
          <td>Consultation</td>
          <td><span class="status status-confirmed">Confirmed</span></td>
          <td><button class="btn-action btn-primary">View</button></td>
        </tr>
        <tr>
          <td>10:30 AM</td>
          <td>Sarah Johnson</td>
          <td>Follow-up</td>
          <td><span class="status status-confirmed">Confirmed</span></td>
          <td><button class="btn-action btn-primary">View</button></td>
        </tr>
        <tr>
          <td>11:45 AM</td>
          <td>Michael Brown</td>
          <td>Check-up</td>
          <td><span class="status status-pending">Pending</span></td>
          <td>
            <button class="btn-action btn-primary" style="margin-right: 0.5rem;">Confirm</button>
            <button class="btn-action btn-outline">Reschedule</button>
          </td>
        </tr>
        <tr>
          <td>02:15 PM</td>
          <td>Emily Davis</td>
          <td>Consultation</td>
          <td><span class="status status-confirmed">Confirmed</span></td>
          <td><button class="btn-action btn-primary">View</button></td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="section">
      <div class="section-header">
        <h2>Upcoming Appointments</h2>
        <button class="btn-view-all">View All <i class="fas fa-chevron-right"></i></button>
      </div>

      <table>
        <thead>
        <tr>
          <th>Date</th>
          <th>Time</th>
          <th>Patient</th>
          <th>Type</th>
          <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><%= new java.text.SimpleDateFormat("MMM dd").format(java.util.Calendar.getInstance().getTime()) %></td>
          <td>03:30 PM</td>
          <td>Robert Wilson</td>
          <td>Follow-up</td>
          <td><span class="status status-confirmed">Confirmed</span></td>
        </tr>
        <tr>
          <td><%= new java.text.SimpleDateFormat("MMM dd").format(new java.util.Date(new java.util.Date().getTime() + 86400000)) %></td>
          <td>10:00 AM</td>
          <td>Jennifer Lee</td>
          <td>Consultation</td>
          <td><span class="status status-confirmed">Confirmed</span></td>
        </tr>
        <tr>
          <td><%= new java.text.SimpleDateFormat("MMM dd").format(new java.util.Date(new java.util.Date().getTime() + 2 * 86400000)) %></td>
          <td>11:15 AM</td>
          <td>David Miller</td>
          <td>Check-up</td>
          <td><span class="status status-pending">Pending</span></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script>
  // Simple animation for cards on page load
  document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
      setTimeout(() => {
        card.style.opacity = '1';
        card.style.transform = 'translateY(0)';
      }, index * 100);
    });
  });
</script>
</body>
</html>
