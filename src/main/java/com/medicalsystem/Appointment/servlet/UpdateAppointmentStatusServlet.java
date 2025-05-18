package com.medicalsystem.Appointment.servlet;

import com.medicalsystem.Appointment.Appointment;
import com.medicalsystem.Appointment.AppointmentManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateAppointmentStatus")
public class UpdateAppointmentStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentId = request.getParameter("appointmentId");
        String newStatus = request.getParameter("status");

        String filePath = getServletContext().getRealPath("/data/appointments.txt");
        AppointmentManager manager = new AppointmentManager(filePath);

        // Load, update, save
        List<Appointment> appointments = manager.getSortedAppointments(); // loads from file
        for (Appointment a : appointments) {
            if (a.getAppointmentID().equals(appointmentId)) {
                a.setStatus(newStatus);
                break;
            }
        }

        manager.updateAppointments(appointments); // implement this in AppointmentManager
        response.sendRedirect("appointments");
    }
}
