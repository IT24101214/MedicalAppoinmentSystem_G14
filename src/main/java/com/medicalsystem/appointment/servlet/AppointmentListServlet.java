package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.Appointment;
import com.medicalsystem.appointment.AppointmentManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/appointments")
public class AppointmentListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getServletContext().getRealPath("/WEB-INF/appointment.txt");

        AppointmentManager appointmentManager = new AppointmentManager(filePath);
        List<Appointment> sortedAppointments = appointmentManager.getSortedAppointments();

        request.setAttribute("appointments", sortedAppointments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/appointmentList.jsp");
        dispatcher.forward(request, response);
    }
}


