package com.medicalsystem.appointment;

import com.medicalsystem.Doctor.*;
import com.medicalsystem.patient.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.medicalsystem.appointment.dsa.PriorityQueue;
import com.medicalsystem.appointment.dsa.DSAUtils;
import com.medicalsystem.appointment.utils.ProjectSetup;

public class AppointmentManager {
    private final String filePath;
    private final PriorityQueue appointmentQueue = new PriorityQueue();

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
        appointmentQueue.offer(a);  ///we use offer instead of add operator
        appendToFile(a);
    }

    private List<Appointment> readAppointmentsFromFile() {
        List<Appointment> appointments = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return appointments;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
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
        List<Appointment> appointments = readAppointmentsFromFile();
        appointmentQueue.addAll(appointments);
    }


    // Get sorted appointments
    public List<Appointment> getSortedAppointments() {
        loadFromFile();
        List<Appointment> sortedList = new ArrayList<>((Collection) appointmentQueue);
        DSAUtils.bubbleSort(sortedList);  //bubbleSort usage
        return sortedList;
    }

    public List<Appointment> getAllAppointments() {
        return readAppointmentsFromFile();
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
        return DSAUtils.generateAppointmentId((List<Appointment>) appointmentQueue);
    }
}
