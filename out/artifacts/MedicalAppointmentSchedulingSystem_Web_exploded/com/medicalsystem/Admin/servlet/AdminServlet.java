package com.medicalsystem.Admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@WebServlet("/admin/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final String ADMIN_FILE = "E:/Project sem2/MedicalAppointmentSchedulingSystem/data/admin.txt"; // Update this to actual file path

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (isValidAdmin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);  // Store admin info in session
                response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            }
        }
    }

    private boolean isValidAdmin(String username, String password) {
        try (BufferedReader reader = new BufferedReader(new FileReader(ADMIN_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] creds = line.split(",");
                if (creds.length == 2 && creds[0].equals(username) && creds[1].equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
