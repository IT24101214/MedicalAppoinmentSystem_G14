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
import java.util.List;

@WebServlet("/AdminListServlet")
public class AdminListServlet extends HttpServlet {

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

        // Get all admins
        List<Admin> admins = FileHandler.readAllAdmins();

        // Set admins in request
        request.setAttribute("admins", admins);

        // Forward to admin list page
        request.getRequestDispatcher("manageAdmins.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any post requests if needed
        doGet(request, response);
    }
}
