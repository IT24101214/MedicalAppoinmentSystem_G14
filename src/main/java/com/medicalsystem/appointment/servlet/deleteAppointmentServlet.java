package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.AppointmentManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteAppointment")
public class deleteAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentId = request.getParameter("appointmentId");

        if (appointmentId == null || appointmentId.isEmpty()) {
            request.setAttribute("error", "Invalid appointment ID.");
            request.getRequestDispatcher("/appointment/appointmentList.jsp").forward(request, response);
            return;
        }

        AppointmentManager appointmentManager = new AppointmentManager();

        boolean deleted = appointmentManager.deleteAppointment(appointmentId);

        if (deleted) {
            request.setAttribute("success", "Appointment deleted successfully.");
        } else {
            request.setAttribute("error", "Appointment not found.");
        }

        // Refresh the list
        request.setAttribute("appointments", appointmentManager.getAllAppointments());
        request.getRequestDispatcher("/appointment/appointmentList.jsp").forward(request, response);
    }
}

/// used to delete individual appointment records