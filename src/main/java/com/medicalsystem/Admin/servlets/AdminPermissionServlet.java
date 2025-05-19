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

@WebServlet("/AdminPermissionServlet")
public class AdminPermissionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current admin from session
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");

        // Check if admin is logged in and is super admin
        if (currentAdmin == null || !currentAdmin.isSuperAdmin()) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Get admin ID and new role
        String adminId = request.getParameter("id");
        String role = request.getParameter("role");

        if (adminId != null && !adminId.isEmpty() && role != null && !role.isEmpty()) {
            // Check if admin is trying to change their own role
            if (adminId.equals(currentAdmin.getId())) {
                request.setAttribute("errorMessage", "You cannot change your own role");
                response.sendRedirect("AdminListServlet");
                return;
            }

            // Update admin role
            boolean success = FileHandler.updateAdminRole(adminId, role);

            if (success) {
                // Log activity
                FileHandler.logActivity("PERMISSION", "Admin role updated to " + role + " for ID: " + adminId + " by " + currentAdmin.getUsername());

                // Add success message
                request.setAttribute("successMessage", "Admin role updated successfully");
            } else {
                request.setAttribute("errorMessage", "Failed to update admin role");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid admin ID or role");
        }

        // Redirect to admin list
        response.sendRedirect("AdminListServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to admin list
        response.sendRedirect("AdminListServlet");
    }
}