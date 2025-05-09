<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.Payment_Management.Payment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Payment> payments = (List<Payment>) request.getAttribute("payments");
%>
<html>
<head>
    <title>Payment List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-mint-50 p-6 font-sans">
<!-- Header -->
<h2 class="text-2xl text-center mt-10 text-mint-700">Payment Verification</h2>

<!-- Payment Table -->
<div class="overflow-x-auto mt-6">
    <table class="min-w-full bg-white shadow-md rounded-2xl overflow-hidden">
        <thead class="bg-mint-100 text-mint-700">
        <tr>
            <th class="py-3 px-4 text-left">Payment ID</th>
            <th class="py-3 px-4 text-left">User ID</th>
            <th class="py-3 px-4 text-left">Appointment ID</th>
            <th class="py-3 px-4 text-left">Bank Account</th>
            <th class="py-3 px-4 text-left">Reference</th>
            <th class="py-3 px-4 text-left">Status</th>
            <th class="py-3 px-4 text-left">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (payments != null) {
                for (Payment p : payments) {
        %>
        <tr class="border-t">
            <td class="py-2 px-4"><%= p.getPaymentId() %></td>
            <td class="py-2 px-4"><%= p.getUserId() %></td>
            <td class="py-2 px-4"><%= p.getAppointmentId() %></td>
            <td class="py-2 px-4"><%= p.getBankAccountNumber() %></td>
            <td class="py-2 px-4"><%= p.getReferenceNumber() %></td>
            <td class="py-2 px-4 font-semibold"><%= p.getStatus() %></td>
            <td class="py-2 px-4 space-x-1">
                <form action="PaymentServlet" method="post" class="inline">
                    <input type="hidden" name="action" value="verify">
                    <input type="hidden" name="paymentId" value="<%= p.getPaymentId() %>">
                    <button class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">✔</button>
                </form>
                <form action="PaymentServlet" method="post" class="inline">
                    <input type="hidden" name="action" value="reject">
                    <input type="hidden" name="paymentId" value="<%= p.getPaymentId() %>">
                    <button class="bg-yellow-500 text-white px-3 py-1 rounded hover:bg-yellow-600">✖</button>
                </form>
                <form action="PaymentServlet" method="post" class="inline">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="paymentId" value="<%= p.getPaymentId() %>">
                    <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">🗑</button>
                </form>
            </td>
        </tr>
        <% }} %>
        </tbody>
    </table>
</div>
</body>
</html>
