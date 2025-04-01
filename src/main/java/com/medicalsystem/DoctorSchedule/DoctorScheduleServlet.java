package com.medicalsystem.DoctorSchedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/doctorSchedule")
public class DoctorScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> schedules = FileHandler.readDoctorSchedules(); // Sorted schedules

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Doctor Schedules</h1>");

        if (schedules.isEmpty()) {
            out.println("<p>No schedules found.</p>");
        } else {
            out.println("<ul>");
            for (String schedule : schedules) {
                out.println("<li>" + schedule + "</li>");
            }
            out.println("</ul>");
        }

        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorName = request.getParameter("doctorName");
        String timeSlot = request.getParameter("timeSlot");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");

        if (doctorName == null || doctorName.trim().isEmpty() || timeSlot == null || timeSlot.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3 style='color:red;'>Error: Doctor name and time slot are required!</h3>");
        } else {
            FileHandler.saveDoctorSchedule(doctorName, timeSlot);
            out.println("<h3 style='color:green;'>Schedule Added Successfully!</h3>");
        }

        out.println("</body></html>");
    }
}
