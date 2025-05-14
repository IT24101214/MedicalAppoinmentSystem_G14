package com.medicalsystem.Admin.servlet;

import com.medicalsystem.Admin.AdminManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
    private final AdminManager adminManager = new AdminManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        adminManager.deleteUser(username);

        response.sendRedirect("dashboard.jsp");
    }
}
