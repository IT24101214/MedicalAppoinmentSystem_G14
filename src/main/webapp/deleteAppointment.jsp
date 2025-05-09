<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.medicalsystem.Appointment_Management.Appointment" %>
<%
    Appointment appointment = (Appointment) request.getAttribute("appointment");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Appointment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body class="bg-blue-50 font-sans">

<!-- Top Navbar -->
<div class="flex justify-between items-center p-4 bg-mint-400 shadow-md text-white">
    <h1 class="text-xl font-bold">Medical Schedule Appointment System</h1>
    <div class="space-x-4">
        <a href="index.jsp" class="hover:underline">Home</a>
        <a href="admin.jsp" class="hover:underline">Admin</a>
        <a href="signin.jsp" class="hover:underline">Sign In</a>
        <a href="feedbackList.jsp" class="hover:underline">Feedback</a>
    </div>
</div>

<!-- Admin Layout -->
<div class="flex">
    <!-- Sidebar -->
    <div class="w-1/4 bg-white p-4 shadow-md h-screen">
        <h2 class="text-lg font-semibold mb-4 text-mint-700">Admin Panel</h2>
        <ul class="space-y-2">
            <li><a href="admin.jsp" class="block p-2 hover:bg-mint-100 rounded">Admin</a></li>
            <li><a href="users.jsp" class="block p-2 hover:bg-mint-100 rounded">User</a></li>
            <li><a href="doctorSchedule.jsp" class="block p-2 hover:bg-mint-100 rounded">Doctor Schedule</a></li>
            <li><a href="appointments" class="block p-2 bg-mint-200 text-mint-800 rounded">Appointment Details</a></li>
            <li><a href="payments.jsp" class="block p-2 hover:bg-mint-100 rounded">Payments</a></li>
            <li><a href="feedbacks.jsp" class="block p-2 hover:bg-mint-100 rounded">Feedback</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="w-3/4 p-6">
        <h2 class="text-2xl font-bold text-red-600 mb-4">Confirm Delete Appointment</h2>

        <div class="bg-white p-6 rounded shadow space-y-4 border border-red-300">
            <p class="text-lg text-gray-700">
                Are you sure you want to delete the following appointment?
            </p>

            <div class="space-y-2">
                <p><strong>User ID:</strong> <%= appointment.getUserId() %></p>
                <p><strong>Doctor Name:</strong> <%= appointment.getDoctorName() %></p>
                <p><strong>Date:</strong> <%= appointment.getDate() %></p>
                <p><strong>Time:</strong> <%= appointment.getTime() %></p>
                <p><strong>Status:</strong> <%= appointment.getStatus() %></p>
                <p><strong>Priority:</strong> <%= appointment.getPriority() %></p>
            </div>

            <form action="appointments" method="post" class="flex justify-end space-x-4 mt-4">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= appointment.getId() %>">
                <a href="appointments" class="text-mint-600 hover:underline">Cancel</a>
                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded shadow">
                    <i class="fas fa-trash mr-2"></i>Delete
                </button>
            </form>
        </div>
    </div>
</div>

<style>
    .bg-mint-100 { background-color: #E0F2F1; }
    .bg-mint-200 { background-color: #B2DFDB; }
    .bg-mint-400 { background-color: #26A69A; }
    .text-mint-600 { color: #00897B; }
    .text-mint-700 { color: #00695C; }
    .text-mint-800 { color: #004D40; }
</style>

</body>
</html>
