package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorSchedule;
import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/schedules")
public class ScheduleListServlet extends HttpServlet {
    private final DoctorScheduleManager manager = new DoctorScheduleManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<DoctorSchedule> schedules = manager.getSortedSchedules();
        request.setAttribute("schedules", schedules);

        // ✅ Correct JSP path
        RequestDispatcher dispatcher = request.getRequestDispatcher("/schedule/scheduleList.jsp");
        dispatcher.forward(request, response);
    }
}
