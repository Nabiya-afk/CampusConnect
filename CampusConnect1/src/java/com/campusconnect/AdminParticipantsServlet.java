
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

@WebServlet("/AdminParticipantsServlet")
public class AdminParticipantsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        List<Map<String, String>> participants = new ArrayList<>();

        String sql = "SELECT s.name, s.enrollment_no, s.email, "
                + "e.event_name, e.event_date, "
                + "r.registration_date, r.status "
                + "FROM registrations r "
                + "JOIN students s ON r.student_id = s.student_id "
                + "JOIN events e ON r.event_id = e.event_id "
                + "ORDER BY r.registration_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Map<String, String> participant = new HashMap<>();

                participant.put("name", rs.getString("name"));
                participant.put("enrollmentNo",
                        rs.getString("enrollment_no"));
                participant.put("email", rs.getString("email"));
                participant.put("eventName", rs.getString("event_name"));
                participant.put("eventDate", rs.getString("event_date"));
                participant.put("registrationDate",
                        rs.getString("registration_date"));
                participant.put("status", rs.getString("status"));

                participants.add(participant);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Unable to load participants.");
            return;
        }

        request.setAttribute("participantsList", participants);

        request.getRequestDispatcher("admin-participants.jsp")
                .forward(request, response);
    }
}
