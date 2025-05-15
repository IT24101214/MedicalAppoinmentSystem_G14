package com.medicalsystem.appointment;

import com.medicalsystem.patient.Patient;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;

public class AppointmentManager {
        private final String filePath;
        private final PriorityQueue<Appointment> appointmentQueue = new PriorityQueue<>();

        public AppointmentManager(String filePath) {
            this.filePath = filePath;
        }

    // Then use filePath instead of FILE_PATH
    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Appointment a : appointmentQueue) {
                Patient p = a.getPatient();
                writer.write(String.join(",", a.getAppointmentId(), p.getName(), p.getGender(), p.getPhone(),
                        a.getDoctorId(), a.getPriority(), a.getReason(), a.getStatus()));
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving appointments: " + e.getMessage());
        }
    }

    public boolean deleteAppointment(String appointmentId) {
        List<Appointment> allAppointments = getAllAppointments();
        boolean removed = allAppointments.removeIf(app -> app.getAppointmentId().equals(appointmentId));
        if (removed) {
            saveAllAppointments(allAppointments);
        }
        return removed;
    }

    private void saveAllAppointments(List<Appointment> appointments) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, false))) {
            for (Appointment app : appointments) {
                writer.println(app.toFileString()); // ensure this method exists
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadFromFile() {
        appointmentQueue.clear();
        File file = new File(filePath);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 8) {
                    Patient p = new Patient(parts[1], parts[2], parts[3]);
                    Appointment a = new Appointment(parts[0], p, parts[4], parts[5], parts[6], parts[7]);
                    appointmentQueue.add(a);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading appointments: " + e.getMessage());
        }
    }


    public List<Appointment> getSortedAppointments() {
        loadFromFile();
        System.out.println("Loaded appointments: " + appointmentQueue.size());
        List<Appointment> sortedList = new ArrayList<>(appointmentQueue);
        bubbleSort(sortedList);
        for (Appointment a : sortedList) {
            System.out.println("Appointment: " + a.getAppointmentId() + " | Status: " + a.getStatus());
        }
        return sortedList;
    }
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


    public void addAppointment(Appointment a) {
        loadFromFile();
        // Add new appointment to the queue
        appointmentQueue.add(a);
        // Save updated list to file
        saveToFile();
    }

    public void updateAppointments(List<Appointment> updatedList) {
        appointmentQueue.clear();
        appointmentQueue.addAll(updatedList);
        saveToFile();
    }
    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|"); // Assuming '|' is the delimiter

                if (parts.length >= 9) {
                    String appointmentId = parts[0];
                    String name = parts[1];
                    String gender = parts[2];
                    String phone = parts[3];
                    String doctorId = parts[4];
                    String priority = parts[5];
                    String reason = parts[6];
                    String status = parts[7];

                    // Reconstruct Patient and Appointment
                    Patient patient = new Patient(name, gender, phone);
                    Appointment appointment = new Appointment(appointmentId, patient, doctorId, priority, reason, status);

                    appointments.add(appointment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return appointments;
    }


}

