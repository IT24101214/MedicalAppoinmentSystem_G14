package com.medicalsystem.utils;

import com.medicalsystem.model.Admin;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Utility class for file handling operations
 */
public class FileHandler {
    private static final Logger logger = Logger.getLogger(FileHandler.class.getName());
    
    // File paths
    private static final String DATA_DIRECTORY = System.getProperty("user.dir") + File.separator + "data";
    private static final String ADMIN_FILE = DATA_DIRECTORY + File.separator + "admin.txt";
    private static final String DOCTOR_FILE = DATA_DIRECTORY + File.separator + "doctors.txt";
    private static final String PATIENT_FILE = DATA_DIRECTORY + File.separator + "patients.txt";
    private static final String APPOINTMENT_FILE = DATA_DIRECTORY + File.separator + "appointments.txt";
    
    /**
     * Initialize data directory and files if they don't exist
     */
    public static void initializeFiles() {
        try {
            // Create data directory if it doesn't exist
            File dataDir = new File(DATA_DIRECTORY);
            if (!dataDir.exists()) {
                boolean created = dataDir.mkdirs(); // Use mkdirs instead of mkdir to create parent directories too
                if (!created) {
                    logger.log(Level.WARNING, "Failed to create directory: " + DATA_DIRECTORY);
                }
            }
            
            // Create admin file if it doesn't exist
            File adminFile = new File(ADMIN_FILE);
            if (!adminFile.exists()) {
                if (!adminFile.getParentFile().exists()) {
                    adminFile.getParentFile().mkdirs();
                }
                
                adminFile.createNewFile();
                // Add default super admin
                Admin defaultAdmin = new Admin("A001", "hiran pasindu", "hiranpasindu@gmail.com", "hiran123", "superadmin");
                List<Admin> admins = new ArrayList<>();
                admins.add(defaultAdmin);
                saveAdmins(admins);
            }
            
            // Create other necessary files
            createFileIfNotExists(DOCTOR_FILE);
            createFileIfNotExists(PATIENT_FILE);
            createFileIfNotExists(APPOINTMENT_FILE);
            
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error initializing files: " + e.getMessage(), e);
        }
    }
    
    /**
     * Creates a file if it doesn't exist
     */
    private static void createFileIfNotExists(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            // Ensure parent directory exists
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
        }
    }
    
    /**
     * Reads all admins from the admin file
     */
    public static List<Admin> readAdmins() {
        List<Admin> admins = new ArrayList<>();
        
        try {
            File file = new File(ADMIN_FILE);
            if (!file.exists()) {
                initializeFiles();
            }
            
            try (BufferedReader reader = new BufferedReader(new FileReader(ADMIN_FILE))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.trim().isEmpty()) continue; // Skip empty lines
                    
                    String[] parts = line.split("-");
                    if (parts.length >= 5) {
                        Admin admin = new Admin(
                                parts[0],         // adminID
                                parts[1],         // name
                                parts[2],         // email
                                parts[3],         // password
                                parts[4]          // role
                        );
                        admins.add(admin);
                    } else {
                        logger.log(Level.WARNING, "Invalid admin line format: " + line);
                    }
                }
            }
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error reading admins: " + e.getMessage(), e);
        }
        
        return admins;
    }


    /**
     * Saves the list of admins to the admin file
     */
    public static void saveAdmins(List<Admin> admins) {
        try {
            File file = new File(ADMIN_FILE);
            if (!file.exists()) {
                initializeFiles();
            }
            
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(ADMIN_FILE))) {
                for (Admin admin : admins) {
                    writer.write(admin.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error saving admins: " + e.getMessage(), e);
        }
    }
    
    /**
     * Gets count of doctors from doctors.txt
     */
    public static int getDoctorCount() {
        try {
            File file = new File(DOCTOR_FILE);
            if (!file.exists()) {
                return 0;
            }
            return (int) Files.lines(Paths.get(DOCTOR_FILE)).count();
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error counting doctors: " + e.getMessage(), e);
            return 0;
        }
    }
    
    /**
     * Gets count of patients from patients.txt
     */
    public static int getPatientCount() {
        try {
            File file = new File(PATIENT_FILE);
            if (!file.exists()) {
                return 0;
            }
            return (int) Files.lines(Paths.get(PATIENT_FILE)).count();
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error counting patients: " + e.getMessage(), e);
            return 0;
        }
    }
    
    /**
     * Gets count of today's appointments from appointments.txt
     * For simplicity, just counting all appointments
     */
    public static int getTodayAppointmentCount() {
        try {
            File file = new File(APPOINTMENT_FILE);
            if (!file.exists()) {
                return 0;
            }
            return (int) Files.lines(Paths.get(APPOINTMENT_FILE)).count();
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error counting appointments: " + e.getMessage(), e);
            return 0;
        }
    }
    
    /**
     * Gets monthly revenue (simplified for demo)
     */
    public static double getMonthlyRevenue() {
        // For demo purposes, each appointment costs $50
        return getTodayAppointmentCount() * 50.0;
    }
    
    /**
     * Get recent appointments (limited to 5)
     */
    public static List<String[]> getRecentAppointments() {
        List<String[]> appointments = new ArrayList<>();
        
        try {
            File file = new File(APPOINTMENT_FILE);
            if (!file.exists()) {
                createFileIfNotExists(APPOINTMENT_FILE);
                // Add some example appointments for demo
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(APPOINTMENT_FILE))) {
                    writer.write("AP001-John Doe-Dr. Smith-2023-06-15-10:00-Checkup");
                    writer.newLine();
                    writer.write("AP002-Jane Smith-Dr. Johnson-2023-06-16-14:30-Follow-up");
                    writer.newLine();
                    writer.write("AP003-Michael Brown-Dr. Williams-2023-06-17-09:15-Consultation");
                    writer.newLine();
                }
            }
            
            try (BufferedReader reader = new BufferedReader(new FileReader(APPOINTMENT_FILE))) {
                String line;
                int count = 0;
                while ((line = reader.readLine()) != null && count < 5) {
                    if (line.trim().isEmpty()) continue; // Skip empty lines
                    
                    String[] parts = line.split("-");
                    if (parts.length >= 7) {
                        appointments.add(new String[]{
                                parts[0], // appointment ID
                                parts[1], // patient name
                                parts[2], // doctor name
                                parts[3] + "-" + parts[4], // date and time
                                parts[6]  // purpose
                        });
                        count++;
                    } else {
                        logger.log(Level.WARNING, "Invalid appointment line format: " + line);
                    }
                }
            }
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error reading appointments: " + e.getMessage(), e);
        }
        
        return appointments;
    }
}
