package com.medicalsystem.Payment.servlet;

import com.medicalsystem.Payment.Payment;
import com.medicalsystem.Payment.PaymentManager;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/payments")
public class PaymentListServlet extends HttpServlet {
    private final PaymentManager paymentManager = new PaymentManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Payment> payments = paymentManager.getAllPayments();
        request.setAttribute("payments", payments);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/payment/paymentList.jsp");
        dispatcher.forward(request, response);
    }
}
