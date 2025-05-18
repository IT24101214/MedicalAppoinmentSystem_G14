package com.medicalsystem.Appointment;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Patient.Patient;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;
import com.medicalsystem.dsa.DSAUtils;
import com.medicalsystem.utils.ProjectSetup;

public class AppointmentManager {
    private final String filePath;
    private final PriorityQueue<Appointment> appointmentQueue = new PriorityQueue<>();

    /// Purpose: Change file path from hardcoded to dynamically using (project_data/)
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
        appointmentQueue.add(a);
        appendToFile(a);
    }

    // Append one appointment to file
    private void appendToFile(Appointment appointment) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            Patient p = appointment.getPatient();
            Doctor d = appointment.getDoctor();
            writer.write(String.join(",", appointment.getAppointmentID(), p.getName(), p.getGender(), p.getPhone(),
                    d.getId(), d.getSpecialization(), appointment.getPriority(), appointment.getReason(), appointment.getStatus()));
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error appending appointment: " + e.getMessage());
        }
    }

    // Load file into queue
    private void loadFromFile() {
        appointmentQueue.clear();
        File file = new File(filePath);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length >= 9) {
                    Patient p = new Patient(parts[1], parts[2], parts[3]);
                    Doctor d = new Doctor(parts[4], parts[5]);
                    Appointment a = new Appointment(parts[0], p, d, parts[6], parts[7], parts[8]);
                    appointmentQueue.add(a);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading appointments: " + e.getMessage());
        }
    }

    // Get sorted appointments
    public List<Appointment> getSortedAppointments() {
        loadFromFile();
        List<Appointment> sortedList = new ArrayList<>(appointmentQueue);
        DSAUtils.bubbleSort(sortedList);
        return sortedList;
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return appointments;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length >= 9) {
                    Patient patient = new Patient(parts[1], parts[2], parts[3]);
                    Doctor doctor = new Doctor(parts[4], parts[5]);
                    Appointment appointment = new Appointment(parts[0], patient, doctor, parts[6], parts[7], parts[8]);
                    appointments.add(appointment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    public void saveAllAppointments(List<Appointment> appointments) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, false))) {
            for (Appointment app : appointments) {
                writer.println(app.toFileString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteAppointment(String appointmentId) {
        List<Appointment> appointments = getAllAppointments();
        boolean removed = appointments.removeIf(app -> app.getAppointmentID().equals(appointmentId));
        if (removed) {
            saveAllAppointments(appointments);
        }
        return removed;
    }

    public Appointment findAppointmentById(String appointmentId) {
        List<Appointment> appointments = getAllAppointments();
        for (Appointment a : appointments) {
            if (a.getAppointmentID().equals(appointmentId)) {
                return a;
            }
        }
        return null;
    }

    public boolean updateAppointment(Appointment updated) {
        List<Appointment> appointments = getAllAppointments();
        for (int i = 0; i < appointments.size(); i++) {
            if (appointments.get(i).getAppointmentID().equals(updated.getAppointmentID())) {
                appointments.set(i, updated);
                saveAllAppointments(appointments);
                return true;
            }
        }
        return  false;
    }

    public String generateAppointmentId() {
        loadFromFile();
        return DSAUtils.generateAppointmentId(appointmentQueue);
    }
}
