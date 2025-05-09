package com.medicalsystem.DoctorSchedule_Management;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorScheduleListServlet")
public class DoctorScheduleListServlet extends HttpServlet {
    private String filePath;

    @Override
    public void init() {
        filePath = getServletContext().getRealPath("/data/doctor_schedules.txt");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DoctorScheduleManager manager = new DoctorScheduleManager(filePath);
        List<DoctorSchedule> schedules = manager.getAllSchedules();
        req.setAttribute("schedules", schedules);
        RequestDispatcher dispatcher = req.getRequestDispatcher("doctorScheduleList.jsp");
        dispatcher.forward(req, resp);
    }
}
