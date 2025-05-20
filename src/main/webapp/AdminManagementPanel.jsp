<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.medicalsystem.Admin.model.Admin" %>
<%@ page import="com.medicalsystem.Admin.utils.FileHandler" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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

        .admin-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .admin-table tr:hover {
            background-color: #f0f7fa;
        }

        .admin-role {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }

        .role-super {
            background-color: #e3f9e5;
            color: #1f9d55;
        }

        .role-admin {
            background-color: #e6f7f9;
            color: #00a2c0;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-edit {
            background-color: #e6f7f9;
            color: #00a2c0;
        }

        .btn-edit:hover {
            background-color: #00a2c0;
            color: white;
        }

        .btn-delete {
            background-color: #fbe4e4;
            color: #e53e3e;
        }

        .btn-delete:hover {
            background-color: #e53e3e;
            color: white;
        }

        .btn-promote {
            background-color: #fef5e7;
            color: #f2994a;
        }

        .btn-promote:hover {
            background-color: #f2994a;
            color: white;
        }

        /* Activity Logs Table */
        .logs-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .logs-table th, .logs-table td {
            padding: 12px 20px;
            text-align: left;
        }

        .logs-table th {
            background-color: #f2f2f2;
            color: #555;
            font-weight: 600;
        }

        .logs-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .logs-table tr:hover {
            background-color: #f0f7fa;
        }

        .action-type {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }

        .action-create {
            background-color: #e3f9e5;
            color: #1f9d55;
        }

        .action-update {
            background-color: #e6f7f9;
            color: #00a2c0;
        }

        .action-delete {
            background-color: #fbe4e4;
            color: #e53e3e;
        }

        .action-login {
            background-color: #fef5e7;
            color: #f2994a;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background-color: white;
            border-radius: 8px;
            width: 500px;
            max-width: 90%;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            animation: modalFadeIn 0.3s ease;
        }

        .modal-header {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }

        .modal-close {
            font-size: 20px;
            color: #777;
            cursor: pointer;
            transition: color 0.2s ease;
        }

        .modal-close:hover {
            color: #e53e3e;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            border-color: #00a2c0;
            outline: none;
        }

        .form-select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: white;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23555' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px;
        }

        .form-select:focus {
            border-color: #00a2c0;
            outline: none;
        }

        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        /* Confirmation Modal */
        .confirmation-modal .modal-body {
            text-align: center;
            padding: 30px 20px;
        }

        .confirmation-icon {
            font-size: 48px;
            color: #e53e3e;
            margin-bottom: 20px;
        }

        .confirmation-message {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        /* Footer Styles */
        .footer {
            background-color: white;
            padding: 15px 20px;
            text-align: center;
            color: #777;
            font-size: 14px;
            border-top: 1px solid #eee;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes modalFadeIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Tab Content Styles */
        .tab-content {
            display: none;
            animation: fadeIn 0.4s ease-in-out;
        }

        .tab-content.active {
            display: block;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 10px 0;
            }

            .page-header {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

            .tabs {
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header">
    <a href="adminDashboard.jsp" class="logo">MediCare</a>
    <div class="nav-links">
        <a href="index.jsp" class="nav-link">Home</a>
    </div>
</header>

<!-- Main Container -->
<div class="container">
    <!-- Main Content -->
    <div class="main-content">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title">Admin Management Panel</div>
            <div class="page-actions">
                <!-- Only show this button to Super Admins -->
                <% 
                Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");
                if(currentAdmin != null && currentAdmin.isSuperAdmin()) { 
                %>
                <button class="btn btn-primary" id="addAdminBtn">
                    <i class="fas fa-plus"></i> Add New Admin
                </button>
                <% } %>
            </div>
        </div>

        <!-- Tab Navigation -->
        <div class="tabs">
            <div class="tab-item active" data-tab="admin-list">Admin List</div>
            <div class="tab-item" data-tab="activity-logs">Activity Logs</div>
        </div>

        <!-- Admin List Tab Content -->
        <div class="tab-content active" id="admin-list">
            <table class="admin-table">
                <thead>
                <tr>
                    <th>Admin ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Last Login</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                List<Admin> admins = FileHandler.getAllAdmins();
                for(Admin admin : admins) {
                %>
                <tr>
                    <td><%= admin.getId() %></td>
                    <td><%= admin.getFullName() %></td>
                    <td><%= admin.getEmail() %></td>
                    <td>
                        <span class="admin-role <%= admin.isSuperAdmin() ? "role-super" : "role-admin" %>">
                            <%= admin.isSuperAdmin() ? "Super Admin" : "Admin" %>
                        </span>
                    </td>
                    <td><%= admin.getLastLogin() != null ? admin.getLastLogin() : "Never" %></td>
                    <td>
                        <div class="action-buttons">
                            <div class="btn-icon btn-edit" title="Edit Admin" 
                                onclick="openEditModal('<%= admin.getId() %>', '<%= admin.getFullName() %>', '<%= admin.getEmail() %>', '<%= admin.getRole() %>')">
                                <i class="fas fa-edit"></i>
                            </div>
                            <% if(!admin.getId().equals(currentAdmin.getId())) { %>
                                <% if(!admin.isSuperAdmin() && currentAdmin.isSuperAdmin()) { %>
                                <div class="btn-icon btn-promote" title="Promote to Super Admin" 
                                    onclick="openPromoteModal('<%= admin.getId() %>', '<%= admin.getFullName() %>')">
                                    <i class="fas fa-level-up-alt"></i>
                                </div>
                                <% } %>
                                <div class="btn-icon btn-delete" title="Delete Admin" 
                                    onclick="openDeleteModal('<%= admin.getId() %>', '<%= admin.getFullName() %>')">
                                    <i class="fas fa-trash"></i>
                                </div>
                            <% } %>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- Activity Logs Tab Content -->
        <div class="tab-content" id="activity-logs">
            <table class="logs-table">
                <thead>
                <tr>
                    <th>Admin</th>
                    <th>Action</th>
                    <th>Details</th>
                    <th>Date & Time</th>
                    <th>IP Address</th>
                </tr>
                </thead>
                <tbody>
                <%
                try {
                    List<String> logs = FileHandler.getActivityLogs();
                    for(String log : logs) {
                        String[] parts = log.split("\\|");
                        if (parts.length >= 4) {
                            String timestamp = parts[0];
                            String admin = parts[1];
                            String action = parts[2];
                            String details = parts[3];
                            String ipAddress = parts.length > 4 ? parts[4] : "N/A";
                %>
                <tr>
                    <td><%= admin %></td>
                    <td><span class="action-type action-<%= action.toLowerCase() %>"><%= action %></span></td>
                    <td><%= details %></td>
                    <td><%= timestamp %></td>
                    <td><%= ipAddress %></td>
                </tr>
                <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
                </tbody>
            </table>
        </div>

        <!-- Add/Edit Admin Modal -->
        <div class="modal" id="adminFormModal">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title" id="adminModalTitle">Add New Admin</div>
                    <div class="modal-close" id="closeAdminModal">&times;</div>
                </div>
                <div class="modal-body">
                    <form id="adminForm" action="AdminRegisterServlet" method="post">
                        <input type="hidden" id="adminId" name="adminId" value="">
                        <input type="hidden" id="actionType" name="actionType" value="create">

                        <div class="form-group">
                            <label class="form-label" for="adminName">Full Name</label>
                            <input type="text" class="form-input" id="adminName" name="adminName" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="adminEmail">Email Address</label>
                            <input type="email" class="form-input" id="adminEmail" name="adminEmail" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="adminPassword">Password</label>
                            <input type="password" class="form-input" id="adminPassword" name="adminPassword" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="adminRole">Admin Role</label>
                            <select class="form-select" id="adminRole" name="adminRole" required>
                                <option value="admin">Admin</option>
                                <% if(currentAdmin != null && currentAdmin.isSuperAdmin()) { %>
                                <option value="superadmin">Super Admin</option>
                                <% } %>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn" id="cancelAdminForm">Cancel</button>
                    <button class="btn btn-primary" id="submitAdminForm">Save Admin</button>
                </div>
            </div>
        </div>

        <!-- Promote Admin Modal -->
        <div class="modal" id="promoteModal">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title">Promote Admin</div>
                    <div class="modal-close" id="closePromoteModal">&times;</div>
                </div>
                <div class="modal-body">
                    <form id="promoteForm" action="AdminPermissionServlet" method="post">
                        <input type="hidden" id="promoteAdminId" name="adminId" value="">
                        <input type="hidden" name="role" value="superadmin">

                        <p>Are you sure you want to promote <strong id="promoteAdminName"></strong> to Super Admin?</p>
                        <p>Super Admins have full control over the system, including managing other admins.</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn" id="cancelPromote">Cancel</button>
                    <button class="btn btn-primary" id="confirmPromote">Promote to Super Admin</button>
                </div>
            </div>
        </div>

        <!-- Delete Admin Confirmation Modal -->
        <div class="modal confirmation-modal" id="deleteModal">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title">Delete Admin</div>
                    <div class="modal-close" id="closeDeleteModal">&times;</div>
                </div>
                <div class="modal-body">
                    <form id="deleteForm" action="AdminDeleteServlet" method="post">
                        <input type="hidden" id="deleteAdminId" name="adminId" value="">

                        <div class="confirmation-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>

                        <div class="confirmation-message">
                            Are you sure you want to delete admin <strong id="deleteAdminName"></strong>?
                            <br>
                            This action cannot be undone.
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn" id="cancelDelete">Cancel</button>
                    <button class="btn btn-delete" id="confirmDelete">Delete Admin</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>© 2025 MediCare. All Rights Reserved</p>
</footer>

<script>
    // Tab Switching
    const tabItems = document.querySelectorAll('.tab-item');
    const tabContents = document.querySelectorAll('.tab-content');

    tabItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all tabs
            tabItems.forEach(tab => tab.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));

            // Add active class to clicked tab
            this.classList.add('active');

            // Show corresponding content
            const tabId = this.getAttribute('data-tab');
            document.getElementById(tabId).classList.add('active');
        });
    });

    // Add Admin Button
    const addAdminBtn = document.getElementById('addAdminBtn');
    const adminFormModal = document.getElementById('adminFormModal');
    const adminModalTitle = document.getElementById('adminModalTitle');
    const adminForm = document.getElementById('adminForm');
    const closeAdminModal = document.getElementById('closeAdminModal');
    const cancelAdminForm = document.getElementById('cancelAdminForm');
    const submitAdminForm = document.getElementById('submitAdminForm');

    if (addAdminBtn) {
        addAdminBtn.addEventListener('click', function() {
            // Reset form
            adminForm.reset();
            document.getElementById('actionType').value = 'create';
            document.getElementById('adminId').value = '';

            // Change modal title
            adminModalTitle.textContent = 'Add New Admin';

            // Show password field for new admin
            document.getElementById('adminPassword').required = true;
            document.getElementById('adminPassword').parentElement.style.display = 'block';

            // Show modal
            adminFormModal.classList.add('active');
        });
    }

    // Edit Admin Function
    function openEditModal(id, name, email, role) {
        // Set form values
        document.getElementById('adminId').value = id;
        document.getElementById('adminName').value = name;
        document.getElementById('adminEmail').value = email;
        document.getElementById('adminRole').value = role;
        document.getElementById('actionType').value = 'update';

        // Change modal title
        adminModalTitle.textContent = 'Edit Admin';

        // Make password optional for existing admin
        document.getElementById('adminPassword').required = false;
        document.getElementById('adminPassword').value = '';
        document.getElementById('adminPassword').placeholder = 'Leave blank to keep current password';

        // Show modal
        adminFormModal.classList.add('active');
    }

    // Close Admin Modal
    if (closeAdminModal) {
        closeAdminModal.addEventListener('click', function() {
            adminFormModal.classList.remove('active');
        });
    }

    if (cancelAdminForm) {
        cancelAdminForm.addEventListener('click', function() {
            adminFormModal.classList.remove('active');
        });
    }

    // Submit Admin Form
    if (submitAdminForm) {
        submitAdminForm.addEventListener('click', function() {
            // Validate form
            if (adminForm.checkValidity()) {
                // Submit the form
                adminForm.submit();
            } else {
                // Show validation messages
                adminForm.reportValidity();
            }
        });
    }

    // Promote Admin Modal
    const promoteModal = document.getElementById('promoteModal');
    const closePromoteModal = document.getElementById('closePromoteModal');
    const cancelPromote = document.getElementById('cancelPromote');
    const confirmPromote = document.getElementById('confirmPromote');

    function openPromoteModal(id, name) {
        // Set form values
        document.getElementById('promoteAdminId').value = id;
        document.getElementById('promoteAdminName').textContent = name;

        // Show modal
        promoteModal.classList.add('active');
    }

    if (closePromoteModal) {
        closePromoteModal.addEventListener('click', function() {
            promoteModal.classList.remove('active');
        });
    }

    if (cancelPromote) {
        cancelPromote.addEventListener('click', function() {
            promoteModal.classList.remove('active');
        });
    }

    if (confirmPromote) {
        confirmPromote.addEventListener('click', function() {
            // Submit the form
            document.getElementById('promoteForm').submit();
        });
    }

    // Delete Admin Modal
    const deleteModal = document.getElementById('deleteModal');
    const closeDeleteModal = document.getElementById('closeDeleteModal');
    const cancelDelete = document.getElementById('cancelDelete');
    const confirmDelete = document.getElementById('confirmDelete');

    function openDeleteModal(id, name) {
        // Set form values
        document.getElementById('deleteAdminId').value = id;
        document.getElementById('deleteAdminName').textContent = name;

        // Show modal
        deleteModal.classList.add('active');
    }

    if (closeDeleteModal) {
        closeDeleteModal.addEventListener('click', function() {
            deleteModal.classList.remove('active');
        });
    }

    if (cancelDelete) {
        cancelDelete.addEventListener('click', function() {
            deleteModal.classList.remove('active');
        });
    }

    if (confirmDelete) {
        confirmDelete.addEventListener('click', function() {
            // Submit the form
            document.getElementById('deleteForm').submit();
        });
    }

    // Sidebar hover animation
    const sidebarItems = document.querySelectorAll('.sidebar-item');
    sidebarItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            const icon = this.querySelector('i');
            icon.style.transform = 'scale(1.1)';
        });

        item.addEventListener('mouseleave', function() {
            const icon = this.querySelector('i');
            icon.style.transform = 'scale(1)';
        });
    });

    // Close modals when clicking outside
    window.addEventListener('click', function(event) {
        if (event.target === adminFormModal) {
            adminFormModal.classList.remove('active');
        }
        if (event.target === promoteModal) {
            promoteModal.classList.remove('active');
        }
        if (event.target === deleteModal) {
            deleteModal.classList.remove('active');
        }
    });
</script>
</body>
</html>
