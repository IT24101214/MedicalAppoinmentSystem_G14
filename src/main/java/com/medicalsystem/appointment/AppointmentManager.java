package com.medicalsystem.appointment;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;

public class AppointmentManager {
    private static final String FILE_PATH = "data/appointment.txt";
    private PriorityQueue<Appointment> appointmentQueue = new PriorityQueue<>();

    public void addAppointment(Appointment a) {
        appointmentQueue.add(a);
        saveToFile();
    }

    public List<Appointment> getSortedAppointments() {
        loadFromFile();
        List<Appointment> sortedList = new ArrayList<>(appointmentQueue);
        bubbleSort(sortedList);
        return sortedList;
    }
    /// Bubble Sort Used to sort Appointments
    private void bubbleSort(List<Appointment> list) {
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
            for (Appointment a : appointmentQueue) {
                writer.write(String.join(",", a.getAppointmentId(), a.getPatientId(), a.getDoctorId(),
                        a.getPriority(), a.getReason(), a.getStatus()));
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving appointments: " + e.getMessage());
        }
    }

    private void loadFromFile() {
        appointmentQueue.clear();
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 6) {
                    Appointment a = new Appointment(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
                    appointmentQueue.add(a);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading appointments: " + e.getMessage());
        }
    }
}
