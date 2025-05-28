package com.medicalsystem.appointment;

import com.medicalsystem.Doctor.*;
import com.medicalsystem.patient.*;

import java.io.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.medicalsystem.appointment.dsa.PriorityQueue;
import com.medicalsystem.appointment.dsa.DSAUtils;
import com.medicalsystem.appointment.utils.ProjectSetup;

public class AppointmentManager {
    private final String filePath;
    private final PriorityQueue appointmentQueue = new PriorityQueue();

    // Constructor
    public AppointmentManager() {
        ProjectSetup.initializeProjectFolder(); // Ensure folder exists
        this.filePath = ProjectSetup.DATA_FOLDER + "/appointments.txt";

        File file = new File(this.filePath);
        try {
            if (!file.exists()) file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Add appointment
    public void addAppointment(Appointment a) {
        a.setAppointmentTime(LocalTime.now());  // Set time when booking
        appointmentQueue.offer(a);
        appendToFile(a);
    }

    // Read appointments from file
    private List<Appointment> readAppointmentsFromFile() {
        List<Appointment> appointments = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return appointments;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length >= 10) { // Now expects time as 10th part
                    Patient patient = new Patient(parts[1], parts[2], parts[3]);
                    Doctor doctor = new Doctor(parts[4], parts[5]);
                    Appointment appointment = new Appointment(parts[0], patient, doctor, parts[6], parts[7], parts[8]);

                    if (!parts[9].isEmpty()) {
                        appointment.setAppointmentTime(LocalTime.parse(parts[9]));  //time as part
                    }

                    appointments.add(appointment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    // Append single appointment to file
    private void appendToFile(Appointment appointment) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(appointment.toFileString());  // Uses new toFileString with time
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error appending appointment: " + e.getMessage());
        }
    }

    // Load all appointments from file into queue
    private void loadFromFile() {
        appointmentQueue.clear();
        List<Appointment> appointments = readAppointmentsFromFile();
        appointmentQueue.addAll(appointments);
    }

    // Get appointments sorted by priority
    public List<Appointment> getSortedAppointments() {
        loadFromFile();
        List<Appointment> sortedList = appointmentQueue.toList();
        DSAUtils.bubbleSort(sortedList);
        return sortedList;
    }

    // Get all appointments
    public List<Appointment> getAllAppointments() {
        return readAppointmentsFromFile();
    }

    // Overwrite file with full list of appointments
    public void saveAllAppointments(List<Appointment> appointments) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, false))) {
            for (Appointment app : appointments) {
                writer.println(app.toFileString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Delete appointment by ID
    public boolean deleteAppointment(String appointmentId) {
        List<Appointment> appointments = getAllAppointments();
        boolean removed = appointments.removeIf(app -> app.getAppointmentID().equals(appointmentId));
        if (removed) {
            saveAllAppointments(appointments);
        }
        return removed;
    }

    // Find appointment by ID
    public Appointment findAppointmentById(String appointmentId) {
        List<Appointment> appointments = getAllAppointments();
        for (Appointment a : appointments) {
            if (a.getAppointmentID().equals(appointmentId)) {
                return a;
            }
        }
        return null;
    }

    // Update an appointment
    public boolean updateAppointment(Appointment updated) {
        List<Appointment> appointments = getAllAppointments();
        for (int i = 0; i < appointments.size(); i++) {
            if (appointments.get(i).getAppointmentID().equals(updated.getAppointmentID())) {
                appointments.set(i, updated);
                saveAllAppointments(appointments);
                return true;
            }
        }
        return false;
    }

    // Generate unique ID
    public String generateAppointmentId() {
        loadFromFile();
        return DSAUtils.generateAppointmentId(appointmentQueue.toList());
    }
}
