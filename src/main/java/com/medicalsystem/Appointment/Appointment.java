package com.medicalsystem.Appointment;

import com.medicalsystem.Doctor.Doctor;
import com.medicalsystem.Patient.Patient;

public class Appointment implements Comparable<Appointment> {
    private String appointmentID;
    private Patient patient;       // association
    private Doctor doctor;         // single Doctor object
    private String priority;
    private String reason;
    private String status;

    public Appointment(String appointmentID, Patient patient, Doctor doctor,
                       String priority, String reason, String status) {
        this.appointmentID = appointmentID;
        this.patient = patient;
        this.doctor = doctor;
        this.priority = priority;
        this.reason = reason;
        this.status = status;
    }

    public String getAppointmentID() { return appointmentID; }
    public Patient getPatient() { return patient; }
    public Doctor getDoctor() { return doctor; }
    public String getPriority() { return priority; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }
    public void setPriority(String priority) { this.priority = priority; }
    public void setReason(String reason) { this.reason = reason; }


    @Override
    public int compareTo(Appointment o) {
        return getPriorityLevel(this.priority) - getPriorityLevel(o.priority);
    }

    private int getPriorityLevel(String p) {
        switch (p.toLowerCase()) {
            case "high": return 1;
            case "medium": return 2;
            case "low": return 3;
            default: return 4;
        }
    }

    private int getSpecializationLevel(String specialization) {
        switch (specialization.toLowerCase()) {
            case "cardiology": return 1;
            case "neurology": return 2;
            case "dermatology": return 3;
            case "pediatrics": return 4;
            default: return 5;
        }
    }

    public String toFileString() {
        return String.join(",",
                appointmentID,
                patient.getName(),
                patient.getGender(),
                patient.getPhone(),
                doctor.getId(),
                doctor.getSpecialization(),
                priority,
                reason,
                status
        );
    }
}
