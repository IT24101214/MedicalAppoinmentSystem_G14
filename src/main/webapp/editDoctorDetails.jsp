<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Doctor - MediCare</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            mint: {
              light: '#D1FAF0',
              DEFAULT: '#3EB489',
              dark: '#2C9C7F',
            }
          }
        }
      }
    }
  </script>
</head>
<body class="bg-mint-light min-h-screen flex items-center justify-center">
<div class="bg-white shadow-md rounded-lg px-10 py-8 w-full max-w-xl">
  <h2 class="text-2xl font-bold text-mint-dark mb-6 flex items-center gap-2">
    <i class="bi bi-pencil-square"></i> Edit Doctor Details
  </h2>

  <form action="DoctorServlet" method="post" class="space-y-4">
    <input type="hidden" name="action" value="update">

    <!-- Doctor ID (read-only or hidden) -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Doctor ID</label>
      <input type="text" name="doctorId" readonly value="<%= request.getParameter("doctorId") != null ? request.getParameter("doctorId") : "" %>"
             class="mt-1 block w-full border border-gray-300 rounded-md p-2 bg-gray-100">
    </div>

    <!-- Full Name -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Full Name</label>
      <input type="text" name="name" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
    </div>

    <!-- Specialization -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Specialization</label>
      <input type="text" name="specialization" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("specialization") != null ? request.getParameter("specialization") : "" %>">
    </div>

    <!-- Email Address -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Email</label>
      <input type="email" name="email" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
    </div>

    <!-- Phone Number -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Phone Number</label>
      <input type="text" name="phone" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>">
    </div>

    <!-- Qualification -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Qualification</label>
      <input type="text" name="qualification" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("qualification") != null ? request.getParameter("qualification") : "" %>">
    </div>

    <!-- Years of Experience -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Years of Experience</label>
      <input type="number" name="yearsOfExperience" required class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("yearsOfExperience") != null ? request.getParameter("yearsOfExperience") : "" %>">
    </div>

    <!-- Available Time Slots -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Available Time Slots</label>
      <input type="text" name="timeSlot" required placeholder="e.g., 10:00AM - 1:00PM"
             class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("timeSlot") != null ? request.getParameter("timeSlot") : "" %>">
    </div>

    <!-- Languages Spoken -->
    <div>
      <label class="block text-sm font-medium text-gray-700">Languages Spoken</label>
      <input type="text" name="languages" required placeholder="e.g., English, Spanish"
             class="mt-1 block w-full border border-gray-300 rounded-md p-2"
             value="<%= request.getParameter("languages") != null ? request.getParameter("languages") : "" %>">
    </div>

    <!-- Submit Button -->
    <div class="flex justify-between mt-6">
      <a href="doctorList.jsp" class="bg-gray-300 text-gray-800 px-6 py-2 rounded-md hover:bg-gray-400">
        <i class="bi bi-arrow-left-circle mr-1"></i> Back to List
      </a>
      <button type="submit" class="bg-mint-dark text-white px-6 py-2 rounded-md hover:bg-mint">
        <i class="bi bi-save mr-1"></i> Update Doctor
      </button>
    </div>
  </form>
</div>
</body>
</html>
