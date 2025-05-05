package com.medicalsystem.feedback_Management;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

public class FeedbackServlet extends HttpServlet {
    private FeedbackManager feedbackManager = new FeedbackManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String feedbackText = request.getParameter("feedbackText");
        String dateSubmitted = java.time.LocalDate.now().toString();

        Feedback feedback = new Feedback(userId, feedbackText, dateSubmitted);
        feedbackManager.saveFeedback(feedback);

        response.sendRedirect("feedbackList.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Feedback> feedbackList = feedbackManager.getAllFeedback();
        request.setAttribute("feedbackList", feedbackList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedbackList.jsp");
        dispatcher.forward(request, response);
    }
}