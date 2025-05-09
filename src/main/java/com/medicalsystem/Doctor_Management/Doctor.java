package com.medicalsystem.Doctor_Management;

public class Doctor {
    private String id;
    private String name;
    private String specialization;
    private String email;
    private String phone;
    private String qualification;
    private int experience;
    private String timeSlot;
    private String languages;

    public Doctor(String id, String name, String specialization, String email, String phone,
                  String qualification, int experience, String timeSlot, String languages) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.email = email;
        this.phone = phone;
        this.qualification = qualification;
        this.experience = experience;
        this.timeSlot = timeSlot;
        this.languages = languages;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getSpecialization() { return specialization; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getQualification() { return qualification; }
    public int getExperience() { return experience; }
    public String getTimeSlot() { return timeSlot; }
    public String getLanguages() { return languages; }
}
