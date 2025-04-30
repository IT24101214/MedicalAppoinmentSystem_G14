package com.medicalsystem.appointment;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet(name = "AppointmentServlet", urlPatterns = {"/appointments"})
public class AppointmentServlet extends HttpServlet {
    private AppointmentManager manager;
    private final String FILE_PATH = "/appointments.json";

    @Override
    public void init() throws ServletException {
        super.init();
        String path = getServletContext().getRealPath(FILE_PATH);
        manager = new AppointmentManager(path);
        manager.loadAppointments();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }

        switch (action) {
            case "view":
                viewAppointments(request, response);
                break;
            case "cancel":
                cancelAppointment(request, response);
                break;
            case "reschedule":
                showRescheduleForm(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "book":
                bookAppointment(request, response);
                break;
            case "update":
                rescheduleAppointment(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found");
        }
    }

    private void viewAppointments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Appointment> appointments = manager.getAppointments();
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("/viewAppointments.jsp").forward(request, response);
    }

    private void bookAppointment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        System.out.println("Booking Appointment.....");
        String patientName = request.getParameter("patientName");
        String doctorName = request.getParameter("doctorName");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        int newId = manager.getAppointments().isEmpty() ? 1 :
                manager.getAppointments().stream()
                        .mapToInt(Appointment::getAppointmentID)
                        .max().getAsInt() + 1;

        Appointment appointment = new Appointment(newId, patientName, doctorName, date, time);
        manager.bookAppointment(appointment);
        manager.saveAppointments();

        response.sendRedirect("appointments?action=view");
    }

    private void cancelAppointment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int appointmentID = Integer.parseInt(request.getParameter("appointmentID"));
        manager.deleteAppointment(appointmentID);
        manager.saveAppointments();
        response.sendRedirect("appointments?action=view");
    }

    private void showRescheduleForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentID = Integer.parseInt(request.getParameter("appointmentID"));
        Optional<Appointment> appointment = manager.getAppointments().stream()
                .filter(a -> a.getAppointmentID() == appointmentID)
                .findFirst();

        if (appointment.isPresent()) {
            request.setAttribute("appointment", appointment.get());
            request.getRequestDispatcher("/rescheduleForm.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Appointment not found");
        }
    }

    private void rescheduleAppointment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int appointmentID = Integer.parseInt(request.getParameter("appointmentID"));
        String newDate = request.getParameter("newDate");
        String newTime = request.getParameter("newTime");

        manager.updateAppointment(appointmentID, newDate, newTime);
        manager.saveAppointments();
        response.sendRedirect("appointments?action=view");
    }

    @Override
    public void destroy() {
        manager.saveAppointments();
        super.destroy();
    }
}