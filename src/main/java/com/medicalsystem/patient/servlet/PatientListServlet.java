package com.medicalsystem.patient.servlet;


import com.medicalsystem.patient.Patient;
import com.medicalsystem.patient.PatientManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/patients")
public class PatientListServlet extends HttpServlet {
    private final PatientManager patientManager = new PatientManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Patient> patients = patientManager.getAllPatients();
        request.setAttribute("patients", patients);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/patient/patientList.jsp");
        dispatcher.forward(request, response);
    }
}
