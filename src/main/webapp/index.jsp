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
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Appointment.jsp">Appointments</a>
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
<h3 class="text-center my-4">Welcome page</h3>
</body>
</html>
