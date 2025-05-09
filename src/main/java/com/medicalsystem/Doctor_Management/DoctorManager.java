package com.medicalsystem.Doctor_Management;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorManager {
    private final String filePath;

    public DoctorManager(String filePath) {
        this.filePath = filePath;
    }

    public void saveDoctor(Doctor doctor) {
        try {
            File file = new File(filePath);
            file.getParentFile().mkdirs();

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(doctor.getId() + ";" + doctor.getName() + ";" + doctor.getSpecialization() + ";" +
                        doctor.getEmail() + ";" + doctor.getPhone() + ";" + doctor.getQualification() + ";" +
                        doctor.getExperience() + ";" + doctor.getTimeSlot() + ";" + doctor.getLanguages());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(";");
                if (parts.length == 9) {
                    Doctor doctor = new Doctor(
                            parts[0], parts[1], parts[2], parts[3], parts[4],
                            parts[5], Integer.parseInt(parts[6]), parts[7], parts[8]);
                    doctors.add(doctor);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return doctors;
    }
}