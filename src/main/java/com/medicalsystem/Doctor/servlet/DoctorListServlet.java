package com.medicalsystem.Doctor.servlet;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Doctor.DoctorManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctors")
public class DoctorListServlet extends HttpServlet {
    private final DoctorManager doctorManager = new DoctorManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Doctor> doctors = doctorManager.getAllDoctors();
        request.setAttribute("doctors", doctors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/doctor/doctorList.jsp");
        dispatcher.forward(request, response);
    }
}
