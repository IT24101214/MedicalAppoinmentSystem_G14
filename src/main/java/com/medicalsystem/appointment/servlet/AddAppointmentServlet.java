package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.Appointment;
import com.medicalsystem.appointment.AppointmentManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addAppointment")
public class AddAppointmentServlet extends HttpServlet {
    private final AppointmentManager appointmentManager = new AppointmentManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("appointmentId");
        String patientId = request.getParameter("patientId");
        String doctorId = request.getParameter("doctorId");
        String priority = request.getParameter("priority");
        String reason = request.getParameter("reason");
        String status = "Pending";

        Appointment a = new Appointment(id, patientId, doctorId, priority, reason, status);
        appointmentManager.addAppointment(a);

        request.setAttribute("success", "Appointment added successfully!");
        request.getRequestDispatcher("/appointment/addAppointment.jsp").forward(request, response);
    }
}
