<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Process Payment</title>
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
      max-width: 600px;
      margin: 0 auto;
      background: white;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    h1 {
      color: var(--secondary);
      border-bottom: 1px solid var(--light-gray);
      padding-bottom: 1rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
    }

    input, select {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }

    .amount-input {
      position: relative;
    }

    .amount-input::before {
      content: "$";
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      font-weight: bold;
    }

    .amount-input input {
      padding-left: 30px;
    }

    .btn-submit {
      background: var(--success);
      color: white;
      border: none;
      padding: 0.75rem 1.5rem;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      width: 100%;
      transition: background 0.3s;
    }

    .btn-submit:hover {
      background: #27ae60;
    }

    .payment-method {
      display: flex;
      gap: 1rem;
      margin: 1rem 0;
    }

    .payment-method label {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Process Payment</h1>
  <form action="addPayment" method="POST">
    <input type="hidden" name="paymentId" value="PAY<%= System.currentTimeMillis() %>">

    <div class="form-group">
      <label for="patientId">Patient ID</label>
      <input type="text" id="patientId" name="patientId" required>
    </div>

    <div class="form-group">
      <label for="appointmentId">Appointment ID</label>
      <input type="text" id="appointmentId" name="appointmentId" required>
    </div>

    <div class="form-group amount-input">
      <label for="amount">Amount</label>
      <input type="number" id="amount" name="amount" step="0.01" min="0" required>
    </div>

    <div class="form-group">
      <label>Payment Method</label>
      <div class="payment-method">
        <label><input type="radio" name="bankAccountNo" value="CARD-****-1234" checked> Credit Card</label>
        <label><input type="radio" name="bankAccountNo" value="BANK-****-5678"> Bank Transfer</label>
      </div>
    </div>

    <div class="form-group">
      <label for="paymentDate">Payment Date</label>
      <input type="date" id="paymentDate" name="paymentDate" required>
    </div>

    <button type="submit" class="btn-submit">Process Payment</button>
  </form>
</div>
</body>
</html>