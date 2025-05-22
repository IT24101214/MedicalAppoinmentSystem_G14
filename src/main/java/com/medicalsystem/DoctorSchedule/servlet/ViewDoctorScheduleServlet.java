package com.medicalsystem.DoctorSchedule.servlet;

import com.medicalsystem.DoctorSchedule.DoctorSchedule;
import com.medicalsystem.DoctorSchedule.DoctorScheduleList;
import com.medicalsystem.DoctorSchedule.DoctorScheduleManager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/viewDoctorSchedule")
public class ViewDoctorScheduleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DoctorScheduleManager manager = new DoctorScheduleManager(getServletContext());

        DoctorScheduleList scheduleList = manager.loadSchedules();

        // Pass an array of DoctorSchedule to JSP to avoid casting issues
        DoctorSchedule[] schedulesArray = scheduleList.toArray();

        request.setAttribute("scheduleList", schedulesArray);



        RequestDispatcher dispatcher = request.getRequestDispatcher("/schedule/ViewDoctorSchedule.jsp");
        dispatcher.forward(request, response);


    }
}