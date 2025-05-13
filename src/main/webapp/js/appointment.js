// Base API URL - Update this to match your backend endpoint
const API_URL = "http://localhost:8080/MedicalAppointmentSchedulingSystem/api/appointments";

// Load appointments when page loads
$(document).ready(function() {
    //getAllAppointments();
    console.log("test 1")

    // Handle form submission
    $("#createForm").submit(function(e) {
        //e.preventDefault();
        createAppointment();
    });
});

// Create new appointment.txt
function createAppointment() {

    alert("Appointment created successfully!");
    
    const appointment = {
        patientName: $("input[name='patientName']").val(),
        doctorName: $("input[name='doctorName']").val(),
        date: $("input[name='date']").val(),
        time: $("input[name='time']").val()
    };

    /*$.ajax({
        url: API_URL,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(appointment.txt),
        success: function() {
            alert("Appointment created successfully!");
            $("#createForm")[0].reset();
            getAllAppointments();
        },
        error: function(xhr) {
            alert("Error: " + xhr.responseText);
        }
    });*/
}

// Get all appointments
function getAllAppointments() {
    $.get(API_URL, function(data) {
        displayAppointments(data);
    }).fail(function(xhr) {
        alert("Error fetching appointments: " + xhr.responseText);
    });
}

// Search appointments by patient name
function searchAppointments() {
    const query = $("#searchInput").val();
    if (!query) {
        getAllAppointments();
        return;
    }

    $.get(API_URL + "?patientName=" + encodeURIComponent(query), function(data) {
        displayAppointments(data);
    }).fail(function(xhr) {
        alert("Error searching appointments: " + xhr.responseText);
    });
}

// Display appointments in the UI
function displayAppointments(appointments) {
    const container = $("#appointmentsList");
    container.empty();

    if (appointments.length === 0) {
        container.append("<p>No appointments found</p>");
        return;
    }

    appointments.forEach(appointment => {
        const card = `
            <div class="card appointment-card">
                <div class="card-body">
                    <h5 class="card-title">${appointment.patientName} with Dr. ${appointment.doctorName}</h5>
                    <p class="card-text">
                        <strong>Date:</strong> ${appointment.date}<br>
                        <strong>Time:</strong> ${appointment.time}
                    </p>
                    <button class="btn btn-sm btn-warning me-2" onclick="openEditModal(${appointment.appointmentID})">Edit</button>
                    <button class="btn btn-sm btn-danger" onclick="deleteAppointment(${appointment.appointmentID})">Delete</button>
                </div>
            </div>
        `;
        container.append(card);
    });
}

// Open edit modal with appointment.txt data
function openEditModal(appointmentID) {
    $.get(API_URL + "/" + appointmentID, function(appointment) {
        $("#editAppointmentID").val(appointment.appointmentID);
        $("#editPatientName").val(appointment.patientName);
        $("#editDoctorName").val(appointment.doctorName);
        $("#editDate").val(appointment.date);
        $("#editTime").val(appointment.time);

        // Show the modal
        const modal = new bootstrap.Modal(document.getElementById('editModal'));
        modal.show();
    }).fail(function(xhr) {
        alert("Error fetching appointment.txt: " + xhr.responseText);
    });
}

// Update appointment.txt
function updateAppointment() {
    const appointment = {
        appointmentID: $("#editAppointmentID").val(),
        patientName: $("#editPatientName").val(),
        doctorName: $("#editDoctorName").val(),
        date: $("#editDate").val(),
        time: $("#editTime").val()
    };

    $.ajax({
        url: API_URL + "/" + appointment.appointmentID,
        type: "PUT",
        contentType: "application/json",
        data: JSON.stringify(appointment),
        success: function() {
            alert("Appointment updated successfully!");
            $("#editModal").modal("hide");
            getAllAppointments();
        },
        error: function(xhr) {
            alert("Error updating appointment.txt: " + xhr.responseText);
        }
    });
}

// Delete appointment.txt
function deleteAppointment(appointmentID) {
    if (!confirm("Are you sure you want to delete this appointment.txt?")) return;

    $.ajax({
        url: API_URL + "/" + appointmentID,
        type: "DELETE",
        success: function() {
            alert("Appointment deleted successfully!");
            getAllAppointments();
        },
        error: function(xhr) {
            alert("Error deleting appointment.txt: " + xhr.responseText);
        }
    });
}