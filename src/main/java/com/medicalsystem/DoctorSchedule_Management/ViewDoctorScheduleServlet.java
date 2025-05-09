package com.medicalsystem.DoctorSchedule_Management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ViewDoctorScheduleServlet")
public class ViewDoctorScheduleServlet extends HttpServlet {

    private static final String FILE_PATH = "E:/Project sem2/MedicalAppointmentSchedulingSystem/src/main/webapp/data/doctor_schedules.txt"; // Update path as needed

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorId = (String) request.getSession().getAttribute("doctorId");

        List<DoctorSchedule> doctorSchedules = new ArrayList<>();

        File file = new File(FILE_PATH);
        if (file.exists()) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6 && parts[1].equals(doctorId)) {
                    DoctorSchedule schedule = new DoctorSchedule(
                            parts[0], // scheduleId
                            parts[1], // doctorId
                            parts[2], // date
                            parts[3], // startTime
                            parts[4], // endTime
                            parts[5]  // status
                    );
                    doctorSchedules.add(schedule);
                }
            }
            reader.close();
        }

        request.setAttribute("schedules", doctorSchedules);
        request.getRequestDispatcher("viewDoctorSchedule.jsp").forward(request, response);
    }
}
