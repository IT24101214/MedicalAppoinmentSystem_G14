package com.medicalsystem.Admin.model;

import java.io.Serializable;
import java.util.UUID;

public class Admin implements Serializable {
    private String id;
    private String username;
    private String password;
    private String role; // "admin" or "superadmin"
    private String fullName;
    private String email;
    private String lastLogin;

    // Default constructor
    public Admin() {
        this.id = UUID.randomUUID().toString();
    }

    // Parameterized constructor
    public Admin(String username, String password, String role, String fullName, String email) {
        this.id = UUID.randomUUID().toString();
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullName = fullName;
        this.email = email;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isSuperAdmin() {
        return "superadmin".equals(this.role);
    }

    @Override
    public String toString() {
        return id + "," + username + "," + password + "," + role + "," + fullName + "," + email + "," + (lastLogin != null ? lastLogin : "");
    }

    // Parse a string from file to Admin object
    public static Admin fromString(String line) {
        String[] parts = line.split(",");
        Admin admin = new Admin();
        if (parts.length >= 6) {
            admin.setId(parts[0]);
            admin.setUsername(parts[1]);
            admin.setPassword(parts[2]);
            admin.setRole(parts[3]);
            admin.setFullName(parts[4]);
            admin.setEmail(parts[5]);
            if (parts.length >= 7) {
                admin.setLastLogin(parts[6]);
            }
        }
        return admin;
    }
}