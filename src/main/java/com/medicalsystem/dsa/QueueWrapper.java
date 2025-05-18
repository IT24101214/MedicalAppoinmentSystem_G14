package com.medicalsystem.dsa;// com.medicalsystem.dsa.QueueWrapper.java

import com.medicalsystem.Appointment.Appointment;
import java.util.PriorityQueue;

/// OPTIONAL one abstract priorityQueue

public class QueueWrapper {
    private final PriorityQueue<Appointment> queue = new PriorityQueue<>();

    public void enqueue(Appointment a) {
        queue.add(a);
    }

    public Appointment dequeue() {
        return queue.poll();
    }

    public Appointment peek() {
        return queue.peek();
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }

    public PriorityQueue<Appointment> getQueue() {
        return queue;
    }
}
