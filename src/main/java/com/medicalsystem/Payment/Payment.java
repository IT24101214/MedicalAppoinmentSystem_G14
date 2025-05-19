package com.medicalsystem.Payment;

public class Payment {
    private String paymentId;
    private String patientId;
    private String appointmentId;
    private double amount;
    private String bankAccountNo;
    private String paymentDate;

    public Payment(String paymentId, String patientId, String appointmentId,
                   double amount, String bankAccountNo, String paymentDate) {
        this.paymentId = paymentId;
        this.patientId = patientId;
        this.appointmentId = appointmentId;
        this.amount = amount;
        this.bankAccountNo = bankAccountNo;
        this.paymentDate = paymentDate;
    }

    public String getPaymentId() { return paymentId; }
    public String getPatientId() { return patientId; }
    public String getAppointmentId() { return appointmentId; }
    public double getAmount() { return amount; }
    public String getBankAccountNo() { return bankAccountNo; }
    public String getPaymentDate() { return paymentDate; }
}
