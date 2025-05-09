package com.medicalsystem.Feedback_Management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final String FEEDBACK_FILE_PATH = "src/main/webapp/data/feedbacks.txt";
    private FeedbackManager feedbackManager;

    @Override
    public void init() {
        String realPath = getServletContext().getRealPath(FEEDBACK_FILE_PATH);
        System.out.println("Resolved feedback file path: " + realPath);  // DEBUG LINE
        this.feedbackManager = new FeedbackManager("C:/Users/User/Desktop/project/MedicalAppointmentSchedulingSystem/src/main/webapp/data/feedbacks.txt");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String feedbackText = request.getParameter("feedbackText");
        String dateSubmitted = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // Create Feedback object
        Feedback feedback = new Feedback(userId, feedbackText, dateSubmitted);

        // Save feedback using the manager
        feedbackManager.saveFeedback(feedback);

        // Load updated feedbacks.txt
        List<Feedback> feedbackList = feedbackManager.getAllFeedback();

        // Set feedback list and forward to JSP
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedbackList.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Feedback> feedbackList = feedbackManager.getAllFeedback();
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("/feedbackList.jsp").forward(request, response);
    }
}