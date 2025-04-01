<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointment - Medical Appointment Scheduling</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<!-- Navigation Bar -->
<nav class="bg-blue-600 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="/" class="text-white text-2xl font-bold">MedSched</a>
        <a href="doctor-schedule.jsp" class="text-white">Doctor Schedule</a>
        <a href="book-appointment.jsp" class="text-white">Book Appointment</a>
        <a href="logout.jsp" class="text-white">Logout</a>
    </div>
</nav>

<!-- View Appointment Section -->
<section class="py-20">
    <div class="container mx-auto text-center">
        <h2 class="text-3xl font-semibold mb-8">Your Appointments</h2>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h3 class="text-xl font-semibold mb-4">Appointment Details</h3>

            <p class="mb-2"><strong>Doctor:</strong> Dr. John Doe</p>
            <p class="mb-2"><strong>Date & Time:</strong> 10:00 AM - 11:00 AM</p>
            <p class="mb-2"><strong>Status:</strong> Confirmed</p>

            <a href="billing.jsp" class="block text-center mt-4 bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Proceed to Billing</a>
        </div>

        <!-- Add more appointments if needed -->
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-4 text-center">
    <p>&copy; 2025 MedSched. All rights reserved.</p>
</footer>

</body>
</html>
