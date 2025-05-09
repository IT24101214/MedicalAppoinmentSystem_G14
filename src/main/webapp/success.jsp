<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Success</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center">
  <div class="bg-white p-8 rounded-lg shadow-md text-center">
    <div class="text-green-500 text-5xl mb-4">
      <i class="bi bi-check-circle-fill"></i>
    </div>
    <h1 class="text-2xl font-bold mb-2">Doctor Added Successfully!</h1>
    <p class="mb-6">The new doctor has been added to the system.</p>
    <a href="addDoctor.jsp" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
      Add Another Doctor
    </a>
    <a href="doctorList.jsp" class="ml-4 bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">
      View Doctor List
    </a>
  </div>
</div>
</body>
</html>