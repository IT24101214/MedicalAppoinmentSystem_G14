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
    private DoctorManager doctorManager;

    @Override
    public void init() throws ServletException {
        doctorManager = new DoctorManager(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Doctor doctor = new Doctor(
                    request.getParameter("doctorID"), request.getParameter("name"), request.getParameter("dob"), request.getParameter("gender"),
                    request.getParameter("email"), request.getParameter("phone"), request.getParameter("specialization"), request.getParameter("password")
            );

            doctorManager.addDoctor(doctor);

            response.sendRedirect(request.getContextPath() + "/doctors");

        } catch (IOException e) {

            throw new ServletException("Error adding doctor", e);
        }
    }
}
