<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.Payment.Payment"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Records</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light-gray: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        h1 {
            color: var(--secondary);
            margin: 0;
        }

        .btn-new {
            background: var(--primary);
            color: white;
            text-decoration: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light-gray);
        }

        th {
            background: var(--secondary);
            color: white;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .amount {
            font-weight: bold;
            color: var(--success);
        }

        .payment-method {
            font-family: monospace;
            font-size: 0.9rem;
        }

        .receipt-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Payment Records</h1>
        <a href="addPayment.jsp" class="btn-new">+ New Payment</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>Payment ID</th>
            <th>Patient ID</th>
            <th>Appointment ID</th>
            <th>Amount</th>
            <th>Payment Method</th>
            <th>Date</th>
            <th>Receipt</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Payment> payments = (List<Payment>) request.getAttribute("payments");
            if (payments != null) {
                for (Payment payment : payments) {
        %>
        <tr>
            <td><%= payment.getPaymentId() %></td>
            <td><%= payment.getPatientId() %></td>
            <td><%= payment.getAppointmentId() %></td>
            <td class="amount">$<%= String.format("%.2f", payment.getAmount()) %></td>
            <td class="payment-method"><%= payment.getBankAccountNo() %></td>
            <td><%= payment.getPaymentDate() %></td>
            <td>
                <button class="receipt-btn"
                        onclick="window.print()">Print Receipt</button>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>