package com.medicalsystem.appointment;

import java.util.Scanner;

public class AppointmentSystem {
    public static void main(String[] args) {
        AppointmentManager manager = new AppointmentManager("src\\main\\webapp\\appointments.json");
        manager.loadAppointments(); // Load existing appointments
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nMedical Appointment System");
            System.out.println("1. Book Appointment");
            System.out.println("2. View Appointments");
            System.out.println("3. Reschedule Appointment");
            System.out.println("4. Cancel Appointment");
            System.out.println("5. Save and Exit");
            System.out.print("Enter your choice: ");

            try {
                int choice = Integer.parseInt(scanner.nextLine());

                switch (choice) {
                    case 1:
                        System.out.print("Enter Doctor Name: ");
                        String doctor = scanner.nextLine();
                        System.out.print("Enter Patient Name: ");
                        String patient = scanner.nextLine();
                        System.out.print("Enter Date (YYYY-MM-DD): ");
                        String date = scanner.nextLine();
                        System.out.print("Enter Time (HH:MM): ");
                        String time = scanner.nextLine();
                        System.out.print("Enter Urgency Level (1 = High, 2 = Medium, 3 = Low): ");
                        int urgency = Integer.parseInt(scanner.nextLine());

                        int newId = manager.getAppointments().isEmpty() ? 1 :
                                manager.getAppointments().stream().mapToInt(Appointment::getAppointmentID).max().getAsInt() + 1;

                        manager.bookAppointment(new Appointment(newId, patient, doctor, date, time, urgency));
                        System.out.println("Appointment booked successfully!");
                        break;


                    case 2:
                        manager.sortAppointmentsByUrgency();
                        manager.viewAllAppointments();
                        break;

                    case 3:
                        System.out.print("Enter Appointment ID to reschedule: ");
                        int id = Integer.parseInt(scanner.nextLine());
                        System.out.print("Enter New Date (YYYY-MM-DD): ");
                        String newDate = scanner.nextLine();
                        System.out.print("Enter New Time (HH:MM): ");
                        String newTime = scanner.nextLine();
                        manager.updateAppointment(id, newDate, newTime);
                        System.out.println("Appointment updated successfully!");
                        break;

                    case 4:
                        System.out.print("Enter Appointment ID to cancel: ");
                        int cancelId = Integer.parseInt(scanner.nextLine());
                        manager.deleteAppointment(cancelId);
                        System.out.println("Appointment canceled successfully!");
                        break;

                    case 5:
                        manager.saveAppointments();
                        System.out.println("Appointments saved. Exiting...");
                        scanner.close();
                        return;

                    default:
                        System.out.println("Invalid choice. Please enter a number between 1-5.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Please enter a valid number.");
            } catch (Exception e) {
                System.out.println("An error occurred: " + e.getMessage());
            }
        }
    }
}