package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorSchedule;
import com.medicalsystem.DoctorSchedule.DoctorScheduleList;
import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class EditDoctorScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        String status = request.getParameter("status");

        DoctorScheduleManager manager = new DoctorScheduleManager(getServletContext());
        DoctorScheduleList list = manager.loadSchedules();



        manager.saveAllSchedules(list);
        response.sendRedirect("viewDoctorSchedule.jsp");
    }
}