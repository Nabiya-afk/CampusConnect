package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get Event ID and remove extra spaces
        int eventId = Integer.parseInt(
                request.getParameter("eventId").trim()
        );

        // Get event details from the form
        String eventName = request.getParameter("eventName");
        String description = request.getParameter("description");
        String eventDate = request.getParameter("eventDate");
        String venue = request.getParameter("venue");

        int maxParticipants = Integer.parseInt(
                request.getParameter("maxParticipants").trim()
        );

        int adminId = Integer.parseInt(
                request.getParameter("adminId").trim()
        );

        // Create Event object
        Event event = new Event();

        event.setEventId(eventId);
        event.setEventName(eventName);
        event.setDescription(description);
        event.setEventDate(eventDate);
        event.setVenue(venue);
        event.setMaxParticipants(maxParticipants);
        event.setAdminId(adminId);

        // Update event in database
        EventDAO eventDAO = new EventDAO();

        boolean success = eventDAO.updateEvent(event);

        // Redirect based on result
        if (success) {
            response.sendRedirect("ViewEventsServlet?updated=true");
        } else {
            response.sendRedirect("ViewEventsServlet?updated=false");
        }
    }
}