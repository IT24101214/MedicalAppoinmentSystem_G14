package com.medicalsystem.Doctor;

import com.medicalsystem.User.User;

public class Doctor extends User {
    private String doctorID;
    private String specialization;
    private String password;

    public Doctor(String doctorID, String name, String dob, String gender, String email, String phone,
                  String specialization, String password) {
        super(name, dob, gender, email, phone);
        this.doctorID = doctorID;
        this.specialization = specialization;
        this.password = password;
    }

    @Override
    public void register() {
        System.out.println("Doctor Registered: " + this.name);
    }

    @Override
    public void updateProfile() {
        System.out.println("Doctor Profile Updated: " + this.name);
    }

    public String getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(String doctorID) {
        this.doctorID = doctorID;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void viewAppointments() {
        System.out.println("Viewing doctor appointments...");
    }

    public void markAppointmentCompleted() {
        System.out.println("Marking appointment as completed...");
    }
}
