package com.medicalsystem.Doctor_Management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@WebServlet("/doctorLogin")
public class DoctorLoginServlet extends HttpServlet {

    private String doctorFilePath;

    @Override
    public void init() throws ServletException {
        doctorFilePath = getServletContext().getRealPath("/data/doctors.txt");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String inputId = request.getParameter("doctorId");
        if (inputId != null) inputId = inputId.trim().toUpperCase();

        boolean found = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(doctorFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Assuming first value in each line is the doctor ID
                String[] parts = line.split(";");
                if (parts.length > 0 && parts[0].equalsIgnoreCase(inputId)) {
                    found = true;
                    break;
                }
            }
        }

        if (found) {
            HttpSession session = request.getSession();
            session.setAttribute("doctorId", inputId);
            response.sendRedirect("doctorDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Doctor ID. Please try again.");
            request.getRequestDispatcher("doctorLogin.jsp").forward(request, response);
        }
    }
}
