package com.medicalsystem.DoctorSchedule_Management;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorScheduleManager {
    private final File file;

    public DoctorScheduleManager(String filePath) {
        this.file = new File(filePath);
    }

    public List<DoctorSchedule> getAllSchedules() {
        List<DoctorSchedule> schedules = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(";");
                if (parts.length == 6) {
                    schedules.add(new DoctorSchedule(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    public void addSchedule(DoctorSchedule schedule) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) {
            bw.write(schedule.toString());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
