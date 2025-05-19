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

@WebServlet("/AdminDeleteServlet")
public class AdminDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current admin from session
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");

        // Check if admin is logged in and is super admin
        if (currentAdmin == null || !currentAdmin.isSuperAdmin()) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Get admin ID to delete
        String adminId = request.getParameter("id");

        if (adminId != null && !adminId.isEmpty()) {
            // Check if admin is trying to delete themselves
            if (adminId.equals(currentAdmin.getId())) {
                request.setAttribute("errorMessage", "You cannot delete your own account");
                request.getRequestDispatcher("AdminListServlet").forward(request, response);
                return;
            }

            // Delete admin
            boolean success = FileHandler.deleteAdmin(adminId);

            if (success) {
                // Log activity
                FileHandler.logActivity("DELETE", "Admin deleted: " + adminId + " by " + currentAdmin.getUsername());

                // Add success message
                request.setAttribute("successMessage", "Admin deleted successfully");
            } else {
                request.setAttribute("errorMessage", "Failed to delete admin");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid admin ID");
        }

        // Redirect to admin list
        response.sendRedirect("AdminListServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}