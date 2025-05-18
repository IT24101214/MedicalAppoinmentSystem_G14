package com.medicalsystem.listeners;

import com.medicalsystem.utils.ProjectSetup;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppStartupListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ProjectSetup.initializeProjectFolder();
    }
}

///Purpose: Automatically initialize the data folder when the web app starts