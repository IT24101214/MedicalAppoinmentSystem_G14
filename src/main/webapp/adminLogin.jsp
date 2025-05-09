<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login | MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
        <a href="adminLogin.jsp" class="flex items-center text-mint-800 hover:text-mint-600 font-semibold">
            <i data-lucide="shield" class="w-5 h-5 mr-1"></i> Admin
        </a>

        <a href="userLogin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="log-in" class="w-5 h-5 mr-1"></i> Sign In
        </a>
    </div>
</nav>

<!-- Login Form -->
<div class="flex justify-center items-center h-[80vh]">
    <form action="AdminServlet" method="post" class="bg-white p-8 rounded-xl shadow-md w-full max-w-md space-y-6">
        <h2 class="text-2xl font-bold text-mint-700 text-center">Admin Login</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="text-red-500 text-sm text-center"><%= error %></div>
        <% } %>

        <input type="hidden" name="action" value="login"/>

        <div>
            <label class="block text-gray-700 mb-1">Username</label>
            <input type="text" name="username" required class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
        </div>

        <div>
            <label class="block text-gray-700 mb-1">Password</label>
            <input type="password" name="password" required class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
        </div>

        <button type="submit" class="bg-mint-600 hover:bg-mint-500 text-white px-4 py-2 rounded w-full flex justify-center items-center">
            <i data-lucide="log-in" class="w-4 h-4 mr-2"></i> Login
        </button>
    </form>
</div>

<script>lucide.createIcons();</script>
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
</style>
</body>
</html>
