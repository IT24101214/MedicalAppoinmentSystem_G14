<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-mint { background-color: #d1fae5; }        /* Light mint */
        .bg-mint-dark { background-color: #99f6e4; }   /* Darker mint */
        .text-mint { color: #0f766e; }                 /* Mint text */
    </style>
</head>
<body class="bg-mint font-sans min-h-screen">

<!-- NAVBAR -->
<nav class="bg-mint-dark shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="text-mint hover:text-teal-700">Home</a>
        <a href="adminLogin.jsp" class="text-mint hover:text-teal-700">Admin</a>
        <a href="userLogin.jsp" class="text-mint hover:text-teal-700">Sign In</a>
    </div>
</nav>

<!-- FEEDBACK FORM -->
<div class="max-w-xl mx-auto mt-12 bg-white p-8 rounded-lg shadow-lg">
    <h2 class="text-2xl font-semibold text-teal-800 mb-6 text-center">Submit Your Feedback</h2>

    <form action="FeedbackServlet" method="post">

    <!-- Name -->
        <div>
            <label class="block text-teal-700 font-medium mb-1">Name</label>
            <input type="text" name="userId" placeholder="Enter your name"
                   class="w-full border border-teal-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-500"
                   required>
        </div>

        <!-- Feedback Text -->
        <div>
            <label class="block text-teal-700 font-medium mb-1">Feedback</label>
            <textarea name="feedbackText" rows="5" placeholder="Write your feedback here"
                      class="w-full border border-teal-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-500"
                      required></textarea>
        </div>

        <!-- Date -->
        <div>
            <label class="block text-teal-700 font-medium mb-1">Date</label>
            <input type="date" name="dateSubmitted"
                   class="w-full border border-teal-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-500"
                   required>
        </div>

        <!-- Submit Button -->
        <div class="text-center pt-4">
            <input type="submit" value="Submit Feedback"
                   class="bg-teal-500 text-white px-6 py-2 rounded hover:bg-teal-600 transition shadow-md cursor-pointer">
        </div>
    </form>
</div>

<!-- FOOTER -->
<footer class="bg-mint-dark text-center p-4 mt-12 text-teal-800 font-medium">
    <p>&copy; 2025 MediCare. All rights reserved.</p>
</footer>

</body>
</html>
