
package com.medicalsystem.Payment.servlet;

import com.medicalsystem.Payment.Payment;
import com.medicalsystem.Payment.PaymentManager;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/addPayment")
public class AddPaymentServlet extends HttpServlet {
    private final PaymentManager paymentManager = new PaymentManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("paymentId");
        String patientId = request.getParameter("patientId");
        String appointmentId = request.getParameter("appointmentId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String bankAccountNo = request.getParameter("bankAccountNo");
        String paymentDate = request.getParameter("paymentDate");

        Payment payment = new Payment(paymentId, patientId, appointmentId, amount, bankAccountNo, paymentDate);
        paymentManager.addPayment(payment);

        response.sendRedirect("payment/paymentList.jsp");
    }
}
