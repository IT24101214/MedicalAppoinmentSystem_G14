package com.medicalsystem.model;

/**
 * Admin class represents an administrator in the system
 * Encapsulates admin data and provides access methods
 */
public class Admin {
    private String adminID;
    private String name;
    private String email;
    private String password;
    private String role; // "admin" or "superadmin"
    
    // Default constructor
    public Admin() {
    }
    
    // Parameterized constructor
    public Admin(String adminID, String name, String email, String password, String role) {
        this.adminID = adminID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    
    // Getters and Setters
    public String getAdminID() {
        return adminID;
    }
    
    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    
    @Override
    public String toString() {
        return adminID + "-" + name + "-" + email + "-" + role;
    }
    
    // Format for storing in text file
    public String toFileString() {
        return adminID + "-" + name + "-" + email + "-" + password + "-" + role;
    }
}
