<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.medicalsystem.Doctor_Management.Doctor" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctors List - MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        mintblue: {
                            light: '#E6FFFA',
                            DEFAULT: '#A7F3D0',
                            dark: '#2C9C7F'
                        },
                        greenish: {
                            DEFAULT: '#10B981'
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-mintblue-light min-h-screen p-8">
<div class="max-w-7xl mx-auto bg-white p-6 rounded-xl shadow-lg border border-mintblue">
    <h1 class="text-2xl font-semibold text-mintblue-dark mb-4 border-b border-mintblue-dark pb-2 flex items-center justify-between">
        Doctors List
        <a href="addDoctor.jsp"
           class="text-sm text-white bg-greenish px-3 py-1.5 rounded hover:bg-mintblue-dark transition-all">
            + Add Doctor
        </a>
    </h1>

    <table class="w-full table-auto border-collapse shadow-sm text-sm">
        <thead class="bg-mintblue-dark text-white">
        <tr>
            <th class="p-2 text-left">Doctor ID</th>
            <th class="p-2 text-left">Full Name</th>
            <th class="p-2 text-left">Specialization</th>
            <th class="p-2 text-left">Email</th>
            <th class="p-2 text-left">Phone</th>
            <th class="p-2 text-left">Qualification</th>
            <th class="p-2 text-left">Experience</th>
            <th class="p-2 text-left">Time Slot</th>
            <th class="p-2 text-left">Languages</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
            if (doctorList != null && !doctorList.isEmpty()) {
                for (Doctor doc : doctorList) {
        %>
        <tr class="border-t hover:bg-mintblue text-gray-800">
            <td class="p-2"><%= doc.getId() %></td>
            <td class="p-2"><%= doc.getName() %></td>
            <td class="p-2"><%= doc.getSpecialization() %></td>
            <td class="p-2"><%= doc.getEmail() %></td>
            <td class="p-2"><%= doc.getPhone() %></td>
            <td class="p-2"><%= doc.getQualification() %></td>
            <td class="p-2"><%= doc.getExperience() %> yrs</td>
            <td class="p-2"><%= doc.getTimeSlot() %></td>
            <td class="p-2"><%= doc.getLanguages() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" class="text-center p-5 text-gray-500">No doctors found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
