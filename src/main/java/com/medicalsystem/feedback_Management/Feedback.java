package com.medicalsystem.Feedback_Management;

public class Feedback {
    private String userId;
    private String feedbackText;
    private String dateSubmitted;

    public Feedback(String userId, String feedbackText, String dateSubmitted) {
        this.userId = userId;
        this.feedbackText = feedbackText;
        this.dateSubmitted = dateSubmitted;
    }

    public String getUserId() {
        return userId;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public String getDateSubmitted() {
        return dateSubmitted;
    }
}
