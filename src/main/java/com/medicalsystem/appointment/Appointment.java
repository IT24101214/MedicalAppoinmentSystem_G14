package com.medicalsystem.appointment;

public class Appointment {
    private int appointmentID;
    private String patientName;
    private String doctorName;
    private String date;
    private String time;

    public Appointment(int appointmentID, String patientName, String doctorName, String date, String time) {
        this.appointmentID = appointmentID;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.date = date;
        this.time = time;
    }

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

    @Override
    public String toString() {
        return "Appointment ID: " + appointmentID + ", Patient Name: " + patientName + ", Doctor Name: " + doctorName + ", Date: " + date + ", Time: " + time;
    }
}
