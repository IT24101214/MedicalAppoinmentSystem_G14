package com.medicalsystem.User;

import java.io.Serializable;

public abstract class User implements Serializable {
    protected String id;
    protected String name;
    protected String dob;
    protected String gender;
    protected String email;
    protected String phone;

    public User(String id, String name, String dob, String gender, String email, String phone) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    // Abstract Methods
    public abstract void register();
    public abstract void updateProfile();
}
