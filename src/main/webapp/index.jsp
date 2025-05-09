<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medical Appointment System</title>
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Lucide Icons CDN -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-blue-50 font-sans min-h-screen">

<!-- Navbar -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="home" class="w-5 h-5 mr-1"></i> Home
        </a>
        <a href="adminLogin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="shield" class="w-5 h-5 mr-1"></i> Admin
        </a>

        <a href="FeedbackServlet" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="message-circle" class="w-5 h-5 mr-1"></i> Feedback
        </a>

        <a href="doctorLogin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="log-in" class="w-5 h-5 mr-1"></i> Doctor
        </a>

        <a href="userLogin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="log-in" class="w-5 h-5 mr-1"></i> Sign In
        </a>


    </div>
</nav>

<!-- Main Content -->
<!-- Main Content -->
<div class="flex justify-center items-center h-[80vh]">
    <div class="text-center space-y-6">
        <h1 class="text-4xl font-bold text-mint-700">Welcome to MediCare</h1>
        <p class="text-lg text-gray-600">Your trusted medical appointment scheduler</p>

        <!-- Make Appointment Button -->
        <a href="createUser.jsp" class="bg-mint-600 hover:bg-mint-500 text-white px-6 py-3 rounded-full flex items-center shadow-md justify-center w-fit mx-auto">
            <i data-lucide="calendar-plus" class="w-5 h-5 mr-2"></i> Make Appointment
        </a>
    </div>
</div>

<!-- Footer -->
<footer class="bg-mint-100 text-center p-4 mt-12 text-mint-700">
    <p>&copy; 2025 MediCare. All rights reserved.</p>
</footer>

<script>
    lucide.createIcons();
</script>

<!-- Custom Mint Blue Theme -->
<style>
    :root {
        --mint-50: #f0fdfa;
        --mint-100: #ccfbf1;
        --mint-200: #99f6e4;
        --mint-300: #5eead4;
        --mint-400: #2dd4bf;
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
    .border-mint-400 { border-color: var(--mint-400); }
    .bg-mint-100:hover { background-color: var(--mint-100); }
</style>
</body>
</html>
