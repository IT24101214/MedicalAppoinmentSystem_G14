package com.medicalsystem.DoctorSchedule;

import jakarta.servlet.ServletContext;

import java.io.*;

public class DoctorScheduleManager {
    private final String filePath;

    public DoctorScheduleManager(ServletContext context) {
        File deployRoot = new File(context.getRealPath("/"));
        File projectRoot = deployRoot.getParentFile().getParentFile();
        File dataDir = new File(projectRoot, "data");
        if (!dataDir.exists()) dataDir.mkdirs();
        File file = new File(dataDir, "doctor_schedule.txt");
        this.filePath = file.getAbsolutePath();

        try {
            if (!file.exists()) file.createNewFile();
        } catch (IOException e) {
            throw new RuntimeException("Could not create doctor_schedule.txt file", e);
        }
    }

    // Add a new schedule
    public void addSchedule(DoctorSchedule schedule) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(schedule.toString());  // Assume toString returns a flat savable format
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all schedules
    public DoctorScheduleList loadSchedules() {
        DoctorScheduleList list = new DoctorScheduleList();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                DoctorSchedule schedule = DoctorSchedule.fromString(line);
                if (schedule != null) {
                    list.add(schedule);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Save all schedules from the list (overwrite file)
    public void saveAllSchedules(DoctorScheduleList list) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (int i = 0; i < list.size(); i++) {
                bw.write(list.get(i).toString());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}