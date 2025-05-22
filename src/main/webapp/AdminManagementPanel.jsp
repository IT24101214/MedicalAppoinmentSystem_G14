<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medicalsystem.model.Admin" %>
<%@ page import="com.medicalsystem.utils.FileHandler" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Check if admin is logged in
    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
    if (loggedInAdmin == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    // Get all admins with error handling
    List<Admin> admins = new ArrayList<>();
    String errorMsg = null;
    try {
        admins = FileHandler.readAdmins();
    } catch (Exception e) {
        errorMsg = "Error loading admin data: " + e.getMessage();
        // Set as session attribute so it displays in the UI
        session.setAttribute("errorMessage", errorMsg);
    }
    
    // Determine if the logged-in admin is a super admin
    boolean isSuperAdmin = "superadmin".equals(loggedInAdmin.getRole());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare - Admin Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
        }

        /* Header Styles */
        .header {
            background-color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logo {
            color: #00a2c0;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
        }

        .nav-link {
            margin-left: 30px;
            color: #00a2c0;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #007d94;
        }

        /* Layout Styles */
        .container {
            display: flex;
            min-height: calc(100vh - 60px);
        }

        .sidebar {
            width: 250px;
            background-color: #a2edf0;
            color: white;
            padding: 20px 0;
            transition: all 0.3s ease;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

        .sidebar-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #0097b2;
            text-decoration: none;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            font-size: 15px;
        }

        .sidebar-item:hover {
            background-color: #c8f4f6;
            border-left: 4px solid white;
        }

        .sidebar-item i {
            margin-right: 15px;
            width: 20px;
            text-align: center;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        /* Page Header Styles */
        .page-header {
            background-color: #a2edf0;
            border-radius: 8px;
            padding: 20px 30px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            animation: fadeIn 0.6s ease-in-out;
        }

        .page-title {
            font-size: 24px;
            color: #00a2c0;
            font-weight: 600;
        }

        .page-actions {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background-color: #00a2c0;
            color: white;
        }

        .btn-primary:hover {
            background-color: #007d94;
        }

        /* Tab Navigation Styles */
        .tabs {
            display: flex;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }

        .tab-item {
            padding: 12px 20px;
            cursor: pointer;
            font-weight: 500;
            color: #777;
            position: relative;
            transition: all 0.3s ease;
        }

        .tab-item.active {
            color: #00a2c0;
        }

        .tab-item.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            right: 0;
            height: 3px;
            background-color: #00a2c0;
        }

        /* Admin Table Styles */
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .admin-table th, .admin-table td {
            padding: 12px 20px;
            text-align: left;
        }

        .admin-table th {
            background-color: #f2f2f2;
            color: #555;
            font-weight: 600;
        }

        .admin-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .admin-table tbody tr:hover {
            background-color: #f0f7fa;
        }

        .admin-table .actions {
            display: flex;
            gap: 8px;
        }

        .action-btn {
            padding: 6px 12px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 12px;
        }

        .edit-btn {
            background-color: #e3f9e5;
            color: #1f9d55;
        }

        .edit-btn:hover {
            background-color: #d4f5d6;
        }

        .promote-btn {
            background-color: #e6f7f9;
            color: #00a2c0;
        }

        .promote-btn:hover {
            background-color: #d4f0f5;
        }

        .delete-btn {
            background-color: #fbe4e4;
            color: #e53e3e;
        }

        .delete-btn:hover {
            background-color: #f9d5d5;
        }

        .role-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .role-admin {
            background-color: #e3f9e5;
            color: #1f9d55;
        }

        .role-superadmin {
            background-color: #fef5e7;
            color: #f2994a;
        }

        /* Modal Styles */
        .modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-backdrop.active {
            opacity: 1;
            visibility: visible;
        }

        .modal {
            background-color: white;
            border-radius: 8px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            transform: translateY(-20px);
            transition: all 0.3s ease;
        }

        .modal-backdrop.active .modal {
            transform: translateY(0);
        }

        .modal-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            color: #333;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: #777;
        }

        .modal-close:hover {
            color: #333;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-control:focus {
            outline: none;
            border-color: #00a2c0;
        }

        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-secondary {
            background-color: #f2f2f2;
            color: #555;
        }

        .btn-secondary:hover {
            background-color: #e6e6e6;
        }

        .btn-danger {
            background-color: #e53e3e;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c53030;
        }
        
        /* Error/Success Message Styles */
        .message {
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-in-out;
        }
        
        .error-message {
            background-color: #ffebee;
            color: #c62828;
            border-left: 4px solid #c62828;
        }
        
        .success-message {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 4px solid #2e7d32;
        }

        /* Keyframes for Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Footer Styles */
        .footer {
            background-color: #00a0b0;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp" class="logo">MediCare</a>
    <div class="nav-links">
        <a href="AdminDashboard.jsp" class="nav-link">Dashboard</a>
        <a href="logout" class="nav-link">Logout</a>
    </div>
</div>

<div class="container">
    <div class="sidebar">
        <ul class="sidebar-menu">
            <li><a href="AdminDashboard.jsp" class="sidebar-item"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
            <li><a href="#" class="sidebar-item"><i class="fas fa-cog"></i> <span>Settings</span></a></li>
        </ul>
    </div>

    <div class="main-content">
        <!-- Display session messages if any -->
        <% if(session.getAttribute("errorMessage") != null) { %>
        <div class="message error-message">
            <%= session.getAttribute("errorMessage") %>
            <% session.removeAttribute("errorMessage"); %>
        </div>
        <% } %>
        
        <% if(session.getAttribute("successMessage") != null) { %>
        <div class="message success-message">
            <%= session.getAttribute("successMessage") %>
            <% session.removeAttribute("successMessage"); %>
        </div>
        <% } %>
        
        <div class="page-header">
            <h1 class="page-title">Admin Management</h1>
            <div class="page-actions">
                <% if(isSuperAdmin) { %>
                <button class="btn btn-primary" onclick="openAddAdminModal()">
                    <i class="fas fa-plus"></i> Add Admin
                </button>
                <% } %>
            </div>
        </div>

        <table class="admin-table">
            <thead>
            <tr>
                <th>Admin ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for(Admin admin : admins) { %>
            <tr>
                <td><%= admin.getAdminID() %></td>
                <td><%= admin.getName() %></td>
                <td><%= admin.getEmail() %></td>
                <td>
                    <span class="role-badge <%= "superadmin".equals(admin.getRole()) ? "role-superadmin" : "role-admin" %>">
                        <%= "superadmin".equals(admin.getRole()) ? "Super Admin" : "Admin" %>
                    </span>
                </td>
                <td class="actions">
                    <button class="action-btn edit-btn" onclick="openEditAdminModal('<%= admin.getAdminID() %>', '<%= admin.getName() %>', '<%= admin.getEmail() %>')">
                        <i class="fas fa-edit"></i> Edit
                    </button>
                    
                    <% if(isSuperAdmin && !"superadmin".equals(admin.getRole()) && !loggedInAdmin.getAdminID().equals(admin.getAdminID())) { %>
                    <button class="action-btn promote-btn" onclick="promoteAdmin('<%= admin.getAdminID() %>')">
                        <i class="fas fa-arrow-up"></i> Promote
                    </button>
                    <% } %>
                    
                    <% if(isSuperAdmin && !loggedInAdmin.getAdminID().equals(admin.getAdminID())) { %>
                    <button class="action-btn delete-btn" onclick="openDeleteAdminModal('<%= admin.getAdminID() %>', '<%= admin.getName() %>')">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                    <% } %>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Admin Modal -->
<div class="modal-backdrop" id="addAdminModal">
    <div class="modal">
        <div class="modal-header">
            <h3 class="modal-title">Add New Admin</h3>
            <button class="modal-close" onclick="closeAddAdminModal()">&times;</button>
        </div>
        <form action="${pageContext.request.contextPath}/adminManagement" method="post">
            <input type="hidden" name="action" value="add">
            <div class="modal-body">
                <div class="form-group">
                    <label for="adminID" class="form-label">Admin ID</label>
                    <input type="text" id="adminID" name="adminID" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeAddAdminModal()">Cancel</button>
                <button type="submit" class="btn btn-primary">Add Admin</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Admin Modal -->
<div class="modal-backdrop" id="editAdminModal">
    <div class="modal">
        <div class="modal-header">
            <h3 class="modal-title">Edit Admin</h3>
            <button class="modal-close" onclick="closeEditAdminModal()">&times;</button>
        </div>
        <form action="${pageContext.request.contextPath}/adminManagement" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" id="editAdminID" name="adminID">
            <div class="modal-body">
                <div class="form-group">
                    <label for="editName" class="form-label">Name</label>
                    <input type="text" id="editName" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="editEmail" class="form-label">Email</label>
                    <input type="email" id="editEmail" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="editPassword" class="form-label">Password (leave blank to keep current)</label>
                    <input type="password" id="editPassword" name="password" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeEditAdminModal()">Cancel</button>
                <button type="submit" class="btn btn-primary">Update Admin</button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Admin Modal -->
<div class="modal-backdrop" id="deleteAdminModal">
    <div class="modal">
        <div class="modal-header">
            <h3 class="modal-title">Delete Admin</h3>
            <button class="modal-close" onclick="closeDeleteAdminModal()">&times;</button>
        </div>
        <form action="${pageContext.request.contextPath}/adminManagement" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" id="deleteAdminID" name="adminID">
            <div class="modal-body">
                <p>Are you sure you want to delete the admin <span id="deleteAdminName"></span>?</p>
                <p>This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeDeleteAdminModal()">Cancel</button>
                <button type="submit" class="btn btn-danger">Delete</button>
            </div>
        </form>
    </div>
</div>

<!-- Promote Admin Form (No modal, just hidden form for submission) -->
<form id="promoteForm" action="${pageContext.request.contextPath}/adminManagement" method="post" style="display: none;">
    <input type="hidden" name="action" value="promote">
    <input type="hidden" id="promoteAdminID" name="adminID">
</form>

<footer class="footer">
    <p>© 2025 Medicare. All Right Reserved</p>
</footer>

<script>
    // Add Admin Modal
    function openAddAdminModal() {
        document.getElementById('addAdminModal').classList.add('active');
    }
    
    function closeAddAdminModal() {
        document.getElementById('addAdminModal').classList.remove('active');
    }
    
    // Edit Admin Modal
    function openEditAdminModal(adminID, name, email) {
        document.getElementById('editAdminID').value = adminID;
        document.getElementById('editName').value = name;
        document.getElementById('editEmail').value = email;
        document.getElementById('editPassword').value = '';
        document.getElementById('editAdminModal').classList.add('active');
    }
    
    function closeEditAdminModal() {
        document.getElementById('editAdminModal').classList.remove('active');
    }
    
    // Delete Admin Modal
    function openDeleteAdminModal(adminID, name) {
        document.getElementById('deleteAdminID').value = adminID;
        document.getElementById('deleteAdminName').textContent = name;
        document.getElementById('deleteAdminModal').classList.add('active');
    }
    
    function closeDeleteAdminModal() {
        document.getElementById('deleteAdminModal').classList.remove('active');
    }
    
    // Promote Admin
    function promoteAdmin(adminID) {
        if (confirm('Are you sure you want to promote this admin to Super Admin?')) {
            document.getElementById('promoteAdminID').value = adminID;
            document.getElementById('promoteForm').submit();
        }
    }
    
    // Close modals when clicking outside
    window.onclick = function(event) {
        if (event.target.classList.contains('modal-backdrop')) {
            event.target.classList.remove('active');
        }
    }
</script>
</body>
</html>
