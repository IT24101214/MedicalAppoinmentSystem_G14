package com.medicalsystem.Doctor;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorManager {
    private final String filePath;

    public DoctorManager(ServletContext context) {
        File deployRoot = new File(context.getRealPath("/"));
        File projectRoot = deployRoot.getParentFile().getParentFile();
        File dataDir = new File(projectRoot, "data");
        if (!dataDir.exists()) {
            dataDir.mkdirs();
        }

        File file = new File(dataDir, "doctor.txt");
        this.filePath = file.getAbsolutePath();

        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            throw new RuntimeException("Could not create doctor.txt file", e);
        }
    }

    public void addDoctor(Doctor doctor) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(toCSV(doctor));
            writer.newLine();
        }
    }

    public List<Doctor> getAllDoctors() throws IOException {
        List<Doctor> doctors = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Doctor doctor = fromCSV(line);
                if (doctor != null) {
                    doctors.add(doctor);
                }
            }
        }
        return doctors;
    }

    public Doctor getDoctorById(String doctorID) throws IOException {
        for (Doctor doctor : getAllDoctors()) {
            if (doctor.getDoctorID().equals(doctorID)) {
                return doctor;
            }
        }
        return null;
    }

    public boolean validateDoctor(String doctorID, String password) throws IOException {
        for (Doctor doc : getAllDoctors()) {
            if (doc.getDoctorID().equals(doctorID) && doc.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public void updateDoctor(Doctor updatedDoctor) throws IOException {
        List<Doctor> doctors = getAllDoctors();
        for (int i = 0; i < doctors.size(); i++) {
            if (doctors.get(i).getDoctorID().equals(updatedDoctor.getDoctorID())) {
                doctors.set(i, updatedDoctor);
                saveAllDoctors(doctors);
                break;
            }
        }
    }


    private void saveAllDoctors(List<Doctor> doctors) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Doctor doctor : doctors) {
                writer.write(toCSV(doctor));
                writer.newLine();
            }
        }
    }

    private String toCSV(Doctor doctor) {
        return String.join(",",
                doctor.getDoctorID(),
                doctor.getName(),
                doctor.getDob(),
                doctor.getGender(),
                doctor.getEmail(),
                doctor.getPhone(),
                doctor.getSpecialization(),
                doctor.getPassword()
        );
    }

    private Doctor fromCSV(String line) {
        String[] data = line.split(",", -1);
        if (data.length == 8) {
            return new Doctor(data[0], data[1], data[2], data[3],
                    data[4], data[5], data[6], data[7]);
        }
        return null;
    }
}
