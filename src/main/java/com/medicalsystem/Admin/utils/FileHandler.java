package com.medicalsystem.Admin.utils;

import com.medicalsystem.Admin.model.Admin;

import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FileHandler {
    private static final String ADMIN_FILE_PATH = "src/main/Data/admin.txt";
    private static final String LOG_FILE_PATH = "src/main/Data/admin_activity.log";

    // Read all admins from file
    public static List<Admin> readAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(ADMIN_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Admin admin = Admin.fromString(line);
                    admins.add(admin);
                }
            }
        } catch (IOException e) {
            logActivity("ERROR", "Failed to read admin file: " + e.getMessage());
        }
        return admins;
    }

    // Write all admins to file
    public static void writeAllAdmins(List<Admin> admins) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(ADMIN_FILE_PATH))) {
            for (Admin admin : admins) {
                writer.write(admin.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            logActivity("ERROR", "Failed to write to admin file: " + e.getMessage());
        }
    }

    // Find an admin by username
    public static Admin findAdminByUsername(String username) {
        List<Admin> admins = readAllAdmins();
        for (Admin admin : admins) {
            if (admin.getUsername().equals(username)) {
                return admin;
            }
        }
        return null;
    }

    // Find an admin by ID
    public static Admin findAdminById(String id) {
        List<Admin> admins = readAllAdmins();
        for (Admin admin : admins) {
            if (admin.getId().equals(id)) {
                return admin;
            }
        }
        return null;
    }

    // Add a new admin
    public static boolean addAdmin(Admin admin) {
        // Check if admin with same username already exists
        Admin existingAdmin = findAdminByUsername(admin.getUsername());
        if (existingAdmin != null) {
            return false;
        }

        // Add the admin to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(ADMIN_FILE_PATH, true))) {
            writer.write(admin.toString());
            writer.newLine();
            logActivity("CREATE", "Admin created: " + admin.getUsername());
            return true;
        } catch (IOException e) {
            logActivity("ERROR", "Failed to add admin: " + e.getMessage());
            return false;
        }
    }

    // Update an existing admin
    public static boolean updateAdmin(Admin admin) {
        List<Admin> admins = readAllAdmins();
        boolean updated = false;

        for (int i = 0; i < admins.size(); i++) {
            if (admins.get(i).getId().equals(admin.getId())) {
                admins.set(i, admin);
                updated = true;
                break;
            }
        }

        if (updated) {
            writeAllAdmins(admins);
            logActivity("UPDATE", "Admin updated: " + admin.getUsername());
        }
        return updated;
    }

    // Delete an admin by ID
    public static boolean deleteAdmin(String id) {
        List<Admin> admins = readAllAdmins();
        String username = "";
        boolean deleted = false;

        for (int i = 0; i < admins.size(); i++) {
            if (admins.get(i).getId().equals(id)) {
                username = admins.get(i).getUsername();
                admins.remove(i);
                deleted = true;
                break;
            }
        }

        if (deleted) {
            writeAllAdmins(admins);
            logActivity("DELETE", "Admin deleted: " + username);
        }
        return deleted;
    }

    // Update admin role
    public static boolean updateAdminRole(String id, String role) {
        List<Admin> admins = readAllAdmins();
        boolean updated = false;

        for (Admin admin : admins) {
            if (admin.getId().equals(id)) {
                admin.setRole(role);
                updated = true;
                break;
            }
        }

        if (updated) {
            writeAllAdmins(admins);
            logActivity("PERMISSION", "Admin role updated to " + role + " for ID: " + id);
        }
        return updated;
    }

    // Validate admin credentials
    public static Admin validateAdmin(String username, String password) {
        List<Admin> admins = readAllAdmins();
        for (Admin admin : admins) {
            if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
                return admin;
            }
        }
        return null;
    }

    // Log admin activity
    public static void logActivity(String action, String description) {
        try {
            // Create directory if it doesn't exist
            File logDir = new File("src/main/Data");
            if (!logDir.exists()) {
                logDir.mkdirs();
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String timestamp = dateFormat.format(new Date());

            Files.write(
                    Paths.get(LOG_FILE_PATH),
                    (timestamp + " | " + action + " | " + description + System.lineSeparator()).getBytes(),
                    StandardOpenOption.CREATE, StandardOpenOption.APPEND
            );
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Read admin activity logs
    public static List<String> readActivityLogs() {
        List<String> logs = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(LOG_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                logs.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return logs;
    }

    // Initialize the admin file with a default super admin if it doesn't exist
    public static void initializeAdminFile() {
        File adminFile = new File(ADMIN_FILE_PATH);
        if (!adminFile.exists() || adminFile.length() == 0) {
            try {
                // Create parent directories if they don't exist
                File parentDir = adminFile.getParentFile();
                if (!parentDir.exists()) {
                    parentDir.mkdirs();
                }

                // Create the file
                adminFile.createNewFile();

                // Add default super admin
                Admin superAdmin = new Admin(
                        "admin",
                        "admin123",
                        "superadmin",
                        "System Administrator",
                        "admin@medicalsystem.com"
                );
                addAdmin(superAdmin);

                logActivity("SYSTEM", "Admin file initialized with default super admin");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}