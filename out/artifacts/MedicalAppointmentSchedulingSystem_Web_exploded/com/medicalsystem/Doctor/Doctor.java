package com.medicalsystem.Doctor;

import com.medicalsystem.User.User;

public class Doctor extends User {
    private String specialization;
    private String availability;

    public Doctor(String id, String name, String dob, String gender, String email, String phone,
                  String specialization, String availability) {
        super(id, name, dob, gender, email, phone);
        this.specialization = specialization;
        this.availability = availability;
    }

    @Override
    public void register() {
        System.out.println("Doctor Registered: " + this.name);
    }

    @Override
    public void updateProfile() {
        System.out.println("Doctor Profile Updated: " + this.name);
    }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public String getAvailability() { return availability; }
    public void setAvailability(String availability) { this.availability = availability; }

    public void viewAppointments() {
        System.out.println("Viewing doctor appointments...");
    }

    public void markAppointmentCompleted() {
        System.out.println("Marking appointment as completed...");
    }

    public void updateAvailability(String status) {
        this.availability = status;
    }
}
