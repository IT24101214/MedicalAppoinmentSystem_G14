package com.medicalsystem.Doctor.servlet;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Doctor.DoctorManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {
    private final DoctorManager doctorManager = new DoctorManager(); //

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

        Doctor doctor = new Doctor(id, name, dob, gender, email, phone, specialization, availability);

        doctorManager.addDoctor(doctor); //

        //  Redirect to Doctor List Servlet
        response.sendRedirect(request.getContextPath() + "/doctors");
    }
}
