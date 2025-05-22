package com.medicalsystem.servlets;

import com.medicalsystem.model.Admin;
import com.medicalsystem.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet for handling admin login
 */
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AdminLoginServlet.class.getName());
    
    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize file system
        FileHandler.initializeFiles();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        // Validate input to prevent security issues
        if (username == null || password == null || role == null || 
            username.trim().isEmpty() || password.trim().isEmpty() || role.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        
        // Sanitize inputs (basic sanitization)
        username = username.trim();
        password = password.trim();
        role = role.trim();
        
        // Log login attempt (without password)
        logger.log(Level.INFO, "Login attempt: username=" + username + ", role=" + role);
        
        // Only process if role is admin
        if ("admin".equals(role)) {
            boolean isAuthenticated = false;
            Admin loggedInAdmin = null;
            
            // Read admins from file
            List<Admin> admins = FileHandler.readAdmins();
            
            // Check credentials
            for (Admin admin : admins) {
                if (admin.getAdminID().equals(username) && admin.getPassword().equals(password)) {
                    isAuthenticated = true;
                    loggedInAdmin = admin;
                    break;
                }
            }
            
            if (isAuthenticated) {
                // Create session and store admin info
                HttpSession session = request.getSession();
                session.setAttribute("loggedInAdmin", loggedInAdmin);
                session.setAttribute("isAdminLoggedIn", true);
                
                // Set session timeout (30 minutes)
                session.setMaxInactiveInterval(30 * 60);
                
                // Log successful login
                logger.log(Level.INFO, "Successful login: " + username);
                
                // Redirect to admin dashboard
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                // Authentication failed
                logger.log(Level.WARNING, "Failed login attempt: " + username);
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } else {
            // For doctor role (not implemented, just redirect to login with error)
            request.setAttribute("errorMessage", "Doctor login not implemented in this module");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
} 