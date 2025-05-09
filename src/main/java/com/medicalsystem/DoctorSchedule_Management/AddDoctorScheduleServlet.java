package com.medicalsystem.DoctorSchedule_Management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/addDoctorSchedule")
public class AddDoctorScheduleServlet extends HttpServlet {

    private String filePath;

    @Override
    public void init() {
        filePath = getServletContext().getRealPath("/data/doctor_schedules.txt");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String doctorId = req.getParameter("doctorId");
        String date = req.getParameter("date");
        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");
        String status = req.getParameter("status");

        DoctorScheduleManager manager = new DoctorScheduleManager(filePath);
        List<DoctorSchedule> existingSchedules = manager.getAllSchedules();

        // Generate next scheduleId
        int maxId = 0;
        for (DoctorSchedule schedule : existingSchedules) {
            String idStr = schedule.getScheduleId().replace("S", "");
            try {
                int idNum = Integer.parseInt(idStr);
                if (idNum > maxId) {
                    maxId = idNum;
                }
            } catch (NumberFormatException ignored) {}
        }
        String newScheduleId = String.format("S%04d", maxId + 1);

        DoctorSchedule schedule = new DoctorSchedule(newScheduleId, doctorId, date, startTime, endTime, status);
        manager.addSchedule(schedule);

        resp.sendRedirect("doctorScheduleList.jsp");
    }
}
