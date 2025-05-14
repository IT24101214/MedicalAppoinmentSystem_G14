package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editSchedule")
public class EditDoctorScheduleServlet extends HttpServlet {
    private final DoctorScheduleManager manager = new DoctorScheduleManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");

        // Find the schedule to edit (implementation needed in DoctorScheduleManager)
        // DoctorSchedule schedule = manager.getSchedule(doctorId, date);
        // request.setAttribute("schedule", schedule);

        request.getRequestDispatcher("/schedule/editSchedule.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Update logic here
        response.sendRedirect("schedules");
    }
}