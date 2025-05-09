<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Admin Credentials</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-blue-50 min-h-screen flex items-center justify-center">
<div class="bg-white shadow-md rounded px-10 pt-8 pb-6 w-full max-w-lg border-t-4 border-blue-400">
    <h2 class="text-2xl font-bold text-blue-500 mb-4 text-center">
        <i class="bi bi-pencil-square"></i> Change Admin Credentials
    </h2>

    <form action="admin-dashboard" method="post" class="space-y-4">
        <div>
            <label class="block text-gray-700 font-semibold">New Username</label>
            <input type="text" name="newUsername" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">New Password</label>
            <input type="password" name="newPassword" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">Confirm New Password</label>
            <input type="password" name="confirmPassword" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>

        <div class="text-center">
            <button type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-full font-semibold">
                <i class="bi bi-check-circle"></i> Save Changes
            </button>
        </div>
    </form>
</div>
</body>
</html>
