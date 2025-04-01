package com.medicalsystem.DoctorSchedule;

import java.util.ArrayList;
import java.util.List;

public class Doctor extends User {
    private String specialization;
    private List<TimeSlot> availability;

    public Doctor(String userId, String username, String email, String password,
                  String specialization) {
        super(userId, username, email, password, "doctor");
        this.specialization = specialization;
        this.availability = new ArrayList<>();
    }

    public String getSpecialization() { return specialization; }
    public List<TimeSlot> getAvailability() { return availability; }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public void addTimeSlot(TimeSlot slot) {
        availability.add(slot);
        sortTimeSlots();
    }

    public void removeTimeSlot(TimeSlot slot) {
        availability.remove(slot);
    }

    private void sortTimeSlots() {
        int n = availability.size();
        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {
                if (availability.get(j).compareTo(availability.get(j+1)) > 0) {
                    TimeSlot temp = availability.get(j);
                    availability.set(j, availability.get(j+1));
                    availability.set(j+1, temp);
                }
            }
        }
    }
}