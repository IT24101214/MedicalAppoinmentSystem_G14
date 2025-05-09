package com.medicalsystem.Feedback_Management;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackManager {
    private final String filePath;

    public FeedbackManager(String filePath) {
        this.filePath = filePath;
    }

    public void saveFeedback(Feedback feedback) {
        try {
            File file = new File(filePath);
            file.getParentFile().mkdirs(); // Just in case

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(feedback.getUserId() + ";" + feedback.getFeedbackText() + ";" + feedback.getDateSubmitted());
                writer.newLine();
                System.out.println("Feedback saved to: " + file.getAbsolutePath());
            }
        } catch (IOException e) {
            System.err.println("Failed to write feedback: " + e.getMessage());
            e.printStackTrace();
        }
    }



    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Changed to semicolon to match servlet
                String[] parts = line.split(";");
                if (parts.length == 3) {  // Added safety check
                    Feedback feedback = new Feedback(parts[0], parts[1], parts[2]);
                    feedbackList.add(feedback);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}