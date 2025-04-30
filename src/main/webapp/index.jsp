<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <style>
        body { padding-top: 80px; }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Medical System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="doctor.jsp">Doctor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="patient.jsp">Patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="feedback.jsp">Feedback</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <div class="row mb-4">
        <!-- Appointment Form -->
        <div class="col-md-6 form-container">
            <h3>Schedule New Appointment</h3>
            <form method="post" action="appointments?action=book">
            <div class="mb-3">
                    <label class="form-label">Patient Name</label>
                    <input type="text" class="form-control" name="patientName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Doctor Name</label>
                    <input type="text" class="form-control" name="doctorName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <input type="date" class="form-control" name="date" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Time</label>
                    <input type="time" class="form-control" name="time" required>
                </div>
                <button type="submit" class="btn btn-primary">Schedule Appointment</button>
            </form>
        </div>

        <!-- Search Section (Can be extended later) -->
        <div class="col-md-6 form-container">
            <h3>Find Appointments</h3>
            <div class="mb-3">
                <label class="form-label">Search by Patient Name</label>
                <input type="text" class="form-control" id="searchInput" placeholder="Enter patient name">
            </div>
            <button class="btn btn-secondary" onclick="searchAppointments()">Search</button>
            <button class="btn btn-outline-secondary" onclick="getAllAppointments()">Show All</button>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/appointment.js"></script>
</body>
</html>
