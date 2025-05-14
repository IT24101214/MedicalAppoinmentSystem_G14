package com.medicalsystem.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AdminManager {
    private static final String FILE_PATH = "E:/Project sem2/MedicalAppointmentSchedulingSystem1/data/admin.txt";

    public boolean validate(String username, String password) {
        for (Admin admin : loadAllAdmins()) {
            if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public void addUser(Admin newAdmin) {
        List<Admin> admins = loadAllAdmins();
        admins.add(newAdmin);
        saveAll(admins);
    }

    public void deleteUser(String usernameToDelete) {
        List<Admin> admins = loadAllAdmins();
        Iterator<Admin> iterator = admins.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getUsername().equals(usernameToDelete)) {
                iterator.remove();
                break;
            }
        }
        saveAll(admins);
    }

    public List<Admin> loadAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return admins;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 2) {
                    admins.add(new Admin(parts[0], parts[1]));
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading admins: " + e.getMessage());
        }
        return admins;
    }

    private void saveAll(List<Admin> admins) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Admin a : admins) {
                writer.write(a.getUsername() + "," + a.getPassword());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving admins: " + e.getMessage());
        }
    }
}
