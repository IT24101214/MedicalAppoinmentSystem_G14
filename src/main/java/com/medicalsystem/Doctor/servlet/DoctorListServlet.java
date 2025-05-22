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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Re-initialize DoctorManager every time to avoid stale data
        DoctorManager doctorManager = new DoctorManager(getServletContext());

        try {
            List<Doctor> doctors = doctorManager.getAllDoctors();
            request.setAttribute("doctors", doctors);

            // Forward to JSP to show list
            RequestDispatcher dispatcher = request.getRequestDispatcher("/doctor/doctorList.jsp");
            dispatcher.forward(request, response);

        } catch (IOException e) {
            throw new ServletException("Error loading doctors", e);
        }
    }
}
