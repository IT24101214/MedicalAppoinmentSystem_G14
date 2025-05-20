package com.medicalsystem.Admin.utils;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebListener
public class AppContextListener implements ServletContextListener {
    private static final Logger LOGGER = Logger.getLogger(AppContextListener.class.getName());
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            LOGGER.info("Initializing AppContextListener");
            FileHandler.setServletContext(sce.getServletContext());
            LOGGER.info("AppContextListener initialized successfully");
            
            // Force admin file check
            String dataDir = sce.getServletContext().getRealPath("WEB-INF/Data");
            LOGGER.info("Data directory path: " + dataDir);
            
            // Force check of admin file
            FileHandler.checkAndInitializeAdminFile();
            LOGGER.info("Admin files checked and initialized");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in AppContextListener initialization", e);
            e.printStackTrace();
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        LOGGER.info("AppContextListener destroyed");
    }
} 