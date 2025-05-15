package com.medicalsystem.appointment;

import com.medicalsystem.patient.Patient;

public class Appointment implements Comparable<Appointment> {
    private String appointmentId;
    private Patient patient;  ///association relationship
    private String doctorId;
    private String priority;
    private String reason;
    private String status;

    public Appointment(String appointmentId, Patient patient, String doctorId,
                       String priority, String reason, String status) {
        this.appointmentId = appointmentId;
        this.patient = patient;
        this.doctorId = doctorId;
        this.priority = priority;
        this.reason = reason;
        this.status = status;
    }

    public String getAppointmentId() { return appointmentId; }
    public Patient getPatient() { return patient; }
    public String getDoctorId() { return doctorId; }
    public String getPriority() { return priority; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

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

    public String toFileString() {
        return String.join(",",
                appointmentId,
                patient.getName(),
                patient.getGender(),
                patient.getPhone(),
                doctorId,
                priority,
                reason,
                status
        );
    }
}
