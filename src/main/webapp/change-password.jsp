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
    <title>Change Password - Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-blue-50 font-sans min-h-screen">

<!-- Navbar -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare Admin</div>
    <div class="space-x-4">
        <a href="adminDashboard.jsp" class="text-mint-800 hover:text-mint-600 flex items-center">
            <i data-lucide="layout-dashboard" class="w-5 h-5 mr-1"></i> Dashboard
        </a>
        <a href="logout.jsp" class="text-mint-800 hover:text-mint-600 flex items-center">
            <i data-lucide="log-out" class="w-5 h-5 mr-1"></i> Logout
        </a>
    </div>
</nav>

<!-- Form Layout -->
<div class="flex justify-center items-center h-[85vh]">
    <form action="adminServlet" method="post" class="bg-white p-8 rounded-xl shadow-md w-full max-w-md space-y-6">
        <h2 class="text-2xl font-bold text-mint-700 text-center">Change Password</h2>

        <input type="hidden" name="action" value="updatePassword">

        <div>
            <label class="block text-sm font-medium text-gray-700">Current Password</label>
            <input type="password" name="currentPassword" required class="mt-1 w-full border rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-mint-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">New Password</label>
            <input type="password" name="newPassword" required class="mt-1 w-full border rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-mint-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Confirm New Password</label>
            <input type="password" name="confirmPassword" required class="mt-1 w-full border rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-mint-400">
        </div>

        <button type="submit" class="bg-mint-600 text-white px-4 py-2 rounded-md hover:bg-mint-500 w-full">
            <i data-lucide="key-round" class="inline w-5 h-5 mr-2"></i>Update Password
        </button>
    </form>
</div>

<script>
    lucide.createIcons();
</script>

<!-- Mint Theme Styling -->
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
</style>
</body>
</html>
