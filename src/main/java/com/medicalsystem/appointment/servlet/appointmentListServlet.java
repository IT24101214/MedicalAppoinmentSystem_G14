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

@WebServlet("/appointment/appointmentListServlet")
public class appointmentListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AppointmentManager appointmentManager = new AppointmentManager();
        List<Appointment> sortedAppointments = appointmentManager.getSortedAppointments();


        request.setAttribute("appointments", sortedAppointments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/appointment/appointmentList.jsp");
        dispatcher.forward(request, response);
    }
}



