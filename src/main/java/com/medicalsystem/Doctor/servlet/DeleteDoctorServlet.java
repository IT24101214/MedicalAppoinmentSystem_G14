package com.medicalsystem.Doctor.servlet;

import com.medicalsystem.Doctor.DoctorManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteDoctor")
public class DeleteDoctorServlet extends HttpServlet {
    private final DoctorManager doctorManager = new DoctorManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        // Delete logic would go here (you'll need to implement it in DoctorManager)
        // For now we'll just redirect
        response.sendRedirect("doctors");
    }
}