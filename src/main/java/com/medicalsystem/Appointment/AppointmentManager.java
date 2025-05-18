package com.medicalsystem.Appointment;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Patient.Patient;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;
import com.medicalsystem.dsa.DSAUtils;


public class AppointmentManager {
        private final String filePath ;
        private final PriorityQueue<Appointment> appointmentQueue = new PriorityQueue<>();

        public AppointmentManager(String filePath) {
            if (filePath == null) {
                throw new IllegalArgumentException("File path must not be null.");
            }
            this.filePath = filePath;

        }

    // adding an appointment as queue to file
    private void appendToFile(Appointment appointment) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            Patient p = appointment.getPatient();
            Doctor d = appointment.getDoctor();
            writer.write(String.join(",", appointment.getAppointmentID(), p.getName(), p.getGender(), p.getPhone(),
                    d.getId(),d.getSpecialization(), appointment.getPriority(), appointment.getReason(), appointment.getStatus()));
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error appending appointment: " + e.getMessage());
        }
    }


    public boolean deleteAppointment(String appointmentId) {
        List<Appointment> allAppointments = getAllAppointments();
        boolean removed = allAppointments.removeIf(app -> app.getAppointmentID().equals(appointmentId));
        if (removed) {
            saveAllAppointments(allAppointments);
        }
        return removed;
    }

    private void saveAllAppointments(List<Appointment> appointments) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, false))) {
            for (Appointment app : appointments) {
                writer.println(app.toFileString());
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
                    Doctor d = new Doctor(parts[4], parts[5]);
                    Appointment a = new Appointment(parts[0], p, d, parts[6],parts[7], parts[8]);
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
        DSAUtils.bubbleSort(sortedList);
        for (Appointment a : sortedList) {
            System.out.println("Appointment: " + a.getAppointmentID() + " | Status: " + a.getStatus());
        }
        return sortedList;
    }


    public void addAppointment(Appointment a) {
        // Add new appointment to the queue
        appointmentQueue.add(a);
        // Save updated list
        appendToFile(a);
    }

    public void updateAppointments(List<Appointment> updatedList) {
        appointmentQueue.clear();
        appointmentQueue.addAll(updatedList);
        saveAllAppointments(updatedList);
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(","); // Assuming ',' is the delimiter

                if (parts.length >= 8) {
                    String appointmentId = parts[0];
                    String name = parts[1];
                    String gender = parts[2];
                    String phone = parts[3];
                    String doctorId = parts[4];
                    String specialization = parts[5];
                    String priority = parts[6];
                    String reason = parts[7];
                    String status = parts[8];

                    // Reconstruct Patient and Appointment
                    Patient patient = new Patient(name, gender, phone);
                    Doctor doctor = new Doctor(doctorId, specialization);
                    Appointment appointment = new Appointment(appointmentId, patient, doctor, priority, reason, status);

                    appointments.add(appointment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return appointments;
    }
    public String generateAppointmentId() {
        loadFromFile();
        return DSAUtils.generateAppointmentId(appointmentQueue);
    }

}

