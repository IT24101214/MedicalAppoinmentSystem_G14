package com.medicalsystem.feedback_Management;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackManager {
    private static final String FILE_PATH = "feedbacks.txt";

    // Save feedback to file
    public void saveFeedback(Feedback feedback) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(feedback.getUserId() + "," + feedback.getFeedbackText() + "," + feedback.getDateSubmitted());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Get all feedbacks from file
    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                Feedback feedback = new Feedback(parts[0], parts[1], parts[2]);
                feedbackList.add(feedback);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}