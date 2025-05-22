<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Appointment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Schedule New Appointment</h1>
    <form action="${pageContext.request.contextPath}/addAppointment" method="post">

    <div class="form-group">
            <label for="appointmentId">Appointment ID</label>
            <input type="text" id="appointmentId" name="appointmentId" required>
        </div>

        <div class="form-group">
            <label for="patientId">Patient ID</label>
            <input type="text" id="patientId" name="patientId" required>
        </div>

        <div class="form-group">
            <label for="doctorId">Doctor ID</label>
            <input type="text" id="doctorId" name="doctorId" required>
        </div>

        <div class="form-group">
            <label for="priority">Priority</label>
            <select id="priority" name="priority" required>
                <option value="High">High</option>
                <option value="Medium" selected>Medium</option>
                <option value="Low">Low</option>
            </select>
        </div>

        <div class="form-group">
            <label for="reason">Reason</label>
            <textarea id="reason" name="reason" rows="3" required></textarea>
        </div>

        <button type="submit">Schedule Appointment</button>
    </form>
</div>
</body>
</html>