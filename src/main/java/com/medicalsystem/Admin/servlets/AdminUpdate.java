package com.medicalsystem.Admin.servlets;


import com.medicalsystem.Admin.model.Admin;
import utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {

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

        // Get admin ID to update
        String adminId = request.getParameter("id");

        if (adminId != null && !adminId.isEmpty()) {
            // Get admin details
            Admin admin = FileHandler.findAdminById(adminId);

            if (admin != null) {
                // Check if current admin has permission to edit this admin
                if (!currentAdmin.isSuperAdmin() && !currentAdmin.getId().equals(adminId)) {
                    request.setAttribute("errorMessage", "You don't have permission to edit this admin");
                    response.sendRedirect("AdminListServlet");
                    return;
                }

                // Set admin in request
                request.setAttribute("admin", admin);

                // Forward to update page
                request.getRequestDispatcher("updateAdmin.jsp").forward(request, response);
                return;
            }
        }

        // Invalid admin ID
        request.setAttribute("errorMessage", "Invalid admin ID");
        response.sendRedirect("AdminListServlet");
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

        // Get admin ID to update
        String adminId = request.getParameter("id");

        if (adminId != null && !adminId.isEmpty()) {
            // Get admin details
            Admin admin = FileHandler.findAdminById(adminId);

            if (admin != null) {
                // Check if current admin has permission to edit this admin
                if (!currentAdmin.isSuperAdmin() && !currentAdmin.getId().equals(adminId)) {
                    request.setAttribute("errorMessage", "You don't have permission to edit this admin");
                    response.sendRedirect("AdminListServlet");
                    return;
                }

                // Update admin details
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");

                // Validate input
                if (fullName == null || email == null ||
                        fullName.trim().isEmpty() || email.trim().isEmpty()) {

                    request.setAttribute("errorMessage", "Name and email are required");
                    request.setAttribute("admin", admin);
                    request.getRequestDispatcher("updateAdmin.jsp").forward(request, response);
                    return;
                }

                // Update basic details
                admin.setFullName(fullName);
                admin.setEmail(email);

                // Update password if provided
                if (password != null && !password.trim().isEmpty()) {
                    // Check if passwords match
                    if (!password.equals(confirmPassword)) {
                        request.setAttribute("errorMessage", "Passwords do not match");
                        request.setAttribute("admin", admin);
                        request.getRequestDispatcher("updateAdmin.jsp").forward(request, response);
                        return;
                    }

                    admin.setPassword(password);
                }

                // Save admin
                boolean success = FileHandler.updateAdmin(admin);

                if (success) {
                    // Log activity
                    FileHandler.logActivity("UPDATE", "Admin updated: " + admin.getUsername() + " by " + currentAdmin.getUsername());

                    // Update session if current admin is updating their own details
                    if (currentAdmin.getId().equals(adminId)) {
                        session.setAttribute("currentAdmin", admin);
                    }

                    // Add success message
                    request.setAttribute("successMessage", "Admin updated successfully");

                    // Redirect to admin list
                    response.sendRedirect("AdminListServlet");
                } else {
                    request.setAttribute("errorMessage", "Failed to update admin");
                    request.setAttribute("admin", admin);
                    request.getRequestDispatcher("updateAdmin.jsp").forward(request, response);
                }
            } else {
                // Invalid admin ID
                request.setAttribute("errorMessage", "Invalid admin ID");
                response.sendRedirect("AdminListServlet");
            }
        } else {
            // Invalid admin ID
            request.setAttribute("errorMessage", "Invalid admin ID");
            response.sendRedirect("AdminListServlet");
        }
    }
}
