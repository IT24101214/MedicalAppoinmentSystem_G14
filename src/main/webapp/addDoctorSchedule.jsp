<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Doctor Schedule - MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-mint-50 min-h-screen font-sans">

<!-- Header -->
<nav class="bg-mint-100 p-4 shadow-md flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare</div>
    <a href="adminDashboard.jsp" class="text-mint-800 hover:text-mint-600">Back to Dashboard</a>
</nav>

<!-- Form Section -->
<div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded-xl shadow-md">
    <h2 class="text-2xl font-bold text-mint-700 mb-6">Add Doctor Schedule</h2>
    <form action="addDoctorSchedule" method="post" class="space-y-4">

        <div>
            <label for="scheduleId" class="block text-mint-800 font-medium">Schedule ID</label>
            <input type="text" name="scheduleId" id="scheduleId" required class="w-full border border-gray-300 p-2 rounded-md">
        </div>

        <div>
            <label for="doctorId" class="block text-mint-800 font-medium">Doctor ID</label>
            <input type="text" name="doctorId" id="doctorId" required class="w-full border border-gray-300 p-2 rounded-md">
        </div>

        <div>
            <label for="date" class="block text-mint-800 font-medium">Date</label>
            <input type="date" name="date" id="date" required class="w-full border border-gray-300 p-2 rounded-md">
        </div>

        <div>
            <label for="startTime" class="block text-mint-800 font-medium">Start Time</label>
            <input type="time" name="startTime" id="startTime" required class="w-full border border-gray-300 p-2 rounded-md">
        </div>

        <div>
            <label for="endTime" class="block text-mint-800 font-medium">End Time</label>
            <input type="time" name="endTime" id="endTime" required class="w-full border border-gray-300 p-2 rounded-md">
        </div>

        <div>
            <label for="status" class="block text-mint-800 font-medium">Status</label>
            <select name="status" id="status" required class="w-full border border-gray-300 p-2 rounded-md">
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
                <option value="Completed">Completed</option>
            </select>
        </div>

        <button type="submit" class="bg-mint-600 text-white px-4 py-2 rounded-md hover:bg-mint-700">Add Schedule</button>
    </form>
</div>

<!-- Mint Theme -->
<style>
    :root {
        --mint-50: #f0fdfa;
        --mint-100: #ccfbf1;
        --mint-600: #2bb9ad;
        --mint-700: #0f766e;
        --mint-800: #115e59;
    }
    .bg-mint-50 { background-color: var(--mint-50); }
    .bg-mint-100 { background-color: var(--mint-100); }
    .text-mint-700 { color: var(--mint-700); }
    .text-mint-800 { color: var(--mint-800); }
    .bg-mint-600 { background-color: var(--mint-600); }
    .hover\:bg-mint-700:hover { background-color: var(--mint-700); }
</style>

</body>
</html>
