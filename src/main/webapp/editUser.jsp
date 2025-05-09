<%@ page import="com.medicalsystem.User_Management.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-blue-50 p-8">
<h1 class="text-3xl font-bold text-mint-700 mb-6">Edit User</h1>

<%
    User user = (User) request.getAttribute("user");
%>

<form method="post" action="users">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="userId" value="<%= user.getUserId() %>">

    <div class="grid grid-cols-2 gap-4 bg-white p-6 rounded shadow-md">
        <input name="name" value="<%= user.getName() %>" required class="p-2 border rounded">
        <input type="email" name="email" value="<%= user.getEmail() %>" required class="p-2 border rounded">
        <input name="phone" value="<%= user.getPhone() %>" required class="p-2 border rounded">
        <input type="password" name="password" value="<%= user.getPassword() %>" required class="p-2 border rounded">

        <button type="submit" class="bg-mint-600 text-white px-4 py-2 rounded hover:bg-mint-500 col-span-2">
            <i data-lucide="save" class="inline w-4 h-4 mr-1"></i> Save Changes
        </button>
    </div>
</form>

<script>lucide.createIcons();</script>
</body>
</html>
