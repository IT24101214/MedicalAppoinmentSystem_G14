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
    private DoctorManager doctorManager;

    @Override
    public void init() throws ServletException {
        doctorManager = new DoctorManager(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doctorId = request.getParameter("id");

        if (doctorId == null || doctorId.isEmpty()) {
            response.sendRedirect("listDoctors");
            return;
        }

        Doctor doctor = doctorManager.getDoctorById(doctorId);

        if (doctor == null) {
            response.sendRedirect("listDoctors");
            return;
        }

        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("/doctor/editDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doctorID = request.getParameter("doctorID");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");

        Doctor existingDoctor = doctorManager.getDoctorById(doctorID);

        if (existingDoctor == null) {
            response.sendRedirect("listDoctors");
            return;
        }

        String password = existingDoctor.getPassword();

        // Create updated doctor WITHOUT availability since field removed
        Doctor updatedDoctor = new Doctor(doctorID, name, dob, gender, email, phone, specialization, password);
        doctorManager.updateDoctor(updatedDoctor);

        response.sendRedirect("listDoctors");
    }
}
