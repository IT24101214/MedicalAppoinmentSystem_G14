<%@ page import="java.util.*, com.medicalsystem.User_Management.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>User List</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/lucide@latest"></script>
  <style>
    .bg-mint-100 { background-color: #E0F2F1; }
    .bg-mint-600 { background-color: #00796B; }
    .bg-mint-500 { background-color: #009688; }
    .text-mint-700 { color: #00695C; }
    .text-mint-800 { color: #004D40; }
    .hover\:bg-mint-100:hover { background-color: #E0F2F1; }
  </style>
</head>
<body class="bg-blue-50 p-8">
<h1 class="text-3xl font-bold text-mint-700 mb-6 flex items-center">
  <i data-lucide="users" class="w-6 h-6 mr-2"></i>User List
</h1>

<a href="createUser.jsp" class="mb-4 inline-block bg-mint-600 text-white px-4 py-2 rounded hover:bg-mint-500 shadow">
  <i data-lucide="user-plus" class="inline w-4 h-4 mr-1"></i> Add New User
</a>

<table class="w-full bg-white shadow-md rounded-lg overflow-hidden">
  <thead class="bg-mint-100 text-mint-800">
  <tr>
    <th class="p-3">ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users != null) {
      for (User user : users) {
  %>
  <tr class="border-b hover:bg-blue-50">
    <td class="p-3"><%= user.getUserId() %></td>
    <td><%= user.getName() %></td>
    <td><%= user.getEmail() %></td>
    <td><%= user.getPhone() %></td>
    <td class="p-3 space-x-2">
      <a href="users?action=edit&id=<%= user.getUserId() %>" class="text-blue-600 hover:underline">
        <i data-lucide="edit" class="inline w-4 h-4"></i> Edit
      </a>
      <form method="post" action="users" class="inline">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">
        <button type="submit" class="text-red-600 hover:underline">
          <i data-lucide="trash" class="inline w-4 h-4"></i> Delete
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

<script>lucide.createIcons();</script>
</body>
</html>
