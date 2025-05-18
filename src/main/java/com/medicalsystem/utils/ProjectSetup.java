package com.medicalsystem.utils;

import java.io.File;

public class ProjectSetup {
    public static final String DATA_FOLDER = "project_data";

    public static void initializeProjectFolder() {
        File folder = new File(DATA_FOLDER);
        if (!folder.exists()) {
            boolean created = folder.mkdirs();
            if (created) {
                System.out.println("Data folder created at: " + folder.getAbsolutePath());
            } else {
                System.err.println("Failed to create data folder.");
            }
        }
    }

    public static boolean deleteProjectFolder() {
        File folder = new File(DATA_FOLDER);
        return deleteRecursively(folder);
    }

    private static boolean deleteRecursively(File file) {
        if (file.isDirectory()) {
            for (File child : file.listFiles()) {
                deleteRecursively(child);
            }
        }
        return file.delete();
    }
}
/// purpose for Create/Delete the data folder (project_data)