package com.medicalsystem.DoctorSchedule_Management;

public class DoctorSchedule {
    private String scheduleId;
    private String doctorId;
    private String date;        // YYYY-MM-DD
    private String startTime;   // HH:mm
    private String endTime;     // HH:mm
    private String status;

    public DoctorSchedule(String scheduleId, String doctorId, String date, String startTime, String endTime, String status) {
        this.scheduleId = scheduleId;
        this.doctorId = doctorId;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    // Getters
    public String getScheduleId() { return scheduleId; }
    public String getDoctorId() { return doctorId; }
    public String getDate() { return date; }
    public String getStartTime() { return startTime; }
    public String getEndTime() { return endTime; }
    public String getStatus() { return status; }

    // Setters
    public void setScheduleId(String scheduleId) { this.scheduleId = scheduleId; }
    public void setDoctorId(String doctorId) { this.doctorId = doctorId; }
    public void setDate(String date) { this.date = date; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return scheduleId + ";" + doctorId + ";" + date + ";" + startTime + ";" + endTime + ";" + status;
    }
}
