package com.medicalsystem.Doctor.servlet;

import com.medicalsystem.Doctor.DoctorManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/doctor/DoctorServlet")
public class DoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            handleLogin(request, response);
        } else if ("logout".equals(action)) {
            handleLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String doctorId = request.getParameter("doctorId");
        String password = request.getParameter("password");

        DoctorManager doctorManager = new DoctorManager(getServletContext());

        if (doctorManager.validateDoctor(doctorId, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("doctorId", doctorId); // Store doctor ID in session
            response.sendRedirect(request.getContextPath() + "/doctor/dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid doctor ID or password.");
            request.getRequestDispatcher("/doctor/doctorLogin.jsp").forward(request, response);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/doctor/doctorLogin.jsp");
    }
}
