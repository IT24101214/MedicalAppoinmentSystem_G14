package com.medicalsystem.Payment;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentManager {
    private static final String FILE_PATH = "data/payment.txt";
    private List<Payment> payments = new ArrayList<>();

    public void addPayment(Payment p) {
        payments.add(p);
        saveToFile();
    }

    public List<Payment> getAllPayments() {
        loadFromFile();
        return payments;
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Payment p : payments) {
                writer.write(String.join(",", p.getPaymentId(), p.getPatientId(), p.getAppointmentId(),
                        String.valueOf(p.getAmount()), p.getBankAccountNo(), p.getPaymentDate()));
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving payments: " + e.getMessage());
        }
    }

    private void loadFromFile() {
        payments.clear();
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 6) {
                    Payment p = new Payment(parts[0], parts[1], parts[2],
                            Double.parseDouble(parts[3]), parts[4], parts[5]);
                    payments.add(p);
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading payments: " + e.getMessage());
        }
    }
}
