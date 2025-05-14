package com.medicalsystem.DoctorSchedule;

public class DoctorSchedule implements Comparable<DoctorSchedule> {
    private String doctorId;
    private String date;      // Format: YYYY-MM-DD
    private String startTime; // Format: HH:mm
    private String endTime;
    private String status;    // Available / Booked

    public DoctorSchedule(String doctorId, String date, String startTime, String endTime, String status) {
        this.doctorId = doctorId;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    public String getDoctorId() { return doctorId; }
    public String getDate() { return date; }
    public String getStartTime() { return startTime; }
    public String getEndTime() { return endTime; }
    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }

    // Compare by date and time (earlier comes first)
    @Override
    public int compareTo(DoctorSchedule o) {
        int dateCmp = this.date.compareTo(o.date);
        return (dateCmp != 0) ? dateCmp : this.startTime.compareTo(o.startTime);
    }
}
