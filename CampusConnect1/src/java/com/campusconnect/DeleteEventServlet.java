package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(
                request.getParameter("eventId").trim()
        );

        EventDAO eventDAO = new EventDAO();

        boolean success = eventDAO.deleteEvent(eventId);

        if (success) {
            response.sendRedirect("ViewEventsServlet?deleted=true");
        } else {
            response.sendRedirect("ViewEventsServlet?deleted=false");
        }
    }
}