package com.medicalsystem.appointment.servlet;

import com.medicalsystem.appointment.Appointment;
import com.medicalsystem.appointment.AppointmentManager;
import com.medicalsystem.patient.Patient;
import com.medicalsystem.patient.PatientManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addAppointment")
public class AddAppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form inputs
        String appointmentId = request.getParameter("appointmentId");
        String name = request.getParameter("patientName");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String doctorId = request.getParameter("doctorId");
        String priority = request.getParameter("priority");
        String reason = request.getParameter("reason");
        String status = "Pending";

        // Create and store patient
        Patient patient = new Patient(name, gender, phone);
        String patientFilePath = getServletContext().getRealPath("/WEB-INF/patients.txt");
        PatientManager patientManager = new PatientManager(patientFilePath);
        patientManager.addPatient(patient);

        // Create and store appointment linked to patient
        String appointmentFilePath = getServletContext().getRealPath("/WEB-INF/appointment.txt");
        AppointmentManager appointmentManager = new AppointmentManager(appointmentFilePath);
        Appointment appointment = new Appointment(appointmentId, patient, doctorId, priority, reason, status);
        appointmentManager.addAppointment(appointment);

        // Set success message
        request.setAttribute("success", "Appointment added Successfully!");
        request.getRequestDispatcher("/appointment/addAppointment.jsp").forward(request, response);
    }
}
