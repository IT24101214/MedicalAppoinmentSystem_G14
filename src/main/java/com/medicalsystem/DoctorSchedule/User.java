package com.medicalsystem.DoctorSchedule;

import java.io.Serializable;

public class User implements Serializable {
    protected String userId;
    protected String username;
    protected String email;
    protected String password;
    protected String role;

    public User(String userId, String username, String email, String password, String role) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // Getters and setters
    public String getUserId() { return userId; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getRole() { return role; }

    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
}

