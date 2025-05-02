package com.medicalsystem.appointment;

public class Appointment {
    private int appointmentID;
    private String patientName;
    private String doctorName;
    private String date;
    private String time;
    private int urgency; // e.g., 1 = High, 2 = Medium, 3 = Low

    public Appointment(int appointmentID, String patientName, String doctorName, String date, String time, int urgency) {
        this.appointmentID = appointmentID;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.date = date;
        this.time = time;
        this.urgency = urgency;
    }

    // Getters and Setters
    public int getAppointmentID() {
        return appointmentID;
    }

    public String getPatientName() {
        return patientName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTime() {
        return time;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public int getUrgency() {
        return urgency;
    }

    public void setUrgency(int urgency) {
        this.urgency = urgency;
    }

    @Override
    public String toString() {
        return "Appointment ID: " + appointmentID +
                ", Patient Name: " + patientName +
                ", Doctor Name: " + doctorName +
                ", Date: " + date +
                ", Time: " + time +
                ", Urgency: " + urgency;
    }

    // For file-based storage (CSV-style line)
    public static Appointment fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length != 6) {
            throw new IllegalArgumentException("Invalid appointment format: " + line);
        }
        return new Appointment(
                Integer.parseInt(parts[0]),
                parts[1],
                parts[2],
                parts[3],
                parts[4],
                Integer.parseInt(parts[5])
        );
    }

    public String toFileString() {
        return appointmentID + "," + patientName + "," + doctorName + "," + date + "," + time + "," + urgency;
    }
}
