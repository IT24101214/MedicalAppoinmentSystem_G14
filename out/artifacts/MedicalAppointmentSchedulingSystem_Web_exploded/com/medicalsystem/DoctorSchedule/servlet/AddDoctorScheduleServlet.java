package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorSchedule;
import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import com.medicalsystem.Doctor.DoctorManager;
import com.medicalsystem.Doctor.Doctor;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/schedule/addDoctorSchedule")
public class AddDoctorScheduleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorId = request.getParameter("doctorID");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String status = request.getParameter("status");
        String[] selectedDays = request.getParameterValues("availability");  // This can be null if none selected

        ServletContext context = getServletContext();

        // Validate Doctor
        DoctorManager doctorManager = new DoctorManager(context);
        Doctor doctor = doctorManager.getDoctorById(doctorId);

        System.out.println("Received Doctor ID: " + doctorId); // DEBUG
        System.out.println("Doctor found: " + (doctor != null)); // DEBUG

        if (doctor == null) {
            response.sendRedirect(request.getContextPath() + "/addDoctorSchedule.jsp?error=Invalid+Doctor+ID");
            return;
        }

        // If no days selected, set empty array (never null to avoid null checks)
        if (selectedDays == null) {
            selectedDays = new String[0];
        }

        // Build DoctorSchedule with only selected days
        DoctorSchedule schedule = new DoctorSchedule(doctorId, startTime, endTime, status, selectedDays);

        // Save Schedule
        DoctorScheduleManager scheduleManager = new DoctorScheduleManager(context);
        scheduleManager.addSchedule(schedule);

        // Redirect to view page
        response.sendRedirect(request.getContextPath() + "/viewDoctorSchedule");
    }}