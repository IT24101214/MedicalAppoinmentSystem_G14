package com.medicalsystem.deleteDataFolder;

import com.medicalsystem.utils.ProjectSetup;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/deleteData")
public class DeleteDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean success = ProjectSetup.deleteProjectFolder();
        response.getWriter().write(success ? "Data deleted successfully." : "Failed to delete data.");
    }
}
