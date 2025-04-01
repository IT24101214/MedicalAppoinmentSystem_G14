package com.medicalsystem.DoctorSchedule;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DoctorSchedule {
    private  final String doctorId;
    private List<TimeSlot> weeklySchedule;
    private List<TimeSlot> exceptions;

    public DoctorSchedule(String doctorId) {
        this.doctorId = doctorId;
        this.weeklySchedule = new ArrayList<>();
        this.exceptions = new ArrayList<>();
    }

    public void addWeeklySlot(TimeSlot slot) {
        weeklySchedule.add(slot);
        sortTimeSlots(weeklySchedule);
    }

    public void removeWeeklySlot(TimeSlot slot) {
        weeklySchedule.remove(slot);
    }

    public List<TimeSlot> getWeeklySchedule() {
        return Collections.unmodifiableList(weeklySchedule);
    }

    public void addException(TimeSlot exception) {
        exceptions.add(exception);
        sortTimeSlots(exceptions);
    }

    public void removeException(TimeSlot exception) {
        exceptions.remove(exception);
    }

    public List<TimeSlot> getExceptions() {
        return Collections.unmodifiableList(exceptions);
    }

    public List<TimeSlot> getAvailableSlots() {
        List<TimeSlot> available = new ArrayList<>(weeklySchedule);
        available.removeAll(exceptions);
        return available;
    }

    private void sortTimeSlots(List<TimeSlot> slots) {
        int n = slots.size();
        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {
                if (slots.get(j).compareTo(slots.get(j+1)) > 0) {
                    TimeSlot temp = slots.get(j);
                    slots.set(j, slots.get(j+1));
                    slots.set(j+1, temp);
                }
            }
        }
    }

    public void saveToFile(String filename) throws IOException {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filename))) {
            writer.println("DoctorID: " + doctorId);
            writer.println("Weekly Schedule:");
            for (TimeSlot slot : weeklySchedule) {
                writer.println(slot.getDay() + "," + slot.getStartTime() + "," + slot.getEndTime());
            }
            writer.println("Exceptions:");
            for (TimeSlot exception : exceptions) {
                writer.println(exception.getDay() + "," + exception.getStartTime() + "," + exception.getEndTime());
            }
        }
    }

    public static DoctorSchedule loadFromFile(String filename) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line = reader.readLine();
            String doctorId = line.split(": ")[1];

            DoctorSchedule schedule = new DoctorSchedule(doctorId);

            reader.readLine(); // Skip "Weekly Schedule:" line
            while (!(line = reader.readLine()).equals("Exceptions:")) {
                String[] parts = line.split(",");
                schedule.addWeeklySlot(new TimeSlot(parts[0], parts[1], parts[2]));
            }

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                schedule.addException(new TimeSlot(parts[0], parts[1], parts[2]));
            }

            return schedule;
        }
    }
}