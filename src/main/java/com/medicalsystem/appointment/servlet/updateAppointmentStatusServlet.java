package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.Appointment;
import com.medicalsystem.appointment.AppointmentManager;
import com.medicalsystem.Doctor.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateAppointment")
public class updateAppointmentStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentId = request.getParameter("appointmentId");
        String doctorId = request.getParameter("doctorId");
        String specialization = request.getParameter("specialization");
        String priority = request.getParameter("priority");
        String reason = request.getParameter("reason");
        String status = request.getParameter("status");

        AppointmentManager appointmentManager = new AppointmentManager();

        // Get existing appointment
        Appointment appointment = appointmentManager.findAppointmentById(appointmentId);
        if (appointment == null) {
            request.setAttribute("error", "Appointment not found.");
            request.getRequestDispatcher("/appointment/appointmentList.jsp").forward(request, response);
            return;
        }

        // Update fields
        Doctor updatedDoctor = new Doctor(doctorId, specialization);
        appointment.setStatus(status);
        appointment.setReason(reason);
        appointment.setPriority(priority);
        appointment.setDoctor(updatedDoctor);

        // Save back to file
        appointmentManager.updateAppointment(appointment);

        // Redirect or forward
        request.setAttribute("success", "Appointment updated successfully.");
        request.setAttribute("appointments", appointmentManager.getSortedAppointments());
        request.getRequestDispatcher("/appointment/appointmentList.jsp").forward(request, response);
    }
}
