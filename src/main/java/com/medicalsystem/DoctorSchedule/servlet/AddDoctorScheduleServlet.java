package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorSchedule;
import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addDoctorSchedule")
public class AddDoctorScheduleServlet extends HttpServlet {
    private final DoctorScheduleManager manager = new DoctorScheduleManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String status = request.getParameter("status");

        // Check if any required parameters are missing
        if (doctorId == null || date == null || startTime == null || endTime == null || status == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        // Create a new schedule
        DoctorSchedule schedule = new DoctorSchedule(doctorId, date, startTime, endTime, status);

        // Add the schedule using the manager
        try {
            manager.addSchedule(schedule);
            // Redirect to the list of schedules after successful addition
            response.sendRedirect(request.getContextPath() + "/schedules");  // Ensure this points to the correct page
        } catch (Exception e) {
            // Handle the exception (could be file-related or other issues)
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add schedule.");
        }
    }
}
