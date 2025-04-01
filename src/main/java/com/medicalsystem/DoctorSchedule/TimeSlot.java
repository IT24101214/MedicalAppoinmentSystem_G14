package com.medicalsystem.DoctorSchedule;

public class TimeSlot implements Comparable<TimeSlot> {
    private String day;
    private String startTime;
    private String endTime;
    private boolean isAvailable;

    public TimeSlot(String day, String startTime, String endTime) {
        this.day = day;
        this.startTime = startTime;
        this.endTime = endTime;
        this.isAvailable = true;
    }

    public String getDay() { return day; }
    public String getStartTime() { return startTime; }
    public String getEndTime() { return endTime; }
    public boolean isAvailable() { return isAvailable; }

    public void setAvailable(boolean available) { isAvailable = available; }

    @Override
    public int compareTo(TimeSlot other) {
        int dayComparison = this.day.compareTo(other.day);
        if (dayComparison != 0) return dayComparison;
        return this.startTime.compareTo(other.startTime);
    }

    @Override
    public String toString() {
        return day + ": " + startTime + " - " + endTime +
                (isAvailable ? " (Available)" : " (Booked)");
    }
}