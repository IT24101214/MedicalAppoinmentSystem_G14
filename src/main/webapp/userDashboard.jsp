<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.medicalsystem.User_Management.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-blue-50 font-sans min-h-screen flex flex-col">

<!-- Header (from index.jsp) -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="home" class="w-5 h-5 mr-1"></i> Home
        </a>

        <a href="feedbackList.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="message-circle" class="w-5 h-5 mr-1"></i> Feedback
        </a>
        <a href="logout.jsp" class="flex items-center text-red-600 hover:text-red-800">
            <i data-lucide="log-out" class="w-5 h-5 mr-1"></i> Logout
        </a>
    </div>
</nav>

<!-- Main Layout -->
<div class="flex flex-1">
    <!-- Sidebar -->
    <aside class="w-1/4 bg-mint-100 p-6 border-r border-mint-300 space-y-4">
        <a href="userDashboard.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="user" class="w-5 h-5 mr-2"></i> Dashboard
        </a>
        <a href="appointmentList.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="calendar-plus" class="w-5 h-5 mr-2"></i> Appointments
        </a>
        <a href="doctorList.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="stethoscope" class="w-5 h-5 mr-2"></i> Doctors
        </a>
        <a href="createPayment.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="credit-card" class="w-5 h-5 mr-2"></i> Make Payment
        </a>
        <a href="feedbackList.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="messages-square" class="w-5 h-5 mr-2"></i> View Feedbacks
        </a>
        <a href="submitFeedback.jsp" class="flex items-center text-mint-800 font-semibold hover:text-mint-600">
            <i data-lucide="edit" class="w-5 h-5 mr-2"></i> Submit Feedback
        </a>
    </aside>

    <!-- Main Content -->
    <main class="w-3/4 p-8">
        <div class="bg-white shadow-md rounded-lg border-l-4 border-mint-600 p-6">
            <h2 class="text-2xl font-bold text-mint-700 mb-4 flex items-center gap-2">
                <i data-lucide="smile" class="w-6 h-6"></i> Welcome, <%= user.getName() %>!
            </h2>
            <p class="text-gray-700 text-lg mb-2 flex items-center"><i data-lucide="mail" class="w-5 h-5 mr-2"></i>Email: <%= user.getEmail() %></p>
            <p class="text-gray-700 text-lg mb-2 flex items-center"><i data-lucide="phone" class="w-5 h-5 mr-2"></i>Phone: <%= user.getPhone() %></p>
            <p class="text-gray-700 text-lg flex items-center"><i data-lucide="badge-percent" class="w-5 h-5 mr-2"></i>NIC: <%= user.getUserId() %></p>

            <div class="mt-6">
                <a href="appointmentList.jsp" class="bg-mint-600 text-white px-6 py-2 rounded shadow hover:bg-mint-500 inline-flex items-center">
                    <i data-lucide="calendar-plus" class="w-5 h-5 mr-2"></i> Make an Appointment
                </a>
            </div>
        </div>
    </main>
</div>

<!-- Footer (same as index.jsp) -->
<footer class="bg-mint-100 text-center p-4 mt-12 text-mint-700">
    <p>&copy; 2025 MediCare. All rights reserved.</p>
</footer>

<script>
    lucide.createIcons();
</script>

<!-- Mint Theme Styles -->
<style>
    :root {
        --mint-100: #ccfbf1;
        --mint-500: #14b8a6;
        --mint-600: #0d9488;
        --mint-700: #0f766e;
        --mint-800: #115e59;
    }

    .bg-mint-100 { background-color: var(--mint-100); }
    .bg-mint-600 { background-color: var(--mint-600); }
    .bg-mint-500:hover { background-color: var(--mint-500); }
    .text-mint-700 { color: var(--mint-700); }
    .text-mint-800 { color: var(--mint-800); }
    .text-mint-600:hover { color: var(--mint-600); }
    .border-mint-300 { border-color: var(--mint-300); }
    .border-mint-600 { border-color: var(--mint-600); }
</style>

</body>
</html>
