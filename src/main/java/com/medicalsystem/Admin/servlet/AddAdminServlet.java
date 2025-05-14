package com.medicalsystem.Admin.servlet;

import com.medicalsystem.Admin.Admin;
import com.medicalsystem.Admin.AdminManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addAdmin")
public class AddAdminServlet extends HttpServlet {
    private final AdminManager adminManager = new AdminManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin newAdmin = new Admin(username, password);
        adminManager.addUser(newAdmin);

        response.sendRedirect("dashboard.jsp");
    }
}
