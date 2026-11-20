
package com.campusconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StudentEventRegisterServlet")
public class StudentEventRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentEmail") == null) {
            response.sendRedirect("student-login.jsp");
            return;
        }

        String eventIdText = request.getParameter("eventId");

        try {
            int eventId = Integer.parseInt(eventIdText);
            String email = (String) session.getAttribute("studentEmail");

            try (Connection con = DBConnection.getConnection()) {

                // Find the logged-in student.
                int studentId;

                String studentSql = "SELECT student_id FROM students WHERE email = ?";

                try (PreparedStatement ps = con.prepareStatement(studentSql)) {
                    ps.setString(1, email);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.next()) {
                            response.sendRedirect("student-login.jsp");
                            return;
                        }
                        studentId = rs.getInt("student_id");
                    }
                }

                // Check whether the event exists and get its capacity.
                int maxParticipants;

                String eventSql =
                        "SELECT max_participants FROM events WHERE event_id = ?";

                try (PreparedStatement ps = con.prepareStatement(eventSql)) {
                    ps.setInt(1, eventId);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.next()) {
                            response.sendRedirect(
                                    "StudentEventsServlet?message=invalid");
                            return;
                        }
                        maxParticipants = rs.getInt("max_participants");
                    }
                }

                // Check duplicate registration.
                String duplicateSql =
                        "SELECT registration_id FROM registrations "
                        + "WHERE student_id = ? AND event_id = ? "
                        + "AND status = 'REGISTERED'";

                try (PreparedStatement ps = con.prepareStatement(duplicateSql)) {
                    ps.setInt(1, studentId);
                    ps.setInt(2, eventId);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            response.sendRedirect(
                                    "StudentEventsServlet?message=duplicate");
                            return;
                        }
                    }
                }

                // Check available seats.
                String countSql =
                        "SELECT COUNT(*) FROM registrations "
                        + "WHERE event_id = ? AND status = 'REGISTERED'";

                try (PreparedStatement ps = con.prepareStatement(countSql)) {
                    ps.setInt(1, eventId);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next() && rs.getInt(1) >= maxParticipants) {
                            response.sendRedirect(
                                    "StudentEventsServlet?message=full");
                            return;
                        }
                    }
                }

                // Save registration.
                String insertSql =
                        "INSERT INTO registrations (student_id, event_id) "
                        + "VALUES (?, ?)";

                try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                    ps.setInt(1, studentId);
                    ps.setInt(2, eventId);

                    if (ps.executeUpdate() > 0) {
                        response.sendRedirect(
                                "StudentEventsServlet?message=success");
                    } else {
                        response.sendRedirect(
                                "StudentEventsServlet?message=failed");
                    }
                }

            }

        } catch (NumberFormatException e) {
            response.sendRedirect("StudentEventsServlet?message=invalid");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("StudentEventsServlet?message=failed");
        }
    }
}
