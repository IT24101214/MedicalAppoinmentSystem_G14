<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Doctor Schedule</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #2ecc71;
            --danger: #e74c3c;
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
            border-bottom: 1px solid #eee;
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

        .time-fields {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .btn-submit {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
        }

        .btn-submit:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add Doctor Schedule</h1>
    <form action="${pageContext.request.contextPath}/addDoctorSchedule" method="POST">

    <div class="form-group">
            <label for="doctorId">Doctor ID</label>
            <input type="text" id="doctorId" name="doctorId" required>
        </div>

        <div class="form-group">
            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>
        </div>

        <div class="form-group time-fields">
            <div>
                <label for="startTime">Start Time</label>
                <input type="time" id="startTime" name="startTime" required>
            </div>
            <div>
                <label for="endTime">End Time</label>
                <input type="time" id="endTime" name="endTime" required>
            </div>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
            </select>
        </div>

        <button type="submit" class="btn-submit">Save Schedule</button>
    </form>
</div>
</body>
</html>