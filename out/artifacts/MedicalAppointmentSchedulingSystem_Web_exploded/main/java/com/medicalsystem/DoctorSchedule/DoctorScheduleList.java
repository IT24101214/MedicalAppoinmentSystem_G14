package com.medicalsystem.DoctorSchedule;

public class DoctorScheduleList {
    private DoctorSchedule[] data;
    private int size;

    public DoctorScheduleList() {
        data = new DoctorSchedule[100];
        size = 0;
    }

    public void add(DoctorSchedule schedule) {
        if (size >= data.length) {
            expandCapacity();
        }
        data[size++] = schedule;
    }

    public DoctorSchedule get(int index) {
        if (index < 0 || index >= size) return null;
        return data[index];
    }
    public void set(int index, DoctorSchedule schedule) {
        if (index >= 0 && index < size) {
            data[index] = schedule;
        }
    }


    public int size() {
        return size;
    }

    private void expandCapacity() {
        DoctorSchedule[] newData = new DoctorSchedule[data.length * 2];
        for (int i = 0; i < size; i++) {
            newData[i] = data[i];
        }
        data = newData;
    }

    public DoctorSchedule[] toArray() {
        DoctorSchedule[] arr = new DoctorSchedule[size];
        for (int i = 0; i < size; i++) {
            arr[i] = data[i];
        }
        return arr;
    }
}