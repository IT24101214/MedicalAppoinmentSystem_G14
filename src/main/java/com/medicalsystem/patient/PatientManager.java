package com.medicalsystem.patient;


import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PatientManager {
    private static final String FILE_PATH = "data/patient.txt";
    private List<Patient> patients = new ArrayList<>();

    public void addPatient(Patient patient) {
        patients.add(patient);
        saveToFile();
    }

    public List<Patient> getAllPatients() {
        loadFromFile(); // ensure up-to-date
        return patients;
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Patient p : patients) {
                writer.write(String.join(",",
                        p.getId(), p.getName(), p.getDob(), p.getGender(),
                        p.getEmail(), p.getPhone()));
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving patient data: " + e.getMessage());
        }
    }

    private void loadFromFile() {
        patients.clear();
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 6) {
                    Patient p = new Patient(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
                    patients.add(p);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading patient data: " + e.getMessage());
        }
    }
}
