package com.medicalsystem.appointment;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.util.List;

public class AppointmentFileHandler {
    private static final String FILE_NAME = "appointments.txt";

    // Save appointments to a file
    public static void saveAppointments(List<Appointment> appointments) {
        // Try-with-resources to ensure the FileWriter is closed properly
        try (FileWriter writer = new FileWriter(FILE_NAME)) {
            // Create a JSONArray to store appointment data
            JSONArray jsonAppointments = new JSONArray();

            // Loop through the list of appointments and convert them into JSON format
            for (Appointment appointment : appointments) {
                JSONObject jsonAppointment = new JSONObject();
                jsonAppointment.put("appointmentID", appointment.getAppointmentID());
                jsonAppointment.put("patientName", appointment.getPatientName());
                jsonAppointment.put("doctorName", appointment.getDoctorName());
                jsonAppointment.put("date", appointment.getDate());
                jsonAppointment.put("time", appointment.getTime());
                jsonAppointments.put(jsonAppointment);
            }

            // Write the JSON array to the file
            writer.write(jsonAppointments.toString());
            System.out.println("Appointments saved successfully!");
        } catch (IOException e) {
            // Handle file I/O exceptions
            System.err.println("Error saving appointments: " + e.getMessage());
        } catch (Exception e) {
            // Handle any unexpected exceptions
            System.err.println("Unexpected error while saving appointments: " + e.getMessage());
        }
    }

    // Load appointments from a file
    public static void loadAppointments(List<Appointment> appointments) {
        File file = new File(FILE_NAME);

        // If the file does not exist, just return without doing anything
        if (!file.exists()) {
            System.out.println("No existing appointment file found. Starting fresh.");
            return;
        }

        // Try-with-resources to automatically close the BufferedReader
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            StringBuilder jsonContent = new StringBuilder();
            String line;

            // Read the file line by line and append the content to jsonContent
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }

            // Check if the file contains data
            if (jsonContent.length() > 0) {
                // Parse the JSON content and load appointments
                JSONArray jsonAppointments = new JSONArray(jsonContent.toString());
                for (int i = 0; i < jsonAppointments.length(); i++) {
                    JSONObject jsonAppointment = jsonAppointments.getJSONObject(i);

                    // Create an Appointment object from JSON and add it to the appointments list
                    Appointment appointment = new Appointment(
                            jsonAppointment.getInt("appointmentID"),
                            jsonAppointment.getString("patientName"),
                            jsonAppointment.getString("doctorName"),
                            jsonAppointment.getString("date"),
                            jsonAppointment.getString("time")
                    );
                    appointments.add(appointment);
                }
                System.out.println("Appointments loaded successfully!");
            } else {
                System.out.println("The appointments file is empty. No data loaded.");
            }
        } catch (IOException e) {
            // Handle file I/O exceptions
            System.err.println("Error loading appointments: " + e.getMessage());
        } catch (Exception e) {
            // Handle any unexpected exceptions
            System.err.println("Error parsing appointments file: " + e.getMessage());
        }
    }
}



