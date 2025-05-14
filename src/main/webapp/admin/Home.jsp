<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Medical Appointment System</title>
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
      flex-wrap: wrap;
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

    .admindash-btn, .doctor-btn, .patient-btn, .appointment-btn, .payment-btn, .feedback-btn {
      background: var(--primary);
      color: white;
      border: none;
      padding: 0.6rem 1.2rem;
      border-radius: 4px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
      text-decoration: none;
      display: inline-block;
      margin-left: 0.5rem;
    }

    .admindash-btn:hover,
    .doctor-btn:hover,
    .patient-btn:hover,
    .appointment-btn:hover,
    .payment-btn:hover,
    .feedback-btn:hover {
      background: #2980b9;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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

    .primary-btn {
      background: var(--primary);
      color: white;
      padding: 0.8rem 1.5rem;
      border-radius: 4px;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s;
    }

    .primary-btn:hover {
      background: #2980b9;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    footer {
      background: var(--secondary);
      color: white;
      text-align: center;
      padding: 1.5rem;
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

    <!-- Fixed Links -->
    <a href="<%=contextPath%>/admin/dashboard.jsp" class="admindash-btn">Admin Dashboard</a>
    <a href="<%=contextPath%>/doctor/doctorDashboard.jsp" class="doctor-btn">Doctor</a>
    <a href="<%=contextPath%>/patient/patientDashboard.jsp" class="patient-btn">Patient</a>
    <a href="<%=contextPath%>/AppointmentListServlet" class="appointment-btn">Appointment</a>
    <a href="<%=contextPath%>/PaymentListServlet" class="payment-btn">Payment</a>
    <a href="<%=contextPath%>/FeedbackListServlet" class="feedback-btn">Feedback</a>
  </div>
</header>

<main>
  <h1>Your Trusted Medical Appointment System</h1>
  <p>Streamline your healthcare experience with our comprehensive appointment scheduling platform.
    Connect with top doctors, manage your health records, and receive personalized care - all in one place.</p>


</main>

<footer>
  <p>&copy; 2025 MediCare|G14. All rights reserved.</p>
</footer>
</body>
</html>
