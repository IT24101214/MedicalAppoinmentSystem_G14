package com.medicalsystem.appointment;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.util.*;

public class AppointmentManager {
    private PriorityQueue<Appointment> appointments;
    private static final String FILE_NAME = "C:\\Users\\lenovo\\Desktop\\New Project OOP\\MedicalAppointmentSchedulingSystem\\src\\main\\resources\\appointments.json";
    private String filePath = FILE_NAME;

    public AppointmentManager(String filePath) {
        this.filePath = filePath;
        appointments = new PriorityQueue<>(
                Comparator.comparingInt(Appointment::getUrgency)
                        .thenComparing(Appointment::getDate)
                        .thenComparing(Appointment::getTime)
        );
    }

    public List<Appointment> getAppointments() {
        return new ArrayList<>(appointments); // Return copy to prevent modification
    }

    public void bookAppointment(Appointment appointment) {
        appointments.offer(appointment);
    }

    public void updateAppointment(int id, String newDate, String newTime) {
        List<Appointment> temp = new ArrayList<>();
        boolean updated = false;

        while (!appointments.isEmpty()) {
            Appointment appointment = appointments.poll();
            if (appointment.getAppointmentID() == id) {
                appointment.setDate(newDate);
                appointment.setTime(newTime);
                updated = true;
            }
            temp.add(appointment);
        }

        appointments.addAll(temp);

        if (!updated) {
            System.out.println("Appointment not found for update.");
        }
    }

    public void deleteAppointment(int id) {
        appointments.removeIf(appointment -> appointment.getAppointmentID() == id);
    }

    public void saveAppointments() {
        try (FileWriter writer = new FileWriter(FILE_NAME)) {
            JSONArray jsonAppointments = new JSONArray();
            for (Appointment appointment : appointments) {
                JSONObject jsonAppointment = new JSONObject();
                jsonAppointment.put("appointmentID", appointment.getAppointmentID());
                jsonAppointment.put("patientName", appointment.getPatientName());
                jsonAppointment.put("doctorName", appointment.getDoctorName());
                jsonAppointment.put("date", appointment.getDate());
                jsonAppointment.put("time", appointment.getTime());
                jsonAppointment.put("urgency", appointment.getUrgency());
                jsonAppointments.put(jsonAppointment);
            }
            writer.write(jsonAppointments.toString());
        } catch (IOException e) {
            System.err.println("Error saving appointments: " + e.getMessage());
        }
    }

    public void loadAppointments() {
        File file = new File(FILE_NAME);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            StringBuilder jsonContent = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }

            if (!jsonContent.isEmpty()) {
                JSONArray jsonAppointments = new JSONArray(jsonContent.toString());
                for (int i = 0; i < jsonAppointments.length(); i++) {
                    JSONObject jsonAppointment = jsonAppointments.getJSONObject(i);
                    Appointment appointment = new Appointment(
                            jsonAppointment.getInt("appointmentID"),
                            jsonAppointment.getString("patientName"),
                            jsonAppointment.getString("doctorName"),
                            jsonAppointment.getString("date"),
                            jsonAppointment.getString("time"),
                            jsonAppointment.getInt("urgency")  // Load urgency
                    );
                    appointments.offer(appointment);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading appointments: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error parsing appointments file: " + e.getMessage());
        }
    }

    public void viewAllAppointments() {
        if (appointments.isEmpty()) {
            System.out.println("No appointments found.");
            return;
        }

        System.out.println("\n--- All Appointments (Sorted by Urgency) ---");
        for (Appointment appointment : appointments) {
            System.out.println(appointment);
        }
    }
    public void sortAppointmentsByUrgency() {
        PriorityQueue<Appointment> priorityQueue = new PriorityQueue<>(Comparator.comparingInt(Appointment::getUrgency));
        priorityQueue.addAll(appointments);

        appointments.clear();
        while (!priorityQueue.isEmpty()) {
            appointments.add(priorityQueue.poll());
        }
    }

}
