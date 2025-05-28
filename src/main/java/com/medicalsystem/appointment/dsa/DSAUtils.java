package com.medicalsystem.appointment.dsa;

import com.medicalsystem.appointment.Appointment;

import java.util.List;

public class DSAUtils {

    public static void bubbleSort(List<Appointment> list) {
        int n = list.size();
        boolean swapped;

        do {
            swapped = false;
            for (int i = 1; i < n; i++) {
                Appointment a1 = list.get(i - 1);
                Appointment a2 = list.get(i);

                int p1 = getPriorityValue(a1.getPriority());
                int p2 = getPriorityValue(a2.getPriority());

                // Compare by priority first
                boolean shouldSwap = false;
                if (p1 > p2) {
                    shouldSwap = true;
                } else if (p1 == p2) {
                    // Same priority, compare by time if available
                    if (a1.getAppointmentTime() != null && a2.getAppointmentTime() != null &&
                            a1.getAppointmentTime().isAfter(a2.getAppointmentTime())) {
                        shouldSwap = true;
                    }
                }

                if (shouldSwap) {
                    // Swap appointments
                    list.set(i - 1, a2);
                    list.set(i, a1);
                    swapped = true;
                }
            }
            n--; // optimization
        } while (swapped);
    }

    // Helper to convert priority to numeric value for sorting (lower = higher priority)
    static int getPriorityValue(String priority) {
        return switch (priority.toLowerCase()) {
            case "emergency" -> 1;
            case "high-priority" -> 2;
            case "general" -> 3;
            default -> 4;
        };
    }

    //  Generate appointmentID automatically "APT###" format
    public static String generateAppointmentId(List<Appointment> appointments) {
        int maxId = 0;
        for (Appointment a : appointments) {
            String id = a.getAppointmentID().replaceAll("\\D", "");
            try {
                int num = Integer.parseInt(id);
                if (num > maxId) {
                    maxId = num;
                }
            } catch (NumberFormatException ignored) {}
        }
        return String.format("APT%03d", maxId + 1);
    }

}
