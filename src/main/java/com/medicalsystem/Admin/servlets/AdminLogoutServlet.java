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

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            Admin admin = (Admin) session.getAttribute("currentAdmin");

            if (admin != null) {
                // Log the logout activity
                FileHandler.logActivity("LOGOUT", "Admin logged out: " + admin.getUsername());
            }

            // Invalidate session
            session.invalidate();
        }

        // Redirect to login page
        response.sendRedirect("AdminLogin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST request same as GET
        doGet(request, response);
    }
}