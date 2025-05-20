package com.medicalsystem.Admin.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;
import java.util.regex.Pattern;

public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
    
    private String id;
    private String username;
    private String password;
    private String role; // "admin" or "superadmin"
    private String fullName;
    private String email;
    private String lastLogin;
    private String createdAt;

    // Default constructor
    public Admin() {
        this.id = generateId();
        this.createdAt = LocalDateTime.now().toString();
    }

    // Parameterized constructor
    public Admin(String username, String password, String role, String fullName, String email) {
        this();
        setUsername(username);
        setPassword(password);
        setRole(role);
        setFullName(fullName);
        setEmail(email);
    }

    private String generateId() {
        return "A" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }

    // Getters and Setters with validation
    public String getId() {
        return id;
    }

    public void setId(String id) {
        if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("ID cannot be null or empty");
        }
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be null or empty");
        }
        if (username.length() < 3 || username.length() > 50) {
            throw new IllegalArgumentException("Username must be between 3 and 50 characters");
        }
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        if (password.length() < 6) {
            throw new IllegalArgumentException("Password must be at least 6 characters long");
        }
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        if (role == null || role.trim().isEmpty()) {
            throw new IllegalArgumentException("Role cannot be null or empty");
        }
        if (!role.equals("admin") && !role.equals("superadmin")) {
            throw new IllegalArgumentException("Role must be either 'admin' or 'superadmin'");
        }
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        if (fullName == null || fullName.trim().isEmpty()) {
            throw new IllegalArgumentException("Full name cannot be null or empty");
        }
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            throw new IllegalArgumentException("Invalid email format");
        }
        this.email = email;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        if (createdAt == null || createdAt.trim().isEmpty()) {
            throw new IllegalArgumentException("Created at timestamp cannot be null or empty");
        }
        this.createdAt = createdAt;
    }

    public boolean isSuperAdmin() {
        return "superadmin".equals(this.role);
    }

    @Override
    public String toString() {
        return String.join("|",
            id,
            username,
            password,
            role,
            fullName,
            email,
            createdAt != null ? createdAt : "",
            lastLogin != null ? lastLogin : ""
        );
    }

    // Parse a string from file to Admin object
    public static Admin fromString(String line) {
        if (line == null || line.trim().isEmpty()) {
            throw new IllegalArgumentException("Input line cannot be null or empty");
        }

        String[] parts = line.split("\\|");
        if (parts.length < 6) {
            throw new IllegalArgumentException("Invalid admin data format");
        }

        Admin admin = new Admin();
        try {
            admin.setId(parts[0]);
            admin.setUsername(parts[1]);
            admin.setPassword(parts[2]);
            admin.setRole(parts[3]);
            admin.setFullName(parts[4]);
            admin.setEmail(parts[5]);
            
            if (parts.length >= 7 && !parts[6].isEmpty()) {
                admin.setCreatedAt(parts[6]);
            }
            if (parts.length >= 8 && !parts[7].isEmpty()) {
                admin.setLastLogin(parts[7]);
            }
        } catch (Exception e) {
            throw new IllegalArgumentException("Error parsing admin data: " + e.getMessage());
        }
        
        return admin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Admin admin = (Admin) o;
        return id.equals(admin.id);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }
}