<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - MediCare</title>
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
            <i data-lucide="home" class="w-5 h-5 mr-1"></i> Logout
        </a>

    </div>
</nav>

<!-- Main Body -->
<div class="flex flex-1">

    <!-- Sidebar -->
    <aside class="w-1/4 bg-white border-r border-gray-200 p-6 space-y-6 shadow-md">
        <h2 class="text-xl font-semibold text-mint-700"><i class="fas fa-bars mr-2"></i>Admin Dashboard</h2>
        <nav class="flex flex-col space-y-4 text-mint-800">
            <a href="userList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-users-cog"></i> Manage Users</a>
            <a href="appointmentList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-calendar-check"></i> Appointments</a>
            <a href="doctorScheduleList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-user-md"></i> Doctor Schedules</a>
            <a href="addDoctorSchedule.jsp" class="hover:text-mint-600 flex items-center gap-2">
                <i class="fas fa-plus-circle"></i> Add Doctor Schedule</a>
            <a href="createDoctor.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-user-plus"></i> Add Doctor</a>
            <a href="paymentList.jsp" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-credit-card"></i> Payments</a>
            <a href="FeedbackServlet" class="hover:text-mint-600 flex items-center gap-2"><i class="fas fa-comment-dots"></i> Feedback</a>
        </nav>
    </aside>



    <!-- Main Content -->
    <main class="w-3/4 p-8">
        <h2 class="text-3xl font-bold text-mint-700 mb-4">Welcome, <%= admin %>!</h2>
        <p class="text-lg text-gray-600 mb-6">Use the sidebar to manage all system components.</p>
        <div class="bg-white rounded-xl shadow p-6">
            <h3 class="text-xl font-semibold text-mint-700 mb-2">Dashboard Overview</h3>
            <p class="text-gray-700">Manage users, appointments, doctors, payments, and feedback from the navigation menu.</p>
        </div>
    </main>
</div>

<!-- Footer -->
<footer class="bg-mint-500 text-white text-center p-4">
    &copy; 2025 MediCare. All rights reserved.
</footer>

<!-- Mint Color Theme -->
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
    .bg-mint-500 { background-color: var(--mint-500); }
    .text-mint-700 { color: var(--mint-700); }
    .text-mint-800 { color: var(--mint-800); }
    .hover\:text-mint-600:hover { color: var(--mint-600); }
</style>

</body>
</html>
