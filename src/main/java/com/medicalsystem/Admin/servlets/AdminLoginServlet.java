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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        // No need to set ServletContext here; handled by AppContextListener
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        getServletContext().log("Login attempt for username: " + username);

        try {
            // Validate input
            if (username == null || password == null ||
                    username.trim().isEmpty() || password.trim().isEmpty()) {
                getServletContext().log("Login failed: Empty username or password");
                request.setAttribute("errorMessage", "Username and password are required");
                request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
                return;
            }

            // Special case for default admin
            if ("admin".equals(username) && "admin123".equals(password)) {
                getServletContext().log("Default admin login attempt");
                
                // Ensure admin file exists
                FileHandler.checkAndInitializeAdminFile();
            }

            // Authenticate admin
            getServletContext().log("Attempting to validate admin credentials");
            Admin admin = FileHandler.validateAdmin(username, password);

            if (admin != null) {
                getServletContext().log("Login successful for user: " + username);
                
                // Set session timeout (30 minutes)
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(30 * 60);

                // Update last login time
                admin.setLastLogin(java.time.LocalDateTime.now().toString());
                FileHandler.updateAdmin(admin);

                // Set admin in session
                session.setAttribute("currentAdmin", admin);

                // Log activity
                FileHandler.logActivity("LOGIN", "Admin logged in: " + username);

                // Redirect to admin dashboard
                getServletContext().log("Redirecting to admin dashboard");
                response.sendRedirect("adminDashboard.jsp");
            } else {
                getServletContext().log("Login failed: Invalid credentials for user: " + username);
                // Invalid credentials
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            getServletContext().log("Error during login: " + e.getMessage(), e);
            e.printStackTrace(); // Add this to see the full stack trace
            request.setAttribute("errorMessage", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("currentAdmin") != null) {
            // Already logged in, redirect to dashboard
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Show login page
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }
}
