<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedZone - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background {
            background-image: url('css/home-bg.jpg'); /* Replace with your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
    </style>
</head>
<body class="background h-screen flex flex-col justify-between">

<!-- Header -->
<header class="bg-white bg-opacity-80 p-6 shadow-md flex justify-between items-center">
    <h1 class="text-4xl font-bold text-blue-600">MedZone</h1>
    <div>
        <a href="login.jsp" class="text-blue-500 hover:text-blue-700 font-semibold px-6">Login</a>
        <a href="register.jsp" class="bg-blue-500 text-white px-6 py-3 rounded-lg hover:bg-blue-700">Register</a>
    </div>
</header>

<!-- Main Content -->
<main class="flex flex-col items-center justify-center flex-grow text-center px-6">
    <div class="bg-blue-700 bg-opacity-75 p-12 rounded-3xl shadow-md max-w-lg w-full">
        <h2 class="text-4xl font-semibold text-white mb-4">Your health is our priority.</h2>
        <p class="text-2xl font-semibold text-white mb-6">Stay healthy, stay happy!</p>
        <a href="book-appointment.jsp" class="mt-6 bg-green-500 text-white px-10 py-5 rounded-full text-lg font-semibold hover:bg-green-700 transition">Make Appointment</a>
    </div>
</main>

<!-- Footer -->
<footer class="bg-gray-800 text-white text-center p-6 mt-auto">
    <p>&copy; 2025 MedZone. All Rights Reserved.</p>
</footer>

</body>
</html>
