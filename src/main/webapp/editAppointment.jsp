<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.medicalsystem.Appointment_Management.Appointment" %>
<%
    Appointment appointment = (Appointment) request.getAttribute("appointment");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Appointment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body class="bg-blue-50 font-sans">

<!-- Top Navbar -->
<div class="flex justify-between items-center p-4 bg-mint-400 text-white shadow-md">
    <h1 class="text-xl font-bold">Medical Schedule Appointment System</h1>
    <div class="space-x-4">
        <a href="index.jsp" class="hover:underline">Home</a>
        <a href="admin.jsp" class="hover:underline">Admin</a>
        <a href="signin.jsp" class="hover:underline">Sign In</a>
        <a href="feedbackList.jsp" class="hover:underline">Feedback</a>
    </div>
</div>

<!-- Layout -->
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
        <h2 class="text-2xl font-bold text-mint-800 mb-4">Edit Appointment</h2>

        <form action="appointments" method="post" class="bg-white p-6 rounded shadow space-y-4">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= appointment.getAppointmentId() %>">

            <div>
                <label class="block font-semibold mb-1">User ID</label>
                <input type="text" name="userId" value="<%= appointment.getUserId() %>" class="w-full p-2 border rounded" required>
            </div>

            <div>
                <label class="block font-semibold mb-1">Doctor Name</label>
                <input type="text" name="doctorName" value="<%= appointment.getDoctorName() %>" class="w-full p-2 border rounded" required>
            </div>

            <div>
                <label class="block font-semibold mb-1">Date</label>
                <input type="date" name="date" value="<%= appointment.getDate() %>" class="w-full p-2 border rounded" required>
            </div>

            <div>
                <label class="block font-semibold mb-1">Time</label>
                <input type="time" name="time" value="<%= appointment.getTime() %>" class="w-full p-2 border rounded" required>
            </div>

            <div>
                <label class="block font-semibold mb-1">Status</label>
                <select name="status" class="w-full p-2 border rounded">
                    <option value="Pending" <%= "Pending".equals(appointment.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="Confirmed" <%= "Confirmed".equals(appointment.getStatus()) ? "selected" : "" %>>Confirmed</option>
                    <option value="Completed" <%= "Completed".equals(appointment.getStatus()) ? "selected" : "" %>>Completed</option>
                    <option value="Cancelled" <%= "Cancelled".equals(appointment.getStatus()) ? "selected" : "" %>>Cancelled</option>
                </select>
            </div>

            <div>
                <label class="block font-semibold mb-1">Priority</label>
                <select name="priority" class="w-full p-2 border rounded">
                    <option value="1" <%= appointment.getPriority() == 1 ? "selected" : "" %>>High</option>
                    <option value="2" <%= appointment.getPriority() == 2 ? "selected" : "" %>>Medium</option>
                    <option value="3" <%= appointment.getPriority() == 3 ? "selected" : "" %>>Low</option>
                </select>
            </div>

            <div class="flex justify-end">
                <a href="appointments" class="mr-4 text-mint-600 hover:underline">Cancel</a>
                <button type="submit" class="bg-mint-400 hover:bg-mint-500 text-white px-4 py-2 rounded shadow">
                    <i class="fas fa-save mr-2"></i>Update Appointment
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Custom Colors -->
<style>
    .bg-mint-100 { background-color: #E0F2F1; }
    .bg-mint-200 { background-color: #B2DFDB; }
    .bg-mint-400 { background-color: #26A69A; }
    .bg-mint-500 { background-color: #009688; }
    .text-mint-600 { color: #00897B; }
    .text-mint-700 { color: #00695C; }
    .text-mint-800 { color: #004D40; }
</style>

</body>
</html>
