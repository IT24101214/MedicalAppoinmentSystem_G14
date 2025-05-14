package com.medicalsystem.Doctor.servlet;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Doctor.DoctorManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editDoctor")
public class EditDoctorServlet extends HttpServlet {
    private final DoctorManager doctorManager = new DoctorManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Doctor doctor = doctorManager.getAllDoctors().stream()
                .filter(d -> d.getId().equals(id))
                .findFirst()
                .orElse(null);

        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("/doctor/editDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String availability = request.getParameter("availability");

        // Update logic would go here (you'll need to implement it in DoctorManager)
        // For now we'll just redirect
        response.sendRedirect("doctors");
    }
}