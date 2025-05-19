package com.medicalsystem.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/admin/AdminServlet")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        String adminFilePath = getServletContext().getRealPath("/data/admin.txt");

        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (isValidAdmin(username, password, adminFilePath)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            }

        } else if ("logout".equals(action)) {
            // ✅ Clear session and redirect to login
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        }
    }


    private boolean isValidAdmin(String username, String password, String adminFilePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(adminFilePath))) {
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
