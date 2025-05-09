<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Create Appointment</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://unpkg.com/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body class="bg-blue-50 font-sans">

<!-- Navbar -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
  <div class="text-2xl font-bold text-mint-700">MediCare</div>
  <div class="space-x-6 flex items-center">
    <a href="index.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
      <i class="fas fa-home mr-1"></i> Home
    </a>
    <a href="admin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
      <i class="fas fa-user-shield mr-1"></i> Admin
    </a>
    <a href="signin.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
      <i class="fas fa-sign-in-alt mr-1"></i> Sign In
    </a>
    <a href="feedbackList.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
      <i class="fas fa-comment-dots mr-1"></i> Feedback
    </a>
  </div>
</nav>

<!-- Main Form Section -->
<div class="max-w-4xl mx-auto mt-10 p-6 bg-white rounded shadow">
  <h2 class="text-2xl font-bold text-mint-700 mb-6">Create New Appointment</h2>

  <form action="appointments" method="post" class="space-y-4">
    <input type="hidden" name="action" value="create">

    <!-- Full Name -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Full Name</label>
      <input type="text" name="fullName" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Phone Number -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Phone Number</label>
      <input type="text" name="phoneNumber" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Gender -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Gender</label>
      <select name="gender" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
      </select>
    </div>

    <!-- Age / Date of Birth -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Age / Date of Birth</label>
      <input type="date" name="dob" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Reason for Visit -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Reason for Visit</label>
      <textarea name="reason" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400"></textarea>
    </div>

    <!-- Preferred Date -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Preferred Date</label>
      <input type="date" name="preferredDate" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Preferred Time Slot -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Preferred Time Slot</label>
      <select name="preferredTime" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
        <option value="Morning">Morning</option>
        <option value="Afternoon">Afternoon</option>
        <option value="Evening">Evening</option>
      </select>
    </div>

    <!-- Specialist Required -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Specialist Required</label>
      <select name="specialist" required class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
        <option value="Cardiologist">Cardiologist</option>
        <option value="Dermatologist">Dermatologist</option>
        <option value="Pediatrician">Pediatrician</option>
        <option value="Neurologist">Neurologist</option>
        <option value="Orthopedist">Orthopedist</option>
        <!-- Add more specialists as needed -->
      </select>
    </div>

    <!-- Insurance Provider -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Insurance Provider</label>
      <input type="text" name="insuranceProvider" class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Policy Number -->
    <div>
      <label class="block text-mint-800 font-semibold mb-1">Policy Number</label>
      <input type="text" name="policyNumber" class="w-full p-2 border rounded focus:outline-none focus:ring-2 focus:ring-mint-400">
    </div>

    <!-- Consent for Treatment -->
    <div class="flex items-center">
      <input type="checkbox" name="consent" required class="mr-2">
      <label class="text-mint-800">I consent to treatment</label>
    </div>

    <!-- Submit Button -->
    <div class="flex justify-end space-x-4 pt-4">
      <a href="appointments" class="text-mint-600 hover:underline">Cancel</a>
      <button type="submit" class="bg-mint-500 hover:bg-mint-600 text-white px-4 py-2 rounded shadow">
        <i class="fas fa-check-circle mr-2"></i>Submit
      </button>
    </div>
  </form>
</div>

<style>
  .bg-mint-100 { background-color: #E0F2F1; }
  .bg-mint-500 { background-color: #009688; }
  .bg-mint-600 { background-color: #00796B; }
  .text-mint-600 { color: #00897B; }
  .text-mint-700 { color: #00695C; }
  .text-mint-800 { color: #004D40; }
</style>

</body>
</html>
