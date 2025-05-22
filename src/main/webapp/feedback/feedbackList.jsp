<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.medicalsystem.Feedback.Feedback"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Feedback List</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --star-active: #FFD700;
            --light-gray: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        h1 {
            color: var(--secondary);
            margin-bottom: 2rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light-gray);
        }

        th {
            background: var(--secondary);
            color: white;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .rating-stars {
            color: var(--star-active);
            letter-spacing: 2px;
        }

        .comments {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .btn-view {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Patient Feedback</h1>

    <table>
        <thead>
        <tr>
            <th>Feedback ID</th>
            <th>Patient ID</th>
            <th>Doctor ID</th>
            <th>Rating</th>
            <th>Comments</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
            if (feedbacks != null) {
                for (Feedback feedback : feedbacks) {
        %>
        <tr>
            <td><%= feedback.getFeedbackId() %></td>
            <td><%= feedback.getPatientId() %></td>
            <td><%= feedback.getDoctorId() %></td>
            <td class="rating-stars">
                <% for (int i=1; i<=5; i++) { %>
                <%= i <= feedback.getRating() ? "★" : "☆" %>
                <% } %>
                (<%= feedback.getRating() %>/5)
            </td>
            <td class="comments" title="<%= feedback.getComments() %>">
                <%= feedback.getComments() %>
            </td>
            <td>
                <button class="btn-view"
                        onclick="alert('Full comment:\n\n<%= feedback.getComments().replace("'", "\\'") %>')">
                    View Full
                </button>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>