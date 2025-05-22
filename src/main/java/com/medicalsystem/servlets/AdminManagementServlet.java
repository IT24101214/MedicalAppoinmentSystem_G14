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
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet for handling CRUD operations on Admin entities
 */
@WebServlet("/adminManagement")
public class AdminManagementServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize file system
        FileHandler.initializeFiles();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Check if admin is logged in
        if (loggedInAdmin == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        // Forward to admin management panel
        request.getRequestDispatcher("AdminManagementPanel.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Check if admin is logged in
        if (loggedInAdmin == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        // Check if action is null to avoid NullPointerException
        if (action == null) {
            session.setAttribute("errorMessage", "Invalid action");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Route the request based on the action parameter
        switch (action) {
            case "add":
                addAdmin(request, response);
                break;
            case "update":
                updateAdmin(request, response);
                break;
            case "delete":
                deleteAdmin(request, response);
                break;
            case "promote":
                promoteAdmin(request, response);
                break;
            default:
                // If no valid action, redirect to the admin panel
                session.setAttribute("errorMessage", "Invalid action: " + action);
                response.sendRedirect("AdminManagementPanel.jsp");
                break;
        }
    }
    
    /**
     * Add a new admin
     */
    private void addAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Only super admin can add new admins
        if (!"superadmin".equals(loggedInAdmin.getRole())) {
            session.setAttribute("errorMessage", "Only super admins can add new admins");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get parameters
        String adminID = request.getParameter("adminID");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "admin"; // New admins are regular admins by default
        
        // Validate input
        if (adminID == null || name == null || email == null || password == null || 
                adminID.trim().isEmpty() || name.trim().isEmpty() || 
                email.trim().isEmpty() || password.trim().isEmpty()) {
            
            session.setAttribute("errorMessage", "All fields are required");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Check if admin ID already exists
        List<Admin> admins = FileHandler.readAdmins();
        for (Admin admin : admins) {
            if (admin.getAdminID().equals(adminID)) {
                session.setAttribute("errorMessage", "Admin ID already exists");
                response.sendRedirect("AdminManagementPanel.jsp");
                return;
            }
        }
        
        // Create new admin
        Admin newAdmin = new Admin(adminID, name, email, password, role);
        admins.add(newAdmin);
        
        // Save to file
        FileHandler.saveAdmins(admins);
        
        // Set success message and redirect
        session.setAttribute("successMessage", "Admin added successfully");
        response.sendRedirect("AdminManagementPanel.jsp");
    }
    
    /**
     * Update an existing admin
     */
    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Get parameters
        String adminID = request.getParameter("adminID");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate input
        if (adminID == null || name == null || email == null || 
                adminID.trim().isEmpty() || name.trim().isEmpty() || 
                email.trim().isEmpty()) {
            
            session.setAttribute("errorMessage", "Invalid input for update");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get all admins
        List<Admin> admins = FileHandler.readAdmins();
        boolean adminFound = false;
        
        // Update the admin with matching ID
        for (Admin admin : admins) {
            if (admin.getAdminID().equals(adminID)) {
                // Check if logged-in admin has permission to update this admin
                if ("superadmin".equals(loggedInAdmin.getRole()) || 
                        loggedInAdmin.getAdminID().equals(admin.getAdminID())) {
                    
                    admin.setName(name);
                    admin.setEmail(email);
                    // Only update password if it's provided
                    if (password != null && !password.trim().isEmpty()) {
                        admin.setPassword(password);
                    }
                    adminFound = true;
                    
                    // If the logged-in admin updated their own info, update the session
                    if (loggedInAdmin.getAdminID().equals(admin.getAdminID())) {
                        session.setAttribute("loggedInAdmin", admin);
                    }
                } else {
                    session.setAttribute("errorMessage", "You don't have permission to update this admin");
                    response.sendRedirect("AdminManagementPanel.jsp");
                    return;
                }
                break;
            }
        }
        
        if (!adminFound) {
            session.setAttribute("errorMessage", "Admin not found");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Save updated admins
        FileHandler.saveAdmins(admins);
        
        // Set success message and redirect
        session.setAttribute("successMessage", "Admin updated successfully");
        response.sendRedirect("AdminManagementPanel.jsp");
    }
    
    /**
     * Delete an admin
     */
    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Only super admin can delete admins
        if (!"superadmin".equals(loggedInAdmin.getRole())) {
            session.setAttribute("errorMessage", "Only super admins can delete admins");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get admin ID to delete
        String adminID = request.getParameter("adminID");
        
        if (adminID == null || adminID.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Invalid admin ID");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Prevent deleting your own account
        if (adminID.equals(loggedInAdmin.getAdminID())) {
            session.setAttribute("errorMessage", "You cannot delete your own account");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get all admins
        List<Admin> admins = FileHandler.readAdmins();
        List<Admin> updatedAdmins = new ArrayList<>();
        boolean adminFound = false;
        
        // Filter out the admin to delete
        for (Admin admin : admins) {
            if (!admin.getAdminID().equals(adminID)) {
                updatedAdmins.add(admin);
            } else {
                adminFound = true;
            }
        }
        
        if (!adminFound) {
            session.setAttribute("errorMessage", "Admin not found");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Save updated list
        FileHandler.saveAdmins(updatedAdmins);
        
        // Set success message and redirect
        session.setAttribute("successMessage", "Admin deleted successfully");
        response.sendRedirect("AdminManagementPanel.jsp");
    }
    
    /**
     * Promote an admin to super admin
     */
    private void promoteAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
        
        // Only super admin can promote other admins
        if (!"superadmin".equals(loggedInAdmin.getRole())) {
            session.setAttribute("errorMessage", "Only super admins can promote admins");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get admin ID to promote
        String adminID = request.getParameter("adminID");
        
        if (adminID == null || adminID.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Invalid admin ID");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Get all admins
        List<Admin> admins = FileHandler.readAdmins();
        boolean adminFound = false;
        
        // Find and promote the admin
        for (Admin admin : admins) {
            if (admin.getAdminID().equals(adminID)) {
                admin.setRole("superadmin");
                adminFound = true;
                break;
            }
        }
        
        if (!adminFound) {
            session.setAttribute("errorMessage", "Admin not found");
            response.sendRedirect("AdminManagementPanel.jsp");
            return;
        }
        
        // Save updated admins
        FileHandler.saveAdmins(admins);
        
        // Set success message and redirect
        session.setAttribute("successMessage", "Admin promoted to super admin successfully");
        response.sendRedirect("AdminManagementPanel.jsp");
    }
} 