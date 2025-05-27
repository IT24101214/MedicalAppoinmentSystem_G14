package com.medicalsystem.appointment.dsa;

import com.medicalsystem.appointment.Appointment;
import java.util.ArrayList;
import java.util.List;

public class PriorityQueue {
    private final List<Appointment> heap = new ArrayList<>();

    public void offer(Appointment a) {
        heap.add(a);
        heap.sort((a1, a2) -> Integer.compare(
                DSAUtils.getPriorityValue(a1.getPriority()),
                DSAUtils.getPriorityValue(a2.getPriority())
        ));
    }

    public Appointment poll() {
        if (heap.isEmpty()) return null;
        return heap.remove(0);
    }

    public boolean isEmpty() {
        return heap.isEmpty();
    }
    public List<Appointment> getAll() {
        return new ArrayList<>(heap);
    }
    public void clear() {
        heap.clear();
    }

    public void addAll(List<Appointment> appointments) {
        for (Appointment a : appointments) {
            offer(a); // reuses your sorted insertion
        }
    }


}
