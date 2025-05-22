package com.medicalsystem.patient;

import com.medicalsystem.User.User;

public class Patient extends User {
    public Patient(String id, String name, String dob, String gender, String email, String phone) {
        super(id, name, dob, gender, email, phone);
    }

    @Override
    public void register() {
        System.out.println("Patient Registered: " + this.name);
    }

    @Override
    public void updateProfile() {
        System.out.println("Patient Profile Updated: " + this.name);
    }

    public void bookAppointment() {
        System.out.println("Booking appointment...");
    }

    public void viewAppointment() {
        System.out.println("Viewing appointment...");
    }

    public void cancelAppointment() {
        System.out.println("Cancelling appointment...");
    }
}
