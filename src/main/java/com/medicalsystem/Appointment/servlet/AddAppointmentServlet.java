package com.medicalsystem.Appointment.servlet;

import com.medicalsystem.Appointment.Appointment;
import com.medicalsystem.Appointment.AppointmentManager;
import com.medicalsystem.Patient.Patient;
import com.medicalsystem.Patient.PatientManager;
import com.medicalsystem.Doctor.Doctor;
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
        String name = request.getParameter("patientName");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String doctorId = request.getParameter("doctorId");
        String specialization = request.getParameter("specialization");
        String priority = request.getParameter("priority");
        String reason = request.getParameter("reason");
        String status = "Pending";

        // Store patient
        Patient patient = new Patient(name, gender, phone);
        String patientFilePath = getServletContext().getRealPath("/data/patients.txt");
        PatientManager patientManager = new PatientManager(patientFilePath);
        patientManager.addPatient(patient);

        // Store appointment
        String appointmentFilePath = getServletContext().getRealPath("/data/appointments.txt");
        AppointmentManager appointmentManager = new AppointmentManager(appointmentFilePath);
        System.out.println("Resolved path: " + appointmentFilePath);

        Doctor doctor = new Doctor(doctorId, specialization); //  doctor object

        String appointmentId = appointmentManager.generateAppointmentId(); // Auto-generate of appointmentID
        Appointment appointment = new Appointment(appointmentId, patient, doctor, priority, reason, status);
        appointmentManager.addAppointment(appointment);

        // Show success
        request.setAttribute("success", "Appointment added Successfully!");
        request.getRequestDispatcher("/appointment/addAppointment.jsp").forward(request, response);
    }
}

