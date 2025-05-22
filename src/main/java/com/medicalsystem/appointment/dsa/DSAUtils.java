package com.medicalsystem.appointment.dsa;

import com.medicalsystem.appointment.Appointment;

import java.util.List;
import java.util.PriorityQueue;

public class DSAUtils {

    public static void bubbleSort(List<Appointment> list) {
        int n = list.size();
        boolean swapped;

        do {
            swapped = false;
            for (int i = 1; i < n; i++) {
                // Compare by numeric priority value (lower = higher priority)
                if (getPriorityValue(list.get(i - 1).getPriority()) > getPriorityValue(list.get(i).getPriority())) {
                    // Swap
                    Appointment temp = list.get(i - 1);
                    list.set(i - 1, list.get(i));
                    list.set(i, temp);
                    swapped = true;
                }
            }
            n--; // Optimized bubble sort
        } while (swapped);
    }

    // Helper to convert priority to numeric value
    private static int getPriorityValue(String priority) {
        return switch (priority.toLowerCase()) {
            case "high" -> 1;
            case "medium" -> 2;
            case "low" -> 3;
            default -> 4; // unknown priority
        };
    }



    //  Generate appointmentID automatically "APT###" format
    public static String generateAppointmentId(PriorityQueue<Appointment> queue) {
        int maxId = 0;
        for (Appointment a : queue) {
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

    public static PriorityQueue<Appointment> rebuildQueue(List<Appointment> appointments) {
        PriorityQueue<Appointment> queue = new PriorityQueue<>();
        for (Appointment appointment : appointments) {
            queue.offer(appointment); // Add each appointment to the queue
        }
        return queue;
    }
}
