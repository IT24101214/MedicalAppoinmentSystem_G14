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
        PatientManager patientManager = new PatientManager(); // no path needed now
        patientManager.addPatient(patient);

        // Store appointment
        AppointmentManager appointmentManager = new AppointmentManager(); // no path needed now
        String appointmentId = appointmentManager.generateAppointmentId();
        Doctor doctor = new Doctor(doctorId, specialization);
        Appointment appointment = new Appointment(appointmentId, patient, doctor, priority, reason, status);
        appointmentManager.addAppointment(appointment);

        // Show success
        request.setAttribute("success", "Appointment Added Successfully!");
        request.getRequestDispatcher("/appointment/addAppointment.jsp").forward(request, response);
    }
}
