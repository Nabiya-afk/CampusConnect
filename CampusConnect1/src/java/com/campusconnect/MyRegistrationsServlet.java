package com.campusconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyRegistrationsServlet")
public class MyRegistrationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("studentEmail") == null) {
            response.sendRedirect("student-login.jsp");
            return;
        }

        String email = (String) session.getAttribute("studentEmail");

        List<Map<String, String>> registrations = new ArrayList<>();

        String sql = "SELECT r.registration_id, e.event_name, e.description, "
                + "e.event_date, e.venue, "
                + "r.registration_date, r.status "
                + "FROM registrations r "
                + "JOIN students s ON r.student_id = s.student_id "
                + "JOIN events e ON r.event_id = e.event_id "
                + "WHERE s.email = ? "
                + "ORDER BY r.registration_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> registration = new HashMap<>();

                    registration.put("registrationId",
                            rs.getString("registration_id"));

                    registration.put("eventName",
                            rs.getString("event_name"));
                    registration.put("description",
                            rs.getString("description"));
                    registration.put("eventDate",
                            rs.getString("event_date"));
                    registration.put("venue",
                            rs.getString("venue"));
                    registration.put("registrationDate",
                            rs.getString("registration_date"));
                    registration.put("status",
                            rs.getString("status"));

                    registrations.add(registration);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Unable to load registrations.");
            return;
        }

        request.setAttribute("registrationsList", registrations);

        request.getRequestDispatcher("my-registrations.jsp")
                .forward(request, response);
    }
}