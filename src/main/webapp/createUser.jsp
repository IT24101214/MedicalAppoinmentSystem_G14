<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create User</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-blue-50 min-h-screen flex items-center justify-center">
<div class="bg-white shadow-md rounded px-10 pt-8 pb-6 w-full max-w-lg border-t-4 border-blue-400">
    <h2 class="text-2xl font-bold text-blue-500 mb-4 text-center">
        <i class="bi bi-person-plus-fill"></i> Create User Account
    </h2>


    <% String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) { %>
    <div class="bg-red-100 text-red-700 p-2 rounded mb-4 text-sm">
        <i class="bi bi-exclamation-circle"></i> <%= errorMessage %>
    </div>
    <% } %>

    <form action="createUser" method="post" class="space-y-4">
        <div>
            <label class="block text-gray-700 font-semibold">NIC (12 digits)</label>
            <input type="text" name="userId" required pattern="\d{12}" placeholder="Eg: 200012345678"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">Password</label>
            <input type="password" name="password"
                   pattern="(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}" required
                   placeholder="Min 8 chars, 1 number & 1 symbol"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">Name</label>
            <input type="text" name="name" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">Email</label>
            <input type="email" name="email" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>
        <div>
            <label class="block text-gray-700 font-semibold">Phone</label>
            <input type="text" name="phone" required
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"/>
        </div>

        <div class="text-center">
            <button type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-full font-semibold">
                <i class="bi bi-check-circle"></i> Create Account
            </button>
        </div>
    </form>


</div>
</body>
</html>
