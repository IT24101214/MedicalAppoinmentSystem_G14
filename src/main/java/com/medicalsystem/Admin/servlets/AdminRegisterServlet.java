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

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize the admin file with a default super admin
        FileHandler.initializeAdminFile();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current admin from session to check permissions
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");

        // Check if we're coming from login page or admin registration page
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            // Handle login
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Admin admin = FileHandler.validateAdmin(username, password);

            if (admin != null) {
                // Update last login time
                admin.setLastLogin(java.time.LocalDateTime.now().toString());
                FileHandler.updateAdmin(admin);

                // Set admin in session
                session.setAttribute("currentAdmin", admin);

                // Log activity
                FileHandler.logActivity("LOGIN", "Admin logged in: " + username);

                // Redirect to admin dashboard
                response.sendRedirect("adminDashboard.jsp");
            } else {
                // Invalid credentials
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            // Handle admin registration

            // Check if current admin has permission to register new admin
            if (currentAdmin == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            // Validate input
            if (username == null || password == null || fullName == null || email == null ||
                    username.trim().isEmpty() || password.trim().isEmpty() ||
                    fullName.trim().isEmpty() || email.trim().isEmpty()) {

                request.setAttribute("errorMessage", "All fields are required");
                request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
                return;
            }

            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match");
                request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
                return;
            }

            // Check if username is already taken
            if (FileHandler.findAdminByUsername(username) != null) {
                request.setAttribute("errorMessage", "Username already exists");
                request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
                return;
            }

            // Set default role if not provided
            if (role == null || role.trim().isEmpty()) {
                role = "admin"; // Default role
            }

            // Only super admin can create super admin
            if ("superadmin".equals(role) && !currentAdmin.isSuperAdmin()) {
                request.setAttribute("errorMessage", "Only super admins can create super admin accounts");
                request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
                return;
            }

            // Create new admin
            Admin newAdmin = new Admin(username, password, role, fullName, email);

            // Save admin
            boolean success = FileHandler.addAdmin(newAdmin);

            if (success) {
                // Log activity
                FileHandler.logActivity("REGISTER", "New admin registered: " + username + " by " + currentAdmin.getUsername());

                // Redirect to admin list
                response.sendRedirect("AdminListServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to register admin");
                request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to registration page
        request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
    }
}