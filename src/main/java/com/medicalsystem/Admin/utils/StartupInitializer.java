package com.medicalsystem.Admin.utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(urlPatterns = "/initialize", loadOnStartup = 1)
public class StartupInitializer extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(StartupInitializer.class.getName());
    
    @Override
    public void init() throws ServletException {
        try {
            LOGGER.info("Initializing StartupInitializer servlet");
            FileHandler.setServletContext(getServletContext());
            
            // Force admin file check
            String dataDir = getServletContext().getRealPath("WEB-INF/Data");
            LOGGER.info("Data directory path: " + dataDir);
            
            // Force check of admin file
            FileHandler.checkAndInitializeAdminFile();
            LOGGER.info("Admin files checked and initialized by StartupInitializer");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in StartupInitializer initialization", e);
            e.printStackTrace();
            throw new ServletException("Failed to initialize properly", e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.getWriter().write("System initialized successfully");
    }
} 