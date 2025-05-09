<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Doctor Schedule</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-blue-50">
<div class="max-w-md mx-auto mt-20 p-6 bg-white shadow rounded text-center">
    <h2 class="text-xl font-bold text-red-600 mb-4"><i class="fa-solid fa-triangle-exclamation"></i> Confirm Delete</h2>
    <p>Are you sure you want to delete this doctor schedule?</p>
    <form action="doctor-schedule" method="post" class="mt-6 space-x-2">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="scheduleId" value="<%= request.getParameter("id") %>">
        <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded"><i class="fa-solid fa-trash"></i> Delete</button>
        <a href="doctor-schedule" class="bg-gray-300 hover:bg-gray-400 px-4 py-2 rounded">Cancel</a>
    </form>
</div>
</body>
</html>
