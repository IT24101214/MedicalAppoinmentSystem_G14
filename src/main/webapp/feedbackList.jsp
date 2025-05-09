<%@ page import="java.util.List" %>
<%@ page import="com.medicalsystem.Feedback_Management.Feedback" %> <!-- Make sure this import matches your package -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-mint { background-color: #d1fae5; }
        .bg-mint-dark { background-color: #99f6e4; }
        .text-mint { color: #0f766e; }
    </style>
</head>
<body class="bg-mint font-sans min-h-screen">

<!-- NAVBAR -->
<nav class="bg-mint-dark shadow-md p-4 flex justify-between items-center">
    <div class="text-2xl font-bold text-mint">MediCare</div>
    <div class="space-x-6 flex items-center">
        <a href="index.jsp" class="text-mint hover:text-teal-700">Home</a>
        <a href="submitFeedback.jsp" class="text-mint hover:text-teal-700">Give Feedback</a>
    </div>
</nav>

<!-- FEEDBACK TABLE -->
<div class="max-w-4xl mx-auto mt-12 bg-white p-6 rounded-lg shadow-lg">
    <h2 class="text-2xl font-semibold text-teal-800 mb-4 text-center">All Feedback</h2>

    <table class="min-w-full table-auto border border-teal-300 rounded">
        <thead class="bg-mint-dark text-teal-900">
        <tr>
            <th class="px-4 py-2 text-left">Name</th>
            <th class="px-4 py-2 text-left">Feedback</th>
            <th class="px-4 py-2 text-left">Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
            if (feedbackList != null && !feedbackList.isEmpty()) {
                for (Feedback feedback : feedbackList) {
        %>
        <tr class="border-t border-teal-200">
            <td class="px-4 py-2"><%= feedback.getUserId() %></td>
            <td class="px-4 py-2"><%= feedback.getFeedbackText() %></td>
            <td class="px-4 py-2"><%= feedback.getDateSubmitted() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="text-center text-gray-500 p-4">No feedback available yet.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>













<!-- FOOTER -->
<footer class="bg-mint-dark text-center p-4 mt-12 text-teal-800 font-medium">
    <p>&copy; 2025 MediCare. All rights reserved.</p>
</footer>

</body>
</html>
