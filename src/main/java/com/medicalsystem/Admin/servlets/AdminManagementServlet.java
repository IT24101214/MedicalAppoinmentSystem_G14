package com.medicalsystem.Admin.servlets;

import com.medicalsystem.Admin.model.Admin;
import com.medicalsystem.Admin.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminManagementServlet")
public class AdminManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get current admin from session
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");

        // Check if admin is logged in
        if (currentAdmin == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Forward to admin management panel
        request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get current admin from session
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");

        // Check if admin is logged in
        if (currentAdmin == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Get action type
        String actionType = request.getParameter("actionType");

        if ("create".equals(actionType)) {
            // Handle create new admin
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String fullName = request.getParameter("adminName");
            String email = request.getParameter("adminEmail");

            // Validate input
            if (username == null || password == null || role == null || 
                username.trim().isEmpty() || password.trim().isEmpty() || role.trim().isEmpty()) {
                request.setAttribute("errorMessage", "All fields are required");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
                return;
            }

            // Check if username already exists
            if (FileHandler.findAdminByUsername(username) != null) {
                request.setAttribute("errorMessage", "Username already exists");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
                return;
            }

            // Create new admin
            Admin newAdmin = new Admin(username, password, role, fullName, email);
            boolean success = FileHandler.addAdmin(newAdmin);

            if (success) {
                // Log activity
                FileHandler.logActivity("CREATE", "New admin created: " + username + " by " + currentAdmin.getUsername());
                response.sendRedirect("AdminManagementServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to create admin");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
            }
        } else if ("update".equals(actionType)) {
            // Handle update admin
            String adminId = request.getParameter("adminId");
            String fullName = request.getParameter("adminName");
            String email = request.getParameter("adminEmail");
            String password = request.getParameter("adminPassword");
            String role = request.getParameter("adminRole");

            // Validate input
            if (adminId == null || adminId.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Invalid admin ID");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
                return;
            }

            // Get existing admin
            Admin admin = FileHandler.findAdminById(adminId);
            if (admin == null) {
                request.setAttribute("errorMessage", "Admin not found");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
                return;
            }

            // Update admin details
            admin.setFullName(fullName);
            admin.setEmail(email);
            if (password != null && !password.trim().isEmpty()) {
                admin.setPassword(password);
            }
            admin.setRole(role);

            // Save changes
            boolean success = FileHandler.updateAdmin(admin);

            if (success) {
                // Log activity
                FileHandler.logActivity("UPDATE", "Admin updated: " + admin.getUsername() + " by " + currentAdmin.getUsername());
                response.sendRedirect("AdminManagementServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to update admin");
                request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
            }
        } else {
            // Invalid action type
            request.setAttribute("errorMessage", "Invalid action type");
            request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
        }
    }
} 