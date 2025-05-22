<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Doctor Schedule</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --light-gray: #ecf0f1;
            --error: #e74c3c;
        }

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
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--secondary);
        }

        input, select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .btn-submit {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 1rem;
        }

        .btn-submit:hover {
            background: #2980b9;
        }

        .availability-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 0.5rem;
            margin: 1rem 0;
        }

        .day-checkbox {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .error-message {
            color: var(--error);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Doctor Schedule</h1>

    <% if (request.getParameter("error") != null) { %>
    <div class="error-message">
        <%= request.getParameter("error") %>
    </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/schedule/editDoctorSchedule" method="POST">
        <input type="hidden" name="oldStartTime" value="<%= request.getParameter("startTime") %>">

        <div class="form-group">
            <label for="doctorId">Doctor ID</label>
            <input type="text" id="doctorId" name="doctorId" value="<%= request.getParameter("doctorId") %>" readonly>
        </div>

        <div class="form-group">
            <label for="startTime">Start Time</label>
            <input type="time" id="startTime" name="startTime" value="<%= request.getParameter("startTime") %>" required>
        </div>

        <div class="form-group">
            <label for="endTime">End Time</label>
            <input type="time" id="endTime" name="endTime" value="<%= request.getParameter("endTime") %>" required>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="Active" <%= "Active".equals(request.getParameter("status")) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(request.getParameter("status")) ? "selected" : "" %>>Inactive</option>
                <option value="On Leave" <%= "On Leave".equals(request.getParameter("status")) ? "selected" : "" %>>On Leave</option>
            </select>
        </div>

        <div class="form-group">
            <label>Availability</label>
            <div class="availability-grid">
                <%
                    String availableDaysParam = request.getParameter("availableDays");
                    String[] availableDays = availableDaysParam != null ? availableDaysParam.split(",") : new String[0];
                %>
                <div class="day-checkbox">
                    <input type="checkbox" id="monday" name="availability" value="Monday" <%= contains(availableDays, "Monday") ? "checked" : "" %>>
                    <label for="monday">Monday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="tuesday" name="availability" value="Tuesday" <%= contains(availableDays, "Tuesday") ? "checked" : "" %>>
                    <label for="tuesday">Tuesday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="wednesday" name="availability" value="Wednesday" <%= contains(availableDays, "Wednesday") ? "checked" : "" %>>
                    <label for="wednesday">Wednesday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="thursday" name="availability" value="Thursday" <%= contains(availableDays, "Thursday") ? "checked" : "" %>>
                    <label for="thursday">Thursday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="friday" name="availability" value="Friday" <%= contains(availableDays, "Friday") ? "checked" : "" %>>
                    <label for="friday">Friday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="saturday" name="availability" value="Saturday" <%= contains(availableDays, "Saturday") ? "checked" : "" %>>
                    <label for="saturday">Saturday</label>
                </div>
                <div class="day-checkbox">
                    <input type="checkbox" id="sunday" name="availability" value="Sunday" <%= contains(availableDays, "Sunday") ? "checked" : "" %>>
                    <label for="sunday">Sunday</label>
                </div>
            </div>
        </div>

        <button type="submit" class="btn-submit">Update Schedule</button>
    </form>
</div>
</body>
</html>

<%!
    private boolean contains(String[] array, String value) {
        if (array == null) return false;
        for (String item : array) {
            if (item.equals(value)) {
                return true;
            }
        }
        return false;
    }
%>