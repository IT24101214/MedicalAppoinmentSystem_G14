package com.medicalsystem.patient.servlet;


import com.medicalsystem.patient.Patient;
import com.medicalsystem.patient.PatientManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {
    private final PatientManager patientManager = new PatientManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Patient patient = new Patient(id, name, dob, gender, email, phone);
        patientManager.addPatient(patient);

        response.sendRedirect("patient/patientList.jsp");
    }
}
