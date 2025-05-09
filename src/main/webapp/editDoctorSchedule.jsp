<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.medicalsystem.DoctorSchedule_Management.DoctorSchedule" %>
<%
    DoctorSchedule schedule = (DoctorSchedule) request.getAttribute("schedule");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Doctor Schedule</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 py-10">
<div class="max-w-xl mx-auto bg-white p-8 rounded-xl shadow-md">
    <h2 class="text-2xl font-bold text-teal-700 mb-6 text-center">Edit Doctor Schedule</h2>
    <form action="doctor-schedule" method="post" class="space-y-4">
        <input type="hidden" name="action" value="update" />
        <input type="text" name="scheduleId" value="<%= schedule.getScheduleId() %>" class="w-full border rounded p-2" readonly />
        <input type="text" name="doctorName" value="<%= schedule.getDoctorName() %>" class="w-full border rounded p-2" required />
        <input type="text" name="specialization" value="<%= schedule.getSpecialization() %>" class="w-full border rounded p-2" required />
        <input type="date" name="date" value="<%= schedule.getDate() %>" class="w-full border rounded p-2" required />
        <input type="text" name="timeSlot" value="<%= schedule.getTimeSlot() %>" class="w-full border rounded p-2" required />
        <label class="flex items-center space-x-2">
            <input type="checkbox" name="available" class="form-checkbox" <%= schedule.isAvailable() ? "checked" : "" %> />
            <span>Available</span>
        </label>
        <button type="submit" class="w-full bg-teal-600 hover:bg-teal-700 text-white py-2 rounded">Update Schedule</button>
    </form>
</div>
</body>
</html>
