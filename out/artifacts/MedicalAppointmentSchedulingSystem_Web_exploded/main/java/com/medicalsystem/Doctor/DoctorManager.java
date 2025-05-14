package com.medicalsystem.Doctor;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorManager {
    private static final String FILE_PATH = "E:/Project sem2/MedicalAppointmentSchedulingSystem1/data/doctor.txt";

    // Existing method to get all doctors
    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 8) {
                    Doctor doctor = new Doctor(
                            parts[0], // id
                            parts[1], // name
                            parts[2], // dob
                            parts[3], // gender
                            parts[4], // email
                            parts[5], // phone
                            parts[6], // specialization
                            parts[7]  // availability
                    );
                    doctors.add(doctor);
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // In production, consider proper logging
        }
        return doctors;
    }

    // Method to get a doctor by ID
    public Doctor getDoctorById(String id) {
        for (Doctor doc : getAllDoctors()) {
            if (doc.getId().equalsIgnoreCase(id)) {
                return doc;
            }
        }
        return null;
    }

    // New method to add a doctor to the file
    public void addDoctor(Doctor doctor) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String doctorData = doctor.getId() + "," +
                    doctor.getName() + "," +
                    doctor.getDob() + "," +
                    doctor.getGender() + "," +
                    doctor.getEmail() + "," +
                    doctor.getPhone() + "," +
                    doctor.getSpecialization() + "," +
                    doctor.getAvailability();

            writer.write(doctorData);
            writer.newLine(); // Add a new line after each doctor
        } catch (IOException e) {
            e.printStackTrace(); // In production, consider proper logging
        }
    }
}
