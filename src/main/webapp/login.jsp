<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - MedZone</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<!-- Header -->
<header class="bg-blue-600 text-white py-6 shadow-md">
    <div class="container mx-auto flex justify-between items-center px-6">
        <h1 class="text-3xl font-bold">MedZone</h1>
        <div>
            <a href="register.jsp" class="bg-white text-blue-600 px-4 py-2 rounded-lg mr-4 hover:bg-gray-200">Register</a>
            <a href="login.jsp" class="bg-white text-blue-600 px-4 py-2 rounded-lg hover:bg-gray-200">Login</a>
        </div>
    </div>
</header>

<!-- Login Form Section -->
<section class="flex justify-center items-center py-20">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-semibold text-center mb-6">Login to Your Account</h2>
        <form action="loginServlet" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" id="username" name="username" required class="w-full px-4 py-2 mt-1 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" id="password" name="password" required class="w-full px-4 py-2 mt-1 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div class="flex items-center justify-between">
                <button type="submit" class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Login</button>
            </div>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="bg-blue-600 text-white text-center py-4 mt-auto">
    <p>&copy; 2025 MedZone. All Rights Reserved.</p>
</footer>

</body>
</html>
