package com.medicalsystem.DoctorSchedule;

public class DoctorSchedule {
    private String doctorId;
    private String startTime;
    private String endTime;
    private String status;
    private String[] availableDays;

    public DoctorSchedule(String doctorId, String startTime, String endTime, String status, String[] availableDays) {
        this.doctorId = doctorId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.availableDays = availableDays;
    }

    public DoctorSchedule(String doctorId, String startTime, String endTime, String status, String availableDay) {
        this(doctorId, startTime, endTime, status, new String[]{availableDay});
    }

    @Override
    public String toString() {
        // Join availableDays with comma for storage
        return doctorId + "|" + startTime + "|" + endTime + "|" + status + "|" + String.join(",", availableDays);
    }

    public static DoctorSchedule fromString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length != 5) return null;

        String[] days = parts[4].split(",");
        return new DoctorSchedule(parts[0], parts[1], parts[2], parts[3], days);
    }

    // Getters
    public String getDoctorId() {
        return doctorId;
    }
    public String getStartTime() {
        return startTime;
    }
    public String getEndTime() {
        return endTime;
    }
    public String getStatus() {
        return status;
    }
    public String[] getAvailableDays() {
        return availableDays;
    }

    public String getAvailableDaysAsString() {
        return String.join(", ", availableDays);
    }

    // Setters
    public void setAvailableDays(String[] availableDays) {
        this.availableDays = availableDays;
    }
}