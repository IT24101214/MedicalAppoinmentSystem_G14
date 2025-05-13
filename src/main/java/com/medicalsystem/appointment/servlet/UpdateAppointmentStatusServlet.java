package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.AppointmentManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateAppointmentStatus")
public class UpdateAppointmentStatusServlet extends HttpServlet {
    private final AppointmentManager appointmentManager = new AppointmentManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentId = request.getParameter("appointmentId");
        String newStatus = request.getParameter("status");

        // In a real system, you would update the status in your data store
        // For now, we'll just redirect back to the list
        response.sendRedirect("appointment.txt");
    }
}