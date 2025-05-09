<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Make Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 font-sans">
<div class="max-w-md mx-auto mt-10 bg-white p-8 rounded-2xl shadow-lg">
    <h2 class="text-2xl font-bold text-center text-blue-700 mb-6">Make a Payment</h2>
    <form action="PaymentServlet" method="post" class="space-y-4">
        <input type="hidden" name="action" value="add">

        <div>
            <label class="block mb-1 text-sm font-semibold text-blue-600">User ID</label>
            <input type="text" name="userId" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div>
            <label class="block mb-1 text-sm font-semibold text-blue-600">Appointment ID</label>
            <input type="text" name="appointmentId" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div>
            <label class="block mb-1 text-sm font-semibold text-blue-600">Bank Account Number</label>
            <input type="text" name="bankAccountNumber" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div>
            <label class="block mb-1 text-sm font-semibold text-blue-600">Reference Number</label>
            <input type="text" name="referenceNumber" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-lg transition duration-200">
            Submit Payment
        </button>
    </form>
</div>
</body>
</html>
