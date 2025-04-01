package com.medicalsystem.DoctorSchedule;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String FILE_PATH = "doctors.txt"; // Fixed filename issue

    // Method to save doctor schedule
    public static void saveDoctorSchedule(String doctorName, String timeSlot) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(doctorName + "," + timeSlot);
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to read doctor schedules
    public static List<String> readDoctorSchedules() {
        List<String> schedules = new ArrayList<>();

        // Check if the file exists, if not, create it
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                System.err.println("Error creating file: " + e.getMessage());
                e.printStackTrace();
            }
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                schedules.add(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading from file: " + e.getMessage());
            e.printStackTrace();
        }

        // Sort the schedules using Bubble Sort
        bubbleSort(schedules);

        return schedules;
    }

    // Bubble Sort to sort the schedules (time slots) alphabetically or by desired criteria
    private static void bubbleSort(List<String> schedules) {
        int n = schedules.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                // Comparing the schedules; assuming the time slot is part of the schedule string
                String[] schedule1 = schedules.get(j).split(",");
                String[] schedule2 = schedules.get(j + 1).split(",");
                String timeSlot1 = schedule1[1].trim();
                String timeSlot2 = schedule2[1].trim();

                if (timeSlot1.compareTo(timeSlot2) > 0) {
                    // Swap if the time slots are in the wrong order
                    String temp = schedules.get(j);
                    schedules.set(j, schedules.get(j + 1));
                    schedules.set(j + 1, temp);
                }
            }
        }
    }
}
