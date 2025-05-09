<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.DoctorSchedule_Management.DoctorSchedule" %>
<%
    List<DoctorSchedule> schedules = (List<DoctorSchedule>) request.getAttribute("schedules");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Schedules - MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-mint-50 min-h-screen p-6 font-sans">

<div class="max-w-6xl mx-auto bg-white shadow-md rounded-xl p-8">
    <h1 class="text-2xl font-bold text-mint-700 mb-4">Doctor Schedule List</h1>

    <table class="min-w-full bg-white border border-gray-200 shadow-sm rounded-lg">
        <thead class="bg-mint-100">
        <tr>
            <th class="px-4 py-2 border-b text-left">Schedule ID</th>
            <th class="px-4 py-2 border-b text-left">Doctor ID</th>
            <th class="px-4 py-2 border-b text-left">Date</th>
            <th class="px-4 py-2 border-b text-left">Start Time</th>
            <th class="px-4 py-2 border-b text-left">End Time</th>
            <th class="px-4 py-2 border-b text-left">Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (schedules != null && !schedules.isEmpty()) {
                for (DoctorSchedule ds : schedules) {
        %>
        <tr class="hover:bg-mint-50">
            <td class="px-4 py-2 border-b"><%= ds.getScheduleId() %></td>
            <td class="px-4 py-2 border-b"><%= ds.getDoctorId() %></td>
            <td class="px-4 py-2 border-b"><%= ds.getDate() %></td>
            <td class="px-4 py-2 border-b"><%= ds.getStartTime() %></td>
            <td class="px-4 py-2 border-b"><%= ds.getEndTime() %></td>
            <td class="px-4 py-2 border-b"><%= ds.getStatus() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center py-4 text-gray-500">No schedules found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Mint Theme -->
<style>
    :root {
        --mint-50: #f0fdfa;
        --mint-100: #ccfbf1;
        --mint-500: #3dcabf;
        --mint-600: #2bb9ad;
        --mint-700: #0f766e;
        --mint-800: #115e59;
    }
    .bg-mint-50 { background-color: var(--mint-50); }
    .bg-mint-100 { background-color: var(--mint-100); }
    .text-mint-700 { color: var(--mint-700); }
</style>

</body>
</html>
