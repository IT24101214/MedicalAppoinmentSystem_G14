// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Set minimum date for appointment booking to today
    const dateInputs = document.querySelectorAll('input[type="date"]');
    const today = new Date().toISOString().split('T')[0];
    dateInputs.forEach(input => input.min = today);

    // Time slot sorting functionality
    if (document.getElementById('timeSlots')) {
        setupAppointmentBooking();
    }

    // Form validation
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
            }
        });
    });
});

// Appointment booking setup
function setupAppointmentBooking() {
    const doctorSelect = document.getElementById('doctor');
    const dateInput = document.getElementById('date');
    const timeSelect = document.getElementById('timeSlots');

    // Mock data for demonstration
    const mockTimeSlots = [
        "10:30 AM", "9:00 AM", "2:15 PM", "11:45 AM", "8:30 AM"
    ];

    dateInput.addEventListener('change', function() {
        if (doctorSelect.value && this.value) {
            // Sort the time slots using bubble sort
            const sortedSlots = bubbleSortTimeSlots([...mockTimeSlots]);

            // Clear and repopulate time slots
            timeSelect.innerHTML = '<option value="">Select a time slot</option>';
            sortedSlots.forEach(slot => {
                const option = document.createElement('option');
                option.value = slot;
                option.textContent = slot;
                timeSelect.appendChild(option);
            });
        }
    });
}

// Bubble Sort Implementation
function bubbleSortTimeSlots(timeSlots) {
    let swapped;
    do {
        swapped = false;
        for (let i = 0; i < timeSlots.length - 1; i++) {
            if (convertTimeToMinutes(timeSlots[i]) > convertTimeToMinutes(timeSlots[i+1])) {
                // Swap elements
                [timeSlots[i], timeSlots[i+1]] = [timeSlots[i+1], timeSlots[i]];
                swapped = true;
            }
        }
    } while (swapped);
    return timeSlots;
}

// Helper function to convert time to minutes
function convertTimeToMinutes(timeStr) {
    const [time, period] = timeStr.split(' ');
    let [hours, minutes] = time.split(':').map(Number);

    if (period === 'PM' && hours !== 12) hours += 12;
    if (period === 'AM' && hours === 12) hours = 0;

    return hours * 60 + minutes;
}

// Basic form validation
function validateForm(form) {
    let isValid = true;
    const requiredFields = form.querySelectorAll('[required]');

    requiredFields.forEach(field => {
        if (!field.value.trim()) {
            alert(`Please fill in ${field.name}`);
            isValid = false;
        }
    });

    return isValid;
}