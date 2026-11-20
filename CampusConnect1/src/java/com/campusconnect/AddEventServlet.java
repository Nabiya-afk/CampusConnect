package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("eventName");
        String description = request.getParameter("description");
        String eventDate = request.getParameter("eventDate");
        String venue = request.getParameter("venue");

        int maxParticipants =
                Integer.parseInt(request.getParameter("maxParticipants"));

        int adminId =
                Integer.parseInt(request.getParameter("adminId"));

        Event event = new Event(
                eventName,
                description,
                eventDate,
                venue,
                maxParticipants,
                adminId
        );

        EventDAO eventDAO = new EventDAO();

        boolean success = eventDAO.addEvent(event);

        if (success) {
            response.sendRedirect("add-event.jsp?success=true");
        } else {
            response.sendRedirect("add-event.jsp?success=false");
        }
    }
}