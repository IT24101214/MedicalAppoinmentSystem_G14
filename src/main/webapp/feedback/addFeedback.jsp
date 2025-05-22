<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Submit Feedback</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --star-active: #FFD700;
            --star-inactive: #CCCCCC;
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

        input, textarea, select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        .rating-container {
            display: flex;
            gap: 0.5rem;
            margin: 1rem 0;
        }

        .rating-star {
            font-size: 2rem;
            color: var(--star-inactive);
            cursor: pointer;
        }

        .rating-star.active {
            color: var(--star-active);
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
    <h1>Submit Feedback</h1>
    <form action="addFeedback" method="POST">
        <input type="hidden" id="feedbackId" name="feedbackId" value="F<%= System.currentTimeMillis() %>">

        <div class="form-group">
            <label for="patientId">Patient ID</label>
            <input type="text" id="patientId" name="patientId" required>
        </div>

        <div class="form-group">
            <label for="doctorId">Doctor ID</label>
            <input type="text" id="doctorId" name="doctorId" required>
        </div>

        <div class="form-group">
            <label>Rating</label>
            <div class="rating-container">
                <% for (int i=1; i<=5; i++) { %>
                <span class="rating-star" data-value="<%= i %>">★</span>
                <% } %>
            </div>
            <input type="hidden" id="rating" name="rating" required>
        </div>

        <div class="form-group">
            <label for="comments">Comments</label>
            <textarea id="comments" name="comments" required></textarea>
        </div>

        <button type="submit" class="btn-submit">Submit Feedback</button>
    </form>
</div>

<script>
    // Star rating functionality
    const stars = document.querySelectorAll('.rating-star');
    const ratingInput = document.getElementById('rating');

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'));
            ratingInput.value = value;

            stars.forEach((s, index) => {
                if (index < value) {
                    s.classList.add('active');
                } else {
                    s.classList.remove('active');
                }
            });
        });
    });
</script>
</body>
</html>