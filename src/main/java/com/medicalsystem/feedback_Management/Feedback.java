package com.medicalsystem.feedback_Management;

public class Feedback {
    private String userId;
    private String feedbackText;
    private String dateSubmitted;

    // Constructor
    public Feedback(String userId, String feedbackText, String dateSubmitted) {
        this.userId = userId;
        this.feedbackText = feedbackText;
        this.dateSubmitted = dateSubmitted;
    }

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }

    public String getDateSubmitted() {
        return dateSubmitted;
    }

    public void setDateSubmitted(String dateSubmitted) {
        this.dateSubmitted = dateSubmitted;
    }
}