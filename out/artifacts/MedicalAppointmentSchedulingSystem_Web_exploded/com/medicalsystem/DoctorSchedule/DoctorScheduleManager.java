package com.medicalsystem.DoctorSchedule;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;

public class DoctorScheduleManager {
    private static final String FILE_PATH = "E:/Project sem2/MedicalAppointmentSchedulingSystem1/data/doctorSchedule.txt";
    private PriorityQueue<DoctorSchedule> scheduleQueue = new PriorityQueue<>();

    public void addSchedule(DoctorSchedule schedule) {
        scheduleQueue.add(schedule);
        saveToFile();
    }

    public List<DoctorSchedule> getSortedSchedules() {
        loadFromFile();
        List<DoctorSchedule> sortedList = new ArrayList<>(scheduleQueue);
        bubbleSort(sortedList);
        return sortedList;
    }
    public DoctorSchedule getSchedule(String doctorId, String date) {
        loadFromFile(); // Ensure we have latest data
        for (DoctorSchedule schedule : scheduleQueue) {
            if (schedule.getDoctorId().equals(doctorId) && schedule.getDate().equals(date)) {
                return schedule;
            }
        }
        return null; // Return null if not found
    }

    public void deleteSchedule(String doctorId, String date) {
        loadFromFile(); // Ensure we have latest data
        scheduleQueue.removeIf(schedule ->
                schedule.getDoctorId().equals(doctorId) && schedule.getDate().equals(date));
        saveToFile(); // Persist changes
    }

    private void bubbleSort(List<DoctorSchedule> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (list.get(j).compareTo(list.get(j + 1)) > 0) {
                    Collections.swap(list, j, j + 1);
                }
            }
        }
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (DoctorSchedule ds : scheduleQueue) {
                writer.write(String.join(",", ds.getDoctorId(), ds.getDate(),
                        ds.getStartTime(), ds.getEndTime(), ds.getStatus()));
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving doctor schedules: " + e.getMessage());
        }
    }

    private void loadFromFile() {
        scheduleQueue.clear();
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 5) {
                    DoctorSchedule ds = new DoctorSchedule(parts[0], parts[1], parts[2], parts[3], parts[4]);
                    scheduleQueue.add(ds);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading doctor schedules: " + e.getMessage());
        }
    }
}
