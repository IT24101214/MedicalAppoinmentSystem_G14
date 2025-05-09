package com.medicalsystem.Doctor_Management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
    private DoctorManager doctorManager;

    @Override
    public void init() {
        String realPath = "E:/Project sem2/MedicalAppointmentSchedulingSystem/src/main/webapp/data/doctors.txt";
        this.doctorManager = new DoctorManager(realPath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = String.format("DOC%03d", doctorManager.getAllDoctors().size() + 1);
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String qualification = request.getParameter("qualification");
        int experience = Integer.parseInt(request.getParameter("yearsOfExperience"));
        String timeSlot = request.getParameter("timeSlot");
        String languages = request.getParameter("languages");

        Doctor doctor = new Doctor(id, name, specialization, email, phone, qualification, experience, timeSlot, languages);
        doctorManager.saveDoctor(doctor);

        List<Doctor> doctorList = doctorManager.getAllDoctors();
        request.setAttribute("doctorList", doctorList);
        request.getRequestDispatcher("/doctorList.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Doctor> doctorList = doctorManager.getAllDoctors();
        request.setAttribute("doctorList", doctorList);
        request.getRequestDispatcher("/doctorList.jsp").forward(request, response);
    }
}
