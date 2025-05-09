<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String doctor = (String) session.getAttribute("doctorId");
    if (doctor == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard - MediCare</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-mint-50 flex flex-col min-h-screen font-sans">

<!-- Header -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i class="fas fa-sign-out-alt mr-1"></i> Logout
        </a>
    </div>
</nav>

<!-- Main Body -->
<div class="flex flex-1">

    <!-- Sidebar -->
    <!-- Sidebar -->
    <aside class="w-1/4 bg-white border-r border-gray-200 p-6 space-y-6 shadow-md">
        <h2 class="text-xl font-semibold text-mint-700"><i class="fas fa-bars mr-2"></i>Doctor Dashboard</h2>
        <nav class="flex flex-col space-y-4 text-mint-800">
            <a href="doctorList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-user-md"></i> View Doctors</a>
            <a href="userList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-users"></i> View Users</a>
            <a href="appointmentList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-calendar-check"></i> Appointments</a>
            <a href="DoctorScheduleListServlet" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-clock"></i> Doctor Schedules</a>
            <a href="ViewDoctorScheduleServlet" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-clock"></i> My Schedules</a>
            <a href="FeedbackServlet" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-comment-dots"></i> Feedback</a>
        </nav>
    </aside>


    <!-- Main Content -->
    <main class="w-3/4 p-8 relative">
    <h2 class="text-3xl font-bold text-mint-700 mb-4">Welcome!</h2>
        <p class="text-lg text-gray-600 mb-6">Access your tools and patient information using the navigation menu.</p>
        <div class="bg-white rounded-xl shadow p-6">
            <h3 class="text-xl font-semibold text-mint-700 mb-2">Dashboard Overview</h3>
            <p class="text-gray-700">View appointments, user list, fellow doctors, and patient feedback.</p>
        </div>
        <!-- Small Daily Calendar -->
        <div class="absolute bottom-8 right-8 bg-white shadow-md border rounded-xl p-4 w-60 text-center">
            <h4 class="text-lg font-semibold text-mint-700 mb-2">Today's Date</h4>
            <div id="calendarDate" class="text-2xl text-mint-800 font-bold"></div>
        </div>



    </main>
</div>

<!-- Footer -->
<footer class="bg-mint-500 text-white text-center p-4">
    &copy; 2025 MediCare. All rights reserved.
</footer>

<!-- Mint Theme -->
<style>
    :root {
        --mint-50: #f0fdfa;
        --mint-100: #ccfbf1;
        --mint-500: #3dcabf;
        --mint-600: #2bb9ad;
        --mint-700: #0f766e;
        --mint-800: #115e59;
    }
    .bg-mint-50 { background-color: var(--mint-50); }
    .bg-mint-100 { background-color: var(--mint-100); }
    .bg-mint-500 { background-color: var(--mint-500); }
    .text-mint-700 { color: var(--mint-700); }
    .text-mint-800 { color: var(--mint-800); }
    .hover\:text-mint-600:hover { color: var(--mint-600); }
</style>

<script>
    const calendarElement = document.getElementById("calendarDate");
    const today = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    calendarElement.textContent = today.toLocaleDateString('en-US', options);
</script>


</body>
</html>
