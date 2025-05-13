package com.medicalsystem.appointment;

public class Appointment implements Comparable<Appointment> {
    private String appointmentId;
    private String patientId;
    private String doctorId;
    private String priority; // High, Medium, Low
    private String reason;
    private String status; // Pending, Completed, Cancelled

    public Appointment(String appointmentId, String patientId, String doctorId,
                       String priority, String reason, String status) {
        this.appointmentId = appointmentId;
        this.patientId = patientId;
        this.doctorId = doctorId;
        this.priority = priority;
        this.reason = reason;
        this.status = status;
    }

    public String getAppointmentId() { return appointmentId; }
    public String getPatientId() { return patientId; }
    public String getDoctorId() { return doctorId; }
    public String getPriority() { return priority; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }

    /// Priority-Queue based on urgency of patient
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
}
