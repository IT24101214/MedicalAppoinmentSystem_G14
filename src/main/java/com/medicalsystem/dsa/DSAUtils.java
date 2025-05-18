package com.medicalsystem.dsa;

import com.medicalsystem.Appointment.Appointment;

import java.util.List;
import java.util.PriorityQueue;

public class DSAUtils {

        public static void bubbleSort(List<Appointment> list) {
            int n = list.size();
            boolean swapped;

            do {
                swapped = false;
                for (int i = 1; i < n; i++) {
                    //  sorting by appointmentID
                    if(list.get(i - 1).getAppointmentID().compareTo(list.get(i).getAppointmentID()) > 0) {
                        // Swap elements
                        Appointment temp = list.get(i - 1);
                        list.set(i - 1, list.get(i));
                        list.set(i, temp);
                        swapped = true;
                    }
                }
                n--; // Largest element bubbles to the end
            } while (swapped);
            for (Appointment appt : list) {
                System.out.println(appt);
            }
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
