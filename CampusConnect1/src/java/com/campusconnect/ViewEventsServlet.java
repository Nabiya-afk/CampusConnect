package com.campusconnect;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewEventsServlet")
public class ViewEventsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EventDAO eventDAO = new EventDAO();

        List<Event> events = eventDAO.getAllEvents();

        request.setAttribute("events", events);

        request.getRequestDispatcher("view-events.jsp")
                .forward(request, response);
    }
}