<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book Appointment - Medical Appointment Scheduling</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<!-- Navigation Bar -->
<nav class="bg-blue-600 p-4">
  <div class="container mx-auto flex justify-between items-center">
    <a href="/" class="text-white text-2xl font-bold">MedSched</a>
    <a href="doctor-schedule.jsp" class="text-white">Doctor Schedule</a>
    <a href="logout.jsp" class="text-white">Logout</a>
  </div>
</nav>

<!-- Book Appointment Section -->
<section class="py-20">
  <div class="container mx-auto w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
    <h2 class="text-3xl font-semibold text-center mb-6">Book Your Appointment</h2>
    <form action="appointmentServlet" method="POST">
      <div class="mb-4">
        <label for="doctorName" class="block text-sm font-medium text-gray-700">Select Doctor</label>
        <select id="doctorName" name="doctorName" class="w-full px-4 py-2 mt-1 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
          <option value="">Select a Doctor</option>
          <option value="Dr. John Doe">Dr. John Doe</option>
          <option value="Dr. Jane Smith">Dr. Jane Smith</option>
          <!-- Add more doctors here -->
        </select>
      </div>

      <div class="mb-4">
        <label for="timeSlot" class="block text-sm font-medium text-gray-700">Select Time Slot</label>
        <select id="timeSlot" name="timeSlot" class="w-full px-4 py-2 mt-1 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
          <option value="">Select a Time Slot</option>
          <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
          <option value="1:00 PM - 2:00 PM">1:00 PM - 2:00 PM</option>
          <!-- Add time slots here -->
        </select>
      </div>

      <div class="mb-4">
        <button type="submit" class="w-full bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Book Appointment</button>
      </div>
    </form>
  </div>
</section>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-4 text-center">
  <p>&copy; 2025 MedSched. All rights reserved.</p>
</footer>

</body>
</html>
