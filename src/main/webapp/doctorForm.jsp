<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Doctor</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8 font-sans">

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">
    <h2 class="text-2xl font-bold mb-4 text-center text-teal-600">Create New Doctor</h2>

    <form method="post" action="${pageContext.request.contextPath}/doctor">
    <input type="text" name="name" placeholder="Full Name" required class="w-full px-4 py-2 border rounded" />
        <input type="text" name="specialization" placeholder="Specialization" required class="w-full px-4 py-2 border rounded" />
        <input type="email" name="email" placeholder="Email" required class="w-full px-4 py-2 border rounded" />
        <input type="text" name="phone" placeholder="Phone" required class="w-full px-4 py-2 border rounded" />
        <input type="text" name="qualification" placeholder="Qualification" required class="w-full px-4 py-2 border rounded" />
        <input type="number" name="yearsOfExperience" placeholder="Years of Experience" required class="w-full px-4 py-2 border rounded" />
        <input type="text" name="languages" placeholder="Languages Spoken" required class="w-full px-4 py-2 border rounded" />
        <input type="text" name="timeSlot" placeholder="Available Time Slot (e.g., 10AM - 1PM)" required class="w-full px-4 py-2 border rounded" />

        <button type="submit" class="bg-teal-600 text-white px-4 py-2 rounded hover:bg-teal-700 w-full">
            Create Doctor
        </button>
    </form>
</div>

</body>
</html>
