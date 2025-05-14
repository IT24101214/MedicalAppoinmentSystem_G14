package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteSchedule")
public class DeleteDoctorScheduleServlet extends HttpServlet {
    private final DoctorScheduleManager manager = new DoctorScheduleManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");

        // Delete logic here (implementation needed in DoctorScheduleManager)
        // manager.deleteSchedule(doctorId, date);

        response.sendRedirect("schedules");
    }
}