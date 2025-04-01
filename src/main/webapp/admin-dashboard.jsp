<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - Medical Appointment Scheduling</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<!-- Navigation Bar -->
<nav class="bg-blue-600 p-4">
  <div class="container mx-auto flex justify-between items-center">
    <a href="/" class="text-white text-2xl font-bold">MedSched</a>
    <a href="doctor-schedule.jsp" class="text-white">Manage Doctors</a>
    <a href="appointments.jsp" class="text-white">Appointments</a>
    <a href="logout.jsp" class="text-white">Logout</a>
  </div>
</nav>

<!-- Admin Dashboard Section -->
<section class="py-20">
  <div class="container mx-auto text-center">
    <h2 class="text-3xl font-semibold mb-6">Admin Dashboard</h2>
    <p class="text-lg mb-6">Manage your system efficiently.</p>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <!-- Admin Actions Cards -->
      <div class="bg-white p-6 rounded-lg shadow-lg">
        <h3 class="text-xl font-semibold mb-4">Manage Doctor Schedules</h3>
        <p>View and manage doctor schedules.</p>
        <a href="doctor-schedule.jsp" class="block mt-4 bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Go to Doctor Schedule</a>
      </div>

      <div class="bg-white p-6 rounded-lg shadow-lg">
        <h3 class="text-xl font-semibold mb-4">View Appointments</h3>
        <p>View and manage patient appointments.</p>
        <a href="appointments.jsp" class="block mt-4 bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Go to Appointments</a>
      </div>

      <!-- Add more admin tasks here -->
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-4 text-center">
  <p>&copy; 2025 MedSched. All rights reserved.</p>
</footer>

</body>
</html>
