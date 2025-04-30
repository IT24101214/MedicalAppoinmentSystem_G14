package com.medicalsystem.appointment;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.util.*;

public class AppointmentManager {
    private List<Appointment> appointments;
    private static final String FILE_NAME = "C:\\Users\\lenovo\\Desktop\\New Project OOP\\MedicalAppointmentSchedulingSystem\\src\\main\\resources\\appointments.json";
    private String filePath = FILE_NAME;

    public AppointmentManager(String filePath) {
        appointments = new ArrayList<>();
        this.filePath = filePath;
    }

    public List<Appointment> getAppointments() {
        return new ArrayList<>(appointments); // Return a copy to prevent external modification
    }

    public void bookAppointment(Appointment appointment) {
        appointments.add(appointment);
    }

    public void updateAppointment(int id, String newDate, String newTime) {
        for (Appointment appointment : appointments) {
            if (appointment.getAppointmentID() == id) {
                appointment.setDate(newDate);
                appointment.setTime(newTime);
                break;
            }
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
                jsonAppointments.put(jsonAppointment);
            }
            writer.write(jsonAppointments.toString());
        } catch (IOException e) {
            System.err.println("Error saving appointments: " + e.getMessage());
        }
    }

    // Single Page application in bootstrap

    public void loadAppointments() {
        File file = new File(FILE_NAME);
        if (!file.exists()) {
            return;
        }

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
                            jsonAppointment.getString("time")
                    );
                    appointments.add(appointment);
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

        System.out.println("\n--- All Appointments ---");
        for (Appointment appointment : appointments) {
            System.out.println(appointment);
        }
    }

    public void sortAppointmentsByDate() {
        appointments.sort(Comparator.comparing(Appointment::getDate).
                thenComparing(Appointment::getTime));
    }
}