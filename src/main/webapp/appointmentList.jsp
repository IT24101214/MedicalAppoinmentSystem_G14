<%@ page import="com.medicalsystem.Appointment_Management.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Appointments</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/@fortawesome/fontawesome-free/css/all.min.css">
</head>
<body class="bg-blue-50 font-sans">

<!-- Top Navbar (from index.jsp) -->
<!-- Header (from index.jsp) -->
<nav class="bg-mint-100 shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint-700">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="flex items-center text-mint-800 hover:text-mint-600">
            <i data-lucide="home" class="w-5 h-5 mr-1"></i> Logout
        </a>

    </div>
</nav>


<!-- Main Content -->
<div class="max-w-6xl mx-auto mt-10 p-6 bg-white rounded shadow">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-mint-700">My Appointments</h2>
        <a href="createAppointment.jsp" class="bg-mint-500 hover:bg-mint-600 text-white px-4 py-2 rounded shadow">
            <i class="fas fa-plus-circle mr-2"></i>Create Appointment
        </a>
    </div>

    <table class="min-w-full bg-white rounded shadow overflow-hidden">
        <thead class="bg-mint-100 text-mint-800">
        <tr>
            <th class="py-2 px-4 text-left">ID</th>
            <th class="py-2 px-4 text-left">Doctor</th>
            <th class="py-2 px-4 text-left">Date</th>
            <th class="py-2 px-4 text-left">Time</th>
            <th class="py-2 px-4 text-left">Status</th>
            <th class="py-2 px-4 text-left">Priority</th>
            <th class="py-2 px-4 text-left">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Appointment> list = (List<Appointment>) request.getAttribute("appointments");
            if (list != null) {
                for (Appointment a : list) {
        %>
        <tr class="border-t hover:bg-blue-50">
            <td class="py-2 px-4"><%= a.getAppointmentId() %></td>
            <td class="py-2 px-4"><%= a.getDoctorName() %></td>
            <td class="py-2 px-4"><%= a.getDate() %></td>
            <td class="py-2 px-4"><%= a.getTime() %></td>
            <td class="py-2 px-4"><%= a.getStatus() %></td>
            <td class="py-2 px-4"><%= a.getPriority() %></td>
            <td class="py-2 px-4 space-x-2">
                <form action="editAppointment.jsp" method="get" class="inline">
                    <input type="hidden" name="id" value="<%= a.getAppointmentId() %>">
                    <button type="submit" class="text-blue-600 hover:underline">
                        <i class="fas fa-edit"></i> Edit
                    </button>
                </form>
                <form action="deleteAppointment.jsp" method="get" class="inline">
                    <input type="hidden" name="id" value="<%= a.getAppointmentId() %>">
                    <button type="submit" class="text-red-600 hover:underline">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>


<style>
    .bg-mint-100 { background-color: #E0F2F1; }
    .bg-mint-200 { background-color: #B2DFDB; }
    .bg-mint-400 { background-color: #26A69A; }
    .bg-mint-500 { background-color: #009688; }
    .bg-mint-600 { background-color: #00796B; }
    .text-mint-700 { color: #00695C; }
    .text-mint-800 { color: #004D40; }
</style>

</body>
</html>
