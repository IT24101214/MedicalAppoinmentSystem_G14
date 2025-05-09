<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Doctor Schedule</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-blue-50">
<div class="max-w-xl mx-auto mt-10 p-6 bg-white shadow rounded">
    <h1 class="text-2xl font-bold text-mint-700 mb-6 text-center"><i class="fa-solid fa-user-doctor"></i> Create Doctor Schedule</h1>
    <form action="doctor-schedule" method="post" class="space-y-4">
        <input type="hidden" name="action" value="create">
        <input type="text" name="scheduleId" placeholder="Schedule ID" required class="w-full border rounded p-2" />
        <input type="text" name="doctorName" placeholder="Doctor Name" required class="w-full border rounded p-2" />
        <input type="text" name="specialization" placeholder="Specialization" required class="w-full border rounded p-2" />
        <input type="date" name="date" required class="w-full border rounded p-2" />
        <input type="text" name="timeSlot" placeholder="Time Slot (e.g., 10:00AM - 11:00AM)" required class="w-full border rounded p-2" />
        <label class="inline-flex items-center">
            <input type="checkbox" name="available" class="mr-2" /> Available
        </label>
        <div class="text-center">
            <button type="submit" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded"><i class="fa-solid fa-floppy-disk"></i> Save</button>
        </div>
    </form>
</div>
</body>
</html>
